package com.aIresumeanalyzer.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.genai.Client;
import com.google.genai.types.GenerateContentResponse;

@Service
public class GeminiService {

    private final Client client;


    // =====================================================
    // GEMINI CLIENT
    // =====================================================

    public GeminiService(
            @Value("${gemini.api-key}") String apiKey) {

        client = Client.builder()
                .apiKey(apiKey)
                .build();
    }


    // =====================================================
    // GEMINI TEST
    // =====================================================

    public String testGemini() {

        try {

            GenerateContentResponse response =
                    client.models.generateContent(
                            "gemini-3.5-flash-lite",
                            "Say Hello. This is a test message.",
                            null
                    );

            return response.text();

        } catch (Exception e) {

            e.printStackTrace();

            return "Gemini Error: " + e.getMessage();
        }
    }


    // =====================================================
    // AI RESUME ANALYZER
    // =====================================================

    public String analyzeResume(String resumeText) {

        String prompt = """
                You are an expert AI Resume Analyzer,
                ATS consultant, career advisor, and recruitment specialist.

                Analyze the candidate's resume carefully.

                IMPORTANT RULES:

                1. Analyze ONLY the information available in the resume.
                2. Do NOT invent skills, qualifications, education,
                   certifications, projects, companies or experience.
                3. Keep the analysis professional and practical.
                4. Identify both strengths and weaknesses.
                5. Give useful ATS improvement suggestions.
                6. The ATS score must be based on resume quality,
                   structure, skills, keywords, experience,
                   projects, education and ATS readability.

                =====================================================
                REQUIRED OUTPUT FORMAT
                =====================================================

                ATS SCORE: [number]/100

                PROFILE SUMMARY:
                Give a short professional summary of the candidate
                based only on the resume.

                TECHNICAL SKILLS:
                List the technical skills clearly.

                SKILL ANALYSIS:
                Analyze the candidate's technical skills and mention
                whether the skill set is strong, moderate or needs
                improvement.

                EXPERIENCE ANALYSIS:
                Analyze the candidate's work or internship experience.
                Mention relevant technologies, responsibilities and
                practical exposure found in the resume.

                PROJECT ANALYSIS:
                Analyze the projects mentioned in the resume.
                Explain how technically relevant and useful they are.

                EDUCATION ANALYSIS:
                Analyze the candidate's educational qualifications.

                KEYWORD ANALYSIS:
                Identify important technical and professional keywords
                already present in the resume.

                MISSING SKILLS:
                List important skills that could improve the candidate's
                profile. Clearly mention that these are suggestions and
                are NOT necessarily missing requirements from a specific
                job description.

                STRENGTHS:
                List the strongest points of the resume.

                WEAKNESSES:
                List weaknesses, missing details, formatting problems,
                lack of measurable achievements, or other issues
                visible in the resume.

                ATS IMPROVEMENTS:
                Give practical suggestions to improve ATS compatibility,
                including keywords, formatting, headings, readability,
                skills and achievement-oriented descriptions.

                RESUME IMPROVEMENTS:
                Give specific suggestions for improving the resume
                content and presentation.

                FINAL RECOMMENDATION:
                Give a short overall recommendation describing what the
                candidate should improve first.

                =====================================================
                ATS SCORE RULES
                =====================================================

                - ATS SCORE must be a number between 0 and 100.
                - The score must appear on ONE LINE.
                - Use EXACTLY this format:

                  ATS SCORE: 85/100

                - Replace 85 with the actual calculated score.
                - Do NOT write the score on a separate line.
                - Do NOT use percentages such as 85%.
                - Do NOT write additional text on the ATS SCORE line.
                - Do NOT use markdown symbols on the ATS SCORE line.

                =====================================================
                SCORING GUIDELINES
                =====================================================

                Consider the following factors while calculating
                the ATS score:

                1. Resume structure and readability
                2. Relevant technical skills
                3. Relevant keywords
                4. Education
                5. Internship/work experience
                6. Projects
                7. Certifications
                8. Achievement-oriented content
                9. ATS-friendly formatting
                10. Overall professional quality

                The score should be realistic.
                Do not give 90+ unless the resume is genuinely strong.

                =====================================================
                RESUME TEXT
                =====================================================

                """ + resumeText;


        try {

            GenerateContentResponse response =
                    client.models.generateContent(
                            "gemini-3.5-flash-lite",
                            prompt,
                            null
                    );

            return response.text();

        } catch (Exception e) {

            e.printStackTrace();

            return "Error while analyzing resume: "
                    + e.getMessage();
        }
    }


    // =====================================================
    // JOB DESCRIPTION MATCHING
    // =====================================================

