package com.aIresumeanalyzer.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.aIresumeanalyzer.entity.JobDescription;
import com.aIresumeanalyzer.entity.Resume;
import com.aIresumeanalyzer.entity.User;
import com.aIresumeanalyzer.repository.JobDescriptionRepository;
import com.aIresumeanalyzer.repository.ResumeRepository;
import com.aIresumeanalyzer.repository.UserRepository;
import com.aIresumeanalyzer.service.GeminiService;
import com.aIresumeanalyzer.service.PdfService;

import jakarta.servlet.http.HttpSession;

import com.aIresumeanalyzer.entity.ResumeRewrite;
import com.aIresumeanalyzer.repository.ResumeRewriteRepository;

@Controller
public class ResumeController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ResumeRepository resumeRepository;

    @Autowired
    private JobDescriptionRepository jobDescriptionRepository;

    @Autowired
    private PdfService pdfService;

    @Autowired
    private GeminiService geminiService;
    
    @Autowired
    private ResumeRewriteRepository resumeRewriteRepository;


    // =========================================================
    // HOME
    // =========================================================

    @GetMapping("/home")
    public String home(
            HttpSession session,
            Model model) {

        String email =
                (String) session.getAttribute("USEREMAIL");

        if (email == null) {
            return "redirect:/login";
        }

        User user =
                userRepository.findByEmail(email);

        if (user == null) {

            session.invalidate();

            return "redirect:/login";
        }

        model.addAttribute(
                "user",
                user
        );

        return "home";
    }


    // =========================================================
    // OPEN UPLOAD RESUME PAGE
    // =========================================================

    @GetMapping("/upload_resume")
    public String uploadResume(
            HttpSession session,
            Model model) {

        String email =
                (String) session.getAttribute("USEREMAIL");

        if (email == null) {
            return "redirect:/login";
        }

        User user =
                userRepository.findByEmail(email);

        if (user == null) {

            session.invalidate();

            return "redirect:/login";
        }

        model.addAttribute(
                "user",
                user
        );

        return "upload-resume";
    }


    // =========================================================
    // UPLOAD RESUME + AI ANALYSIS
    // =========================================================

    @PostMapping("/upload")
    public String uploadResume(
            @RequestParam("file") MultipartFile file,
            HttpSession session,
            Model model) {

        try {

            // -------------------------------------------------
            // CHECK LOGIN
            // -------------------------------------------------

            String email =
                    (String) session.getAttribute("USEREMAIL");

            if (email == null) {
                return "redirect:/login";
            }


            // -------------------------------------------------
            // FIND USER
            // -------------------------------------------------

            User user =
                    userRepository.findByEmail(email);

            if (user == null) {

                session.invalidate();

                return "redirect:/login";
            }


            // -------------------------------------------------
            // CHECK FILE
            // -------------------------------------------------

            if (file == null ||
                    file.isEmpty()) {

                model.addAttribute(
                        "error",
                        "Please select a resume PDF file."
                );

                model.addAttribute(
                        "user",
                        user
                );

                return "upload-resume";
            }


            // -------------------------------------------------
            // CHECK PDF
            // -------------------------------------------------

            String fileName =
                    file.getOriginalFilename();

            if (fileName == null ||
                    !fileName
                            .toLowerCase()
                            .endsWith(".pdf")) {

                model.addAttribute(
                        "error",
                        "Only PDF resume files are allowed."
                );

                model.addAttribute(
                        "user",
                        user
                );

                return "upload-resume";
            }


            // -------------------------------------------------
            // EXTRACT TEXT FROM PDF
            // -------------------------------------------------

            String resumeText =
                    pdfService.extractText(file);

            if (resumeText == null ||
                    resumeText.trim().isEmpty()) {

                model.addAttribute(
                        "error",
                        "Unable to extract text from the resume."
                );

                model.addAttribute(
                        "user",
                        user
                );

                return "upload-resume";
            }


            // -------------------------------------------------
            // GEMINI AI ANALYSIS
            // -------------------------------------------------

            String aiResult =
                    geminiService
                            .analyzeResume(resumeText);

            if (aiResult == null ||
                    aiResult.trim().isEmpty()) {

                model.addAttribute(
                        "error",
                        "AI analysis failed. Please try again."
                );

                model.addAttribute(
                        "user",
                        user
                );

                return "upload-resume";
            }


            // -------------------------------------------------
            // EXTRACT ATS SCORE
            // -------------------------------------------------

            Integer score =
                    extractATSScore(aiResult);


            // -------------------------------------------------
            // CREATE RESUME OBJECT
            // -------------------------------------------------

            Resume resume =
                    new Resume();

            resume.setFileName(
                    fileName
            );

            resume.setResumeText(
                    resumeText
            );

            resume.setAnalysisResult(
                    aiResult
            );

            resume.setResumeScore(
                    score
            );

            resume.setUploadedAt(
                    LocalDateTime.now()
            );

            resume.setUser(
                    user
            );


            // -------------------------------------------------
            // SAVE RESUME INTO DATABASE
            // -------------------------------------------------

            resumeRepository.save(
                    resume
            );


            // -------------------------------------------------
            // SEND DATA TO JSP
            // -------------------------------------------------

            model.addAttribute(
                    "user",
                    user
            );

            model.addAttribute(
                    "resume",
                    resume
            );

            model.addAttribute(
                    "resumeText",
                    resumeText
            );

            model.addAttribute(
                    "aiResult",
                    aiResult
            );

            model.addAttribute(
                    "resumeScore",
                    score
            );

            model.addAttribute(
                    "success",
                    "Resume analyzed successfully!"
            );


            // -------------------------------------------------
            // SHOW RESULT PAGE
            // -------------------------------------------------

            return "upload-success";


        } catch (Exception e) {

            e.printStackTrace();

            model.addAttribute(
                    "error",
                    "Something went wrong while analyzing the resume."
            );

            return "error";
        }
    }


    // =========================================================
    // ATS SCORE EXTRACTION
    // =========================================================

    private Integer extractATSScore(
            String aiResult) {

        if (aiResult == null ||
                aiResult.trim().isEmpty()) {

            return 0;
        }


        Pattern pattern =
                Pattern.compile(
                        "ATS\\s*SCORE\\s*:\\s*"
                        + "(?:\\r?\\n\\s*)?"
                        + "(\\d{1,3})"
                        + "\\s*/\\s*100",
                        Pattern.CASE_INSENSITIVE
                );


        Matcher matcher =
                pattern.matcher(aiResult);


        if (matcher.find()) {

            try {

                int score =
                        Integer.parseInt(
                                matcher.group(1)
                        );


                if (score < 0) {
                    score = 0;
                }

                if (score > 100) {
                    score = 100;
                }


                return score;

            } catch (NumberFormatException e) {

                return 0;
            }
        }


        return 0;
    }


    // =========================================================
    // ROBUST JOB MATCH SCORE EXTRACTION
    // =========================================================

    private Integer extractJobMatchScore(
            String matchResult) {

        if (matchResult == null ||
                matchResult.trim().isEmpty()) {

            return 0;
        }


        /*
         * Supported Gemini responses:
         *
         * JOB MATCH SCORE: 85/100
         *
         * JOB MATCH SCORE : 85/100
         *
         * JOB MATCH SCORE = 85/100
         *
         * JOB MATCH SCORE - 85/100
         *
         * JOB MATCH SCORE:
         * 85/100
         *
         * JOB MATCH SCORE: **85/100**
         *
         * JOB MATCH SCORE: 85
         *
         * Job Match Score: 90 / 100
         */


        Pattern pattern =
                Pattern.compile(
                        "JOB\\s*MATCH\\s*SCORE"
                        + "\\s*(?::|=|-)?"
                        + "\\s*\\**"
                        + "(\\d{1,3})"
                        + "\\s*(?:/\\s*100)?"
                        + "\\**",
                        Pattern.CASE_INSENSITIVE
                );


        Matcher matcher =
                pattern.matcher(matchResult);


        if (matcher.find()) {

            try {

                int score =
                        Integer.parseInt(
                                matcher.group(1)
                        );


                if (score < 0) {
                    score = 0;
                }

                if (score > 100) {
                    score = 100;
                }


                return score;

            } catch (NumberFormatException e) {

                return 0;
            }
        }


        // -----------------------------------------------------
        // FALLBACK PATTERN
        // -----------------------------------------------------

        Pattern fallbackPattern =
                Pattern.compile(
                        "(?:JOB\\s*)?MATCH\\s*SCORE"
                        + "\\s*(?::|=|-)?"
                        + "\\s*\\**"
                        + "(\\d{1,3})"
                        + "\\s*(?:/\\s*100)?",
                        Pattern.CASE_INSENSITIVE
                );


        Matcher fallbackMatcher =
                fallbackPattern.matcher(matchResult);


        if (fallbackMatcher.find()) {

            try {

                int score =
                        Integer.parseInt(
                                fallbackMatcher.group(1)
                        );


                if (score < 0) {
                    score = 0;
                }

                if (score > 100) {
                    score = 100;
                }


                return score;

            } catch (NumberFormatException e) {

                return 0;
            }
        }


        return 0;
    }


    // =========================================================
    // OPEN JOB MATCHING PAGE
    // =========================================================

    @GetMapping("/job-matching")
    public String jobMatchingPage(
            HttpSession session,
            Model model) {

        // -----------------------------------------------------
        // CHECK LOGIN
        // -----------------------------------------------------

        String email =
                (String) session.getAttribute("USEREMAIL");

        if (email == null) {

            return "redirect:/login";
        }


        // -----------------------------------------------------
        // FIND LOGGED-IN USER
        // -----------------------------------------------------

        User user =
                userRepository.findByEmail(email);

        if (user == null) {

            session.invalidate();

            return "redirect:/login";
        }


        // -----------------------------------------------------
        // GET USER'S LATEST RESUME
        // -----------------------------------------------------

        List<Resume> resumes =
                resumeRepository
                        .findByUserOrderByUploadedAtDesc(
                                user
                        );


        if (resumes == null ||
                resumes.isEmpty()) {

            model.addAttribute(
                    "error",
                    "Please upload and analyze a resume first."
            );

            model.addAttribute(
                    "user",
                    user
            );

            return "upload-resume";
        }


        Resume latestResume =
                resumes.get(0);


        // -----------------------------------------------------
        // SEND DATA TO JSP
        // -----------------------------------------------------

        model.addAttribute(
                "user",
                user
        );

        model.addAttribute(
                "resume",
                latestResume
        );


        return "job-matching";
    }


    // =========================================================
    // RESUME HISTORY
    // =========================================================

    @GetMapping("/resume-history")
    public String resumeHistory(
            HttpSession session,
            Model model) {

        // -----------------------------------------------------
        // CHECK LOGIN
        // -----------------------------------------------------

        String email =
                (String) session.getAttribute("USEREMAIL");

        if (email == null) {

            return "redirect:/login";
        }


        // -----------------------------------------------------
        // FIND USER
        // -----------------------------------------------------

        User user =
                userRepository.findByEmail(email);


        if (user == null) {

            session.invalidate();

            return "redirect:/login";
        }


        // -----------------------------------------------------
        // GET USER RESUMES
        // -----------------------------------------------------

        List<Resume> resumes =
                resumeRepository
                        .findByUserOrderByUploadedAtDesc(
                                user
                        );


        // -----------------------------------------------------
        // SEND DATA TO JSP
        // -----------------------------------------------------

        model.addAttribute(
                "user",
                user
        );

        model.addAttribute(
                "resumes",
                resumes
        );


        return "resume-history";
    }


    // =========================================================
    // VIEW PARTICULAR RESUME ANALYSIS
    // =========================================================

    @GetMapping("/resume/{id}")
    public String viewResume(
            @PathVariable Long id,
            HttpSession session,
            Model model) {

        // -----------------------------------------------------
        // CHECK LOGIN
        // -----------------------------------------------------

        String email =
                (String) session.getAttribute("USEREMAIL");


        if (email == null) {

            return "redirect:/login";
        }


        // -----------------------------------------------------
        // FIND LOGGED-IN USER
        // -----------------------------------------------------

        User user =
                userRepository.findByEmail(email);


        if (user == null) {

            session.invalidate();

            return "redirect:/login";
        }


        // -----------------------------------------------------
        // FIND RESUME
        // -----------------------------------------------------

        Resume resume =
                resumeRepository
                        .findById(id)
                        .orElse(null);


        if (resume == null) {

            model.addAttribute(
                    "error",
                    "Resume not found."
            );

            return "error";
        }


        // -----------------------------------------------------
        // SECURITY CHECK
        // -----------------------------------------------------

        if (resume.getUser() == null ||
                resume.getUser().getId() == null ||
                !resume.getUser()
                        .getId()
                        .equals(user.getId())) {

            model.addAttribute(
                    "error",
                    "You are not authorized to view this resume."
            );

            return "error";
        }


        // -----------------------------------------------------
        // SEND DATA TO JSP
        // -----------------------------------------------------

        model.addAttribute(
                "user",
                user
        );

        model.addAttribute(
                "resume",
                resume
        );

        model.addAttribute(
                "resumeText",
                resume.getResumeText()
        );

        model.addAttribute(
                "aiResult",
                resume.getAnalysisResult()
        );


        // ATS score database se directly aa raha hai

        model.addAttribute(
                "resumeScore",
                resume.getResumeScore()
        );


        model.addAttribute(
                "success",
                "Resume analysis loaded successfully."
        );


        return "upload-success";
    }


 // =========================================================
 // ANALYZE JOB MATCH
 // =========================================================

 @PostMapping("/analyze-job-match")
 public String analyzeJobMatch(
         @RequestParam("resumeId") Long resumeId,
         @RequestParam("jobTitle") String jobTitle,
         @RequestParam("description") String description,
         HttpSession session,
         Model model) {

     try {

         // -------------------------------------------------
         // CHECK LOGIN
         // -------------------------------------------------

         String email =
                 (String) session.getAttribute("USEREMAIL");

         if (email == null) {
             return "redirect:/login";
         }


         // -------------------------------------------------
         // FIND USER
         // -------------------------------------------------

         User user =
                 userRepository.findByEmail(email);

         if (user == null) {

             session.invalidate();

             return "redirect:/login";
         }


         // -------------------------------------------------
         // VALIDATE JOB TITLE
         // -------------------------------------------------

         if (jobTitle == null ||
                 jobTitle.trim().isEmpty()) {

             model.addAttribute(
                     "error",
                     "Please enter a job title."
             );

             model.addAttribute(
                     "user",
                     user
             );

             Resume resume =
                     resumeRepository
                             .findById(resumeId)
                             .orElse(null);

             model.addAttribute(
                     "resume",
                     resume
             );

             return "job-matching";
         }


         // -------------------------------------------------
         // VALIDATE JOB DESCRIPTION
         // -------------------------------------------------

         if (description == null ||
                 description.trim().isEmpty()) {

             model.addAttribute(
                     "error",
                     "Please enter a job description."
             );

             model.addAttribute(
                     "user",
                     user
             );

             Resume resume =
                     resumeRepository
                             .findById(resumeId)
                             .orElse(null);

             model.addAttribute(
                     "resume",
                     resume
             );

             return "job-matching";
         }


         // -------------------------------------------------
         // FIND RESUME
         // -------------------------------------------------

         Resume resume =
                 resumeRepository
                         .findById(resumeId)
                         .orElse(null);


         if (resume == null) {

             model.addAttribute(
                     "error",
                     "Resume not found."
             );

             return "error";
         }


         // -------------------------------------------------
         // SECURITY CHECK
         // -------------------------------------------------

         if (resume.getUser() == null ||
                 resume.getUser().getId() == null ||
                 !resume.getUser()
                         .getId()
                         .equals(user.getId())) {

             model.addAttribute(
                     "error",
                     "You are not authorized to analyze this resume."
             );

             return "error";
         }


         // -------------------------------------------------
         // CHECK RESUME TEXT
         // -------------------------------------------------

         if (resume.getResumeText() == null ||
                 resume.getResumeText()
                         .trim()
                         .isEmpty()) {

             model.addAttribute(
                     "error",
                     "Resume text is not available."
             );

             return "error";
         }


         // -------------------------------------------------
         // GEMINI JOB MATCH ANALYSIS
         // -------------------------------------------------

         String matchResult =
                 geminiService.analyzeJobMatch(
                         resume.getResumeText(),
                         jobTitle,
                         description
                 );


         if (matchResult == null ||
                 matchResult.trim().isEmpty()) {

             model.addAttribute(
                     "error",
                     "Job matching analysis failed. Please try again."
             );

             return "error";
         }


         // -------------------------------------------------
         // EXTRACT JOB MATCH SCORE
         // -------------------------------------------------

         Integer matchScore =
                 extractJobMatchScore(matchResult);


         // -------------------------------------------------
         // SAVE JOB DESCRIPTION
         // -------------------------------------------------

         JobDescription job =
                 new JobDescription();

         job.setJobTitle(
                 jobTitle.trim()
         );

         job.setDescription(
                 description.trim()
         );

         job.setCreatedAt(
                 LocalDateTime.now()
         );

         job.setUser(
                 user
         );

         jobDescriptionRepository.save(job);


         // -------------------------------------------------
         // EXTRACT AI SECTIONS
         // -------------------------------------------------

         String matchingSkills =
                 extractAISection(
                         matchResult,
                         "MATCHING SKILLS",
                         "MISSING SKILLS"
                 );


         String missingSkills =
                 extractAISection(
                         matchResult,
                         "MISSING SKILLS",
                         "MATCHING EXPERIENCE"
                 );


         String matchingExperience =
                 extractAISection(
                         matchResult,
                         "MATCHING EXPERIENCE",
                         "EXPERIENCE GAP"
                 );


         String experienceGap =
                 extractAISection(
                         matchResult,
                         "EXPERIENCE GAP",
                         "MATCHING PROJECTS"
                 );


         String matchingProjects =
                 extractAISection(
                         matchResult,
                         "MATCHING PROJECTS",
                         "SKILL GAP ANALYSIS"
                 );


         String skillGap =
                 extractAISection(
                         matchResult,
                         "SKILL GAP ANALYSIS",
                         "LEARNING GAP"
                 );


         String learningGap =
                 extractAISection(
                         matchResult,
                         "LEARNING GAP",
                         "LEARNING PRIORITY"
                 );


         String learningPriority =
                 extractAISection(
                         matchResult,
                         "LEARNING PRIORITY",
                         "RECOMMENDATIONS"
                 );


         String recommendations =
                 extractAISection(
                         matchResult,
                         "RECOMMENDATIONS",
                         "FINAL ASSESSMENT"
                 );


         String finalAssessment =
                 extractAISection(
                         matchResult,
                         "FINAL ASSESSMENT",
                         "JOB MATCH SCORE RULES"
                 );


         // -------------------------------------------------
         // SEND DATA TO JSP
         // -------------------------------------------------

         model.addAttribute(
                 "user",
                 user
         );

         model.addAttribute(
                 "resume",
                 resume
         );

         model.addAttribute(
                 "jobTitle",
                 jobTitle
         );

         model.addAttribute(
                 "jobDescription",
                 description
         );

         model.addAttribute(
                 "matchScore",
                 matchScore
         );

         model.addAttribute(
                 "matchingSkills",
                 matchingSkills
         );

         model.addAttribute(
                 "missingSkills",
                 missingSkills
         );

         model.addAttribute(
                 "matchingExperience",
                 matchingExperience
         );

         model.addAttribute(
                 "experienceGap",
                 experienceGap
         );

         model.addAttribute(
                 "matchingProjects",
                 matchingProjects
         );

         model.addAttribute(
                 "skillGap",
                 skillGap
         );

         model.addAttribute(
                 "learningGap",
                 learningGap
         );

         model.addAttribute(
                 "learningPriority",
                 learningPriority
         );

         model.addAttribute(
                 "recommendations",
                 recommendations
         );

         model.addAttribute(
                 "finalAssessment",
                 finalAssessment
         );


         // -------------------------------------------------
         // SHOW RESULT PAGE
         // -------------------------------------------------

         return "job-match-result";


     } catch (Exception e) {

         e.printStackTrace();

         model.addAttribute(
                 "error",
                 "Something went wrong while analyzing the job match."
         );

         return "error";
     }
 }

    // =========================================================
    // OPEN AI INTERVIEW QUESTION GENERATOR
    // =========================================================

    @GetMapping("/interview-questions")
    public String interviewQuestionsPage(
            HttpSession session,
            Model model) {

        String email =
                (String) session.getAttribute("USEREMAIL");

        if (email == null) {
            return "redirect:/login";
        }

        User user =
                userRepository.findByEmail(email);

        if (user == null) {

            session.invalidate();

            return "redirect:/login";
        }

        List<Resume> resumes =
                resumeRepository
                        .findByUserOrderByUploadedAtDesc(user);

        if (resumes == null || resumes.isEmpty()) {

            model.addAttribute(
                    "error",
                    "Please upload and analyze a resume first."
            );

            model.addAttribute(
                    "user",
                    user
            );

            return "upload-resume";
        }

        Resume latestResume =
                resumes.get(0);

        model.addAttribute(
                "user",
                user
        );

        model.addAttribute(
                "resume",
                latestResume
        );

        return "interview-questions";
    }


    // =========================================================
    // GENERATE AI INTERVIEW QUESTIONS
    // =========================================================

    @PostMapping("/generate-interview-questions")
    public String generateInterviewQuestions(
            @RequestParam("resumeId") Long resumeId,
            @RequestParam("questionType") String questionType,
            @RequestParam("difficulty") String difficulty,
            @RequestParam("numberOfQuestions") int numberOfQuestions,
            @RequestParam(value = "jobTitle", required = false)
                    String jobTitle,
            @RequestParam(value = "jobDescription", required = false)
                    String jobDescription,
            HttpSession session,
            Model model) {

        try {

            // -------------------------------------------------
            // CHECK LOGIN
            // -------------------------------------------------

            String email =
                    (String) session.getAttribute("USEREMAIL");

            if (email == null) {
                return "redirect:/login";
            }


            // -------------------------------------------------
            // FIND USER
            // -------------------------------------------------

            User user =
                    userRepository.findByEmail(email);

            if (user == null) {

                session.invalidate();

                return "redirect:/login";
            }


            // -------------------------------------------------
            // VALIDATE NUMBER OF QUESTIONS
            // -------------------------------------------------

            if (numberOfQuestions < 1 ||
                    numberOfQuestions > 20) {

                numberOfQuestions = 10;
            }


            // -------------------------------------------------
            // FIND RESUME
            // -------------------------------------------------

            Resume resume =
                    resumeRepository
                            .findById(resumeId)
                            .orElse(null);


            if (resume == null) {

                model.addAttribute(
                        "error",
                        "Resume not found."
                );

                return "error";
            }


            // -------------------------------------------------
            // SECURITY CHECK
            // -------------------------------------------------

            if (resume.getUser() == null ||
                    resume.getUser().getId() == null ||
                    !resume.getUser()
                            .getId()
                            .equals(user.getId())) {

                model.addAttribute(
                        "error",
                        "You are not authorized to use this resume."
                );

                return "error";
            }


            // -------------------------------------------------
            // CHECK RESUME TEXT
            // -------------------------------------------------

            if (resume.getResumeText() == null ||
                    resume.getResumeText().trim().isEmpty()) {

                model.addAttribute(
                        "error",
                        "Resume text is not available."
                );

                return "error";
            }


            // -------------------------------------------------
            // GENERATE QUESTIONS USING GEMINI
            // -------------------------------------------------

            String questionResult =
                    geminiService.generateInterviewQuestions(
                            resume.getResumeText(),
                            questionType,
                            difficulty,
                            numberOfQuestions,
                            jobTitle,
                            jobDescription
                    );


            if (questionResult == null ||
                    questionResult.trim().isEmpty()) {

                model.addAttribute(
                        "error",
                        "Unable to generate interview questions. Please try again."
                );

                return "error";
            }


            // -------------------------------------------------
            // SEND DATA TO JSP
            // -------------------------------------------------

            model.addAttribute(
                    "user",
                    user
            );

            model.addAttribute(
                    "resume",
                    resume
            );

            model.addAttribute(
                    "questionType",
                    questionType
            );

            model.addAttribute(
                    "difficulty",
                    difficulty
            );

            model.addAttribute(
                    "numberOfQuestions",
                    numberOfQuestions
            );

            model.addAttribute(
                    "jobTitle",
                    jobTitle
            );

            model.addAttribute(
                    "jobDescription",
                    jobDescription
            );

            model.addAttribute(
                    "questionResult",
                    questionResult
            );


            return "interview-question-result";


        } catch (Exception e) {

            e.printStackTrace();

            model.addAttribute(
                    "error",
                    "Something went wrong while generating interview questions."
            );

            return "error";
        }
    }
    
 // =========================================================
 // OPEN AI RESUME REWRITER PAGE
 // =========================================================

 @GetMapping("/resume-rewriter")
 public String resumeRewriterPage(
         HttpSession session,
         Model model) {

     String email =
             (String) session.getAttribute("USEREMAIL");

     if (email == null) {
         return "redirect:/login";
     }

     User user =
             userRepository.findByEmail(email);

     if (user == null) {

         session.invalidate();

         return "redirect:/login";
     }

     List<Resume> resumes =
             resumeRepository
                     .findByUserOrderByUploadedAtDesc(user);

     if (resumes == null || resumes.isEmpty()) {

         model.addAttribute(
                 "error",
                 "Please upload and analyze a resume first."
         );

         model.addAttribute(
                 "user",
                 user
         );

         return "upload-resume";
     }

     model.addAttribute(
             "user",
             user
     );

     model.addAttribute(
             "resumes",
             resumes
     );

     return "resume-rewriter";
 }


 // =========================================================
 // AI RESUME REWRITER
 // =========================================================

 @PostMapping("/rewrite-resume")
 public String rewriteResume(
         @RequestParam("resumeId") Long resumeId,
         @RequestParam(value = "jobTitle", required = false)
                 String jobTitle,
         @RequestParam(value = "jobDescription", required = false)
                 String jobDescription,
         HttpSession session,
         Model model) {

     try {

         String email =
                 (String) session.getAttribute("USEREMAIL");

         if (email == null) {
             return "redirect:/login";
         }

         User user =
                 userRepository.findByEmail(email);

         if (user == null) {

             session.invalidate();

             return "redirect:/login";
         }

         Resume resume =
                 resumeRepository
                         .findById(resumeId)
                         .orElse(null);

         if (resume == null) {

             model.addAttribute(
                     "error",
                     "Resume not found."
             );

             return "error";
         }

         // -------------------------------------------------
         // SECURITY CHECK
         // -------------------------------------------------

         if (resume.getUser() == null ||
                 resume.getUser().getId() == null ||
                 !resume.getUser()
                         .getId()
                         .equals(user.getId())) {

             model.addAttribute(
                     "error",
                     "You are not authorized to rewrite this resume."
             );

             return "error";
         }

         // -------------------------------------------------
         // CHECK RESUME TEXT
         // -------------------------------------------------

         if (resume.getResumeText() == null ||
                 resume.getResumeText().trim().isEmpty()) {

             model.addAttribute(
                     "error",
                     "Resume text is not available."
             );

             return "error";
         }

         if (jobTitle == null) {
             jobTitle = "";
         }

         if (jobDescription == null) {
             jobDescription = "";
         }

         // -------------------------------------------------
         // GEMINI AI RESUME REWRITING
         // -------------------------------------------------

         String rewrittenResume =
                 geminiService.rewriteResume(
                         resume.getResumeText(),
                         jobTitle.trim(),
                         jobDescription.trim()
                 );

         if (rewrittenResume == null ||
                 rewrittenResume.trim().isEmpty()) {

             model.addAttribute(
                     "error",
                     "Unable to rewrite resume. Please try again."
             );

             return "error";
         }

         // -------------------------------------------------
         // SAVE REWRITTEN RESUME
         // -------------------------------------------------

         ResumeRewrite resumeRewrite =
                 new ResumeRewrite();

         resumeRewrite.setResume(resume);

         resumeRewrite.setJobTitle(
                 jobTitle.trim().isEmpty()
                         ? null
                         : jobTitle.trim()
         );

         resumeRewrite.setJobDescription(
                 jobDescription.trim().isEmpty()
                         ? null
                         : jobDescription.trim()
         );

         resumeRewrite.setRewrittenResume(
                 rewrittenResume
         );

         resumeRewrite.setCreatedAt(
                 LocalDateTime.now()
         );

         resumeRewriteRepository.save(
                 resumeRewrite
         );

         // -------------------------------------------------
         // SEND DATA TO RESULT JSP
         // -------------------------------------------------

         model.addAttribute(
                 "user",
                 user
         );

         model.addAttribute(
                 "resume",
                 resume
         );

         model.addAttribute(
                 "resumeRewrite",
                 resumeRewrite
         );

         model.addAttribute(
                 "rewrittenResume",
                 rewrittenResume
         );

         model.addAttribute(
                 "jobTitle",
                 jobTitle
         );

         model.addAttribute(
                 "jobDescription",
                 jobDescription
         );

         return "resume-rewriter-result";

     } catch (Exception e) {

         e.printStackTrace();

         model.addAttribute(
                 "error",
                 "Something went wrong while rewriting the resume."
         );

         return "error";
     }
 }
 
//=========================================================
//EXTRACT AI RESULT SECTION
//=========================================================

private String extractAISection(
      String result,
      String startHeading,
      String endHeading) {

  if (result == null ||
          result.trim().isEmpty()) {

      return "No information available.";
  }


  String upperResult =
          result.toUpperCase();


  String start =
          startHeading.toUpperCase();


  String end =
          endHeading.toUpperCase();


  int startIndex =
          upperResult.indexOf(start);


  if (startIndex == -1) {

      return "No information available.";
  }


  startIndex =
          startIndex + start.length();


  int endIndex =
          upperResult.indexOf(
                  end,
                  startIndex
          );


  String section;


  if (endIndex == -1) {

      section =
              result.substring(
                      startIndex
              );

  } else {

      section =
              result.substring(
                      startIndex,
                      endIndex
              );
  }


  // Remove markdown symbols
  section =
          section.replace(
                  "###",
                  ""
          );


  section =
          section.replace(
                  "**",
                  ""
          );


  return section.trim();
}
}
