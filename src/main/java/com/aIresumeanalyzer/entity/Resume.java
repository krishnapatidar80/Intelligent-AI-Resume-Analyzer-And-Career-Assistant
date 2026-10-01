package com.aIresumeanalyzer.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "resumes")
public class Resume {
	
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    private String fileName;

	    @Lob
	    @Column(columnDefinition = "LONGTEXT")
	    private String resumeText;

	    private LocalDateTime uploadedAt;

	    @ManyToOne
	    @JoinColumn(name = "user_id")
	    private User user;
	    
	    private Integer resumeScore;

	    @Column(columnDefinition = "LONGTEXT")
	    private String analysisResult;

	    public Resume() {
	    }

	    public Long getId() {
	        return id;
	    }

	    public void setId(Long id) {
	        this.id = id;
	    }

	    public String getFileName() {
	        return fileName;
	    }

	    public void setFileName(String fileName) {
	        this.fileName = fileName;
	    }

	    public String getResumeText() {
	        return resumeText;
	    }

	    public void setResumeText(String resumeText) {
	        this.resumeText = resumeText;
	    }

	    public LocalDateTime getUploadedAt() {
	        return uploadedAt;
	    }

	    public void setUploadedAt(LocalDateTime uploadedAt) {
	        this.uploadedAt = uploadedAt;
	    }

	    public User getUser() {
	        return user;
	    }

	    public void setUser(User user) {
	        this.user = user;
	    }
	
	    public Integer getResumeScore() {
	        return resumeScore;
	    }

	    public void setResumeScore(Integer resumeScore) {
	        this.resumeScore = resumeScore;
	    }

	    public String getAnalysisResult() {
	        return analysisResult;
	    }

	    public void setAnalysisResult(String analysisResult) {
	        this.analysisResult = analysisResult;
	    }
}