    public String analyzeJobMatch(
            String resumeText,
            String jobTitle,
            String jobDescription) {


        String prompt = """
                You are an expert AI Resume Analyzer, ATS consultant,
                and recruitment specialist.

                Your task is to compare the candidate's resume with the
                provided job description.

                Analyze ONLY the information provided.

                Do not invent skills, experience, qualifications,
                projects, certifications, or technologies.

                =====================================================
                JOB TITLE
                =====================================================

                %s


                =====================================================
                JOB DESCRIPTION
                =====================================================

                %s


                =====================================================
                CANDIDATE RESUME
                =====================================================

                %s


                =====================================================
                REQUIRED OUTPUT FORMAT
                =====================================================

                JOB MATCH SCORE: [number]/100

                MATCHING SKILLS:
                - List the skills present in both the resume and
                  job description.

                MISSING SKILLS:
                - List important skills required by the job description
                  but missing from the resume.

                MATCHING EXPERIENCE:
                - Explain how the candidate's experience matches
                  the job.

                EXPERIENCE GAP:
                - Mention important experience requirements that are
                  missing or insufficient.

                MATCHING PROJECTS:
                - Identify resume projects relevant to the job description.

                SKILL GAP ANALYSIS:
                - Explain the major technical or professional gaps.

        		LEARNING GAP:
                - Identify the important missing skills that the candidate
                  should learn to become better prepared for this job.
                - For each learning area, provide:
                  1. Skill or technology name
                  2. What the candidate should learn
                  3. Why it is relevant to the target job
                - Keep the learning suggestions directly related to the
                  missing skills and job requirements.
                - Do not recommend skills that are unrelated to the job.

                LEARNING PRIORITY:
                - Arrange the identified learning areas from highest
                  priority to lowest priority.
                - Give a maximum of 5 learning areas.
                - Do not create a learning plan for skills that are already
                  clearly present in the resume.


                RECOMMENDATIONS:
                - Give practical suggestions to improve the candidate's
                  chances for this job.

                FINAL ASSESSMENT:
                - Give a short overall assessment of the candidate's
                  suitability for this job.

                =====================================================
                JOB MATCH SCORE RULES
                =====================================================

                - JOB MATCH SCORE must be between 0 and 100.
                - The score must appear on ONE LINE.
                - Use exactly this format:

                  JOB MATCH SCORE: 85/100

                - Replace 85 with the actual calculated score.
                - Do not use another format.
                - Do not add additional text on the score line.

                Be accurate, professional, and objective.
                """.formatted(
                        jobTitle,
                        jobDescription,
                        resumeText
                );


        try {

            GenerateContentResponse response =
                    client.models.generateContent(
                            "gemini-3.5-flash-lite",
                            prompt,
                            null
                    );

            return response.text();

        } catch (Exception e) {

            e.printStackTrace();

            return "Error while analyzing job match: "
                    + e.getMessage();
        }
    }
    
 // =====================================================
 // AI INTERVIEW QUESTION GENERATOR
 // =====================================================

 public String generateInterviewQuestions(
         String resumeText,
         String questionType,
         String difficulty,
         int numberOfQuestions,
         String jobTitle,
         String jobDescription) {

     String prompt = """
             You are an expert technical interviewer,
             HR interviewer, career coach, and recruitment specialist.

             Generate realistic interview questions for the candidate
             based ONLY on the candidate's resume and the optional
             job description.

             =====================================================
             CANDIDATE RESUME
             =====================================================

             %s

             =====================================================
             QUESTION TYPE
             =====================================================

             %s

             =====================================================
             DIFFICULTY
             =====================================================

             %s

             =====================================================
             NUMBER OF QUESTIONS
             =====================================================

             %d

             =====================================================
             JOB TITLE
             =====================================================

             %s

             =====================================================
             JOB DESCRIPTION
             =====================================================

             %s

             =====================================================
             IMPORTANT RULES
             =====================================================

             1. Questions must be relevant to the candidate's resume.

             2. Do NOT invent technologies, projects, companies,
                certifications, education, experience, or skills
                that are not present in the resume.

             3. If the question type is PROJECT, ask questions about
                projects actually mentioned in the resume.

             4. If the question type is TECHNICAL, ask technical
                questions related to technologies actually present
                in the resume.

             5. If the question type is RESUME, ask questions that
                an interviewer may ask after reading the candidate's
                resume.

             6. If the question type is HR, ask realistic fresher-level
                HR and behavioral interview questions.

             7. If the question type is JOB-SPECIFIC and a job
                description is provided, generate questions based on
                the job requirements and the candidate's resume.

             8. If the job description is empty, do not create fake
                job requirements.

             9. Answers must be interview-friendly and practical.

             10. Answers should help the candidate understand how
                 to answer the question, but should not falsely claim
                 experience the candidate does not have.

             11. Keep questions suitable for a fresher/MCA candidate.

             =====================================================
             REQUIRED OUTPUT FORMAT
             =====================================================

             QUESTION 1:
             [Interview question]

             DIFFICULTY:
             [Easy/Medium/Hard]

             ANSWER:
             [AI-generated interview-friendly answer]

             QUESTION 2:
             [Interview question]

             DIFFICULTY:
             [Easy/Medium/Hard]

             ANSWER:
             [AI-generated interview-friendly answer]

             Continue the same format for all questions.

             =====================================================
             FINAL RULE
             =====================================================

             Generate exactly %d questions.

             Do not add unnecessary introduction or conclusion.
             Follow the required output format exactly.
             """.formatted(
                     resumeText,
                     questionType,
                     difficulty,
                     numberOfQuestions,
                     jobTitle == null ? "" : jobTitle,
                     jobDescription == null ? "" : jobDescription,
                     numberOfQuestions
             );

     try {

         GenerateContentResponse response =
                 client.models.generateContent(
                         "gemini-3.5-flash-lite",
                         prompt,
                         null
                 );

         return response.text();

     } catch (Exception e) {

         e.printStackTrace();

         return "Error while generating interview questions: "
                 + e.getMessage();
     }
 }
 
 // =====================================================
 // AI RESUME REWRITER
 // =====================================================

 public String rewriteResume(
         String resumeText,
         String jobTitle,
         String jobDescription) {

     String prompt = """
             You are an expert professional resume writer,
             ATS optimization specialist, career advisor,
             and recruitment consultant.

             Your task is to professionally rewrite the candidate's
             existing resume using ONLY the information provided
             in the original resume.

             The goal is to improve:
             - Professional language
             - Resume structure
             - Clarity
             - ATS readability
             - Achievement-oriented wording
             - Technical presentation
             - Job relevance

             =====================================================
             ORIGINAL RESUME
             =====================================================

             %s

             =====================================================
             TARGET JOB TITLE
             =====================================================

             %s

             =====================================================
             JOB DESCRIPTION
             =====================================================

             %s

             =====================================================
             IMPORTANT RULES
             =====================================================

             1. Use ONLY information available in the original resume.

             2. DO NOT invent or add:
                - Skills
                - Technologies
                - Projects
                - Companies
                - Job roles
                - Work experience
                - Internship experience
                - Certifications
                - Education
                - Achievements
                - Awards
                - Responsibilities
                - Tools
                - Programming languages

             3. DO NOT increase or change the candidate's
                actual years/months of experience.

             4. DO NOT create fake achievements or numerical
                results that are not present in the resume.

             5. You may improve grammar, sentence structure,
                clarity and professional wording.

             6. You may convert simple responsibility statements
                into stronger professional statements ONLY when
                the meaning remains factually identical.

             7. If a job title and job description are provided,
                make the resume wording more relevant to that role
                using ONLY skills and experience already present
                in the resume.

             8. Do NOT add a job requirement as a candidate skill
                unless that skill is already present in the resume.

             9. If a skill is missing from the resume but appears
                in the job description, do NOT add it to the
                rewritten resume.

             10. Keep the candidate's original education,
                 experience, projects and certifications unchanged
                 in terms of facts.

             11. Maintain an ATS-friendly professional structure.

             12. Use clear section headings.

             13. Do not use tables, columns, icons or decorative
                 symbols that may reduce ATS compatibility.

             14. Do not add an introduction explaining what
                 you changed.

             15. Do not add a conclusion outside the resume.

             =====================================================
             REQUIRED RESUME STRUCTURE
             =====================================================

             PROFESSIONAL SUMMARY

             Write a concise professional summary based only
             on the original resume.

             TECHNICAL SKILLS

             Organize the existing technical skills clearly.
             Do not add new skills.

             EXPERIENCE

             Rewrite existing internship/work experience
             professionally without changing factual information.

             PROJECTS

             Rewrite the existing projects using professional,
             technically clear and achievement-oriented wording.
             Do not invent functionality.

             EDUCATION

             Preserve the candidate's actual educational details.

             CERTIFICATIONS

             Preserve the certifications actually mentioned
             in the original resume.

             ACHIEVEMENTS

             Include achievements only if they are present
             in the original resume.

             =====================================================
             ATS GUIDELINES
             =====================================================

             - Use standard section headings.
             - Use professional action verbs where appropriate.
             - Use relevant keywords already present in the resume.
             - Avoid unnecessary repetition.
             - Keep descriptions concise and readable.
             - Improve keyword placement naturally.
             - Do not keyword-stuff.
             - Do not invent missing keywords.

             =====================================================
             FINAL REQUIREMENT
             =====================================================

             Return ONLY the rewritten resume.

             Do not include:
             - AI explanation
             - Analysis
             - Suggestions
             - Notes
             - Warnings
             - Introduction
             - Conclusion

             The final output must be ready for the candidate
             to review and use as a professional resume.
             """.formatted(
                     resumeText,
                     jobTitle == null ? "" : jobTitle,
                     jobDescription == null ? "" : jobDescription
             );

     try {

         GenerateContentResponse response =
                 client.models.generateContent(
                         "gemini-3.5-flash-lite",
                         prompt,
                         null
                 );

         return response.text();

     } catch (Exception e) {

         e.printStackTrace();

         return "Error while rewriting resume: "
                 + e.getMessage();
     }
 }

}

