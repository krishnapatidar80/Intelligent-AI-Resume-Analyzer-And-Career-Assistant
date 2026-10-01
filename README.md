# 🤖 Intelligent AI Resume Analyzer & Career Assistant

An AI-powered web application that analyzes resumes, evaluates ATS compatibility, matches resumes with job descriptions, generates interview questions, and rewrites resumes using Google Gemini AI.

Built with Java, Spring Boot, Spring MVC, JSP, Hibernate, MySQL, and Google Gemini AI.

---

## 📌 Overview

The **Intelligent AI Resume Analyzer & Career Assistant** is a web-based application designed to help users analyze and improve their resumes using Artificial Intelligence.

The application extracts text from uploaded PDF resumes and uses **Google Gemini AI** to generate personalized career insights.

Users can:

- Analyze resumes using AI
- Generate an AI-based ATS score
- Identify technical and missing skills
- View resume strengths and weaknesses
- Get resume improvement suggestions
- Match a resume against a job description
- Identify skill and experience gaps
- Generate job-specific interview questions
- Rewrite resumes according to a target job
- Maintain resume analysis history

---

## ✨ Key Features

### 🔐 User Authentication

- User Registration
- User Login
- Session-based authentication
- User Logout
- User-specific resume data

### 📄 Resume Analysis

- Upload resume in PDF format
- Extract text from PDF
- AI-powered resume analysis
- ATS score generation
- Technical skill analysis
- Resume strengths and weaknesses
- Missing skills identification
- Resume improvement suggestions
- Resume structure analysis

### 🎯 Job Description Matching

Users can provide:

- Job title
- Job description

The application analyzes the resume against the provided job description and generates:

- Matching skills
- Missing skills
- Matching experience
- Experience gaps
- Matching projects
- Skill gaps
- Learning gaps
- Learning priorities
- Recommendations
- Final assessment

### 🎤 AI Interview Question Generator

The application can generate interview questions based on:

- Resume
- Job title
- Job description
- Question type
- Difficulty level

This helps users prepare for job-specific interviews.

### ✍️ AI Resume Rewriter

The Resume Rewriter uses Google Gemini AI to generate an improved version of the resume based on:

- Existing resume
- Target job title
- Job description

### 📚 Resume History

Users can:

- View previously analyzed resumes
- View ATS scores
- View analysis results
- Access previous resume records

---

## 🧠 Google Gemini AI Integration

Google Gemini AI is used for the core AI functionality of the application.

The application integrates Gemini AI for:

1. Resume Analysis
2. ATS Evaluation
3. Job Description Matching
4. Interview Question Generation
5. Resume Rewriting

The Gemini API key is loaded through an environment variable and is not hard-coded in the source code.

---

## 🛠️ Technology Stack

| Category | Technologies |
|---|---|
| Programming Language | Java 21 |
| Backend | Spring Boot 3.5.5, Spring MVC |
| Frontend | JSP, HTML5, CSS3, JavaScript, Bootstrap |
| ORM | JPA, Hibernate |
| Database | MySQL 8 |
| AI | Google Gemini AI |
| PDF Processing | PDF Text Extraction |
| Build Tool | Maven |
| Server | Apache Tomcat |
| IDE | Eclipse / Spring Tool Suite |
| Version Control | Git, GitHub |

---

## 🏗️ System Architecture

The application follows a layered web application architecture.

```text
                    ┌──────────────────────┐
                    │        User          │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │     JSP Frontend     │
                    │  HTML/CSS/Bootstrap   │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │    Spring MVC        │
                    │    Controllers       │
                    └──────────┬───────────┘
                               │
             ┌─────────────────┼──────────────────┐
             │                 │                  │
             ▼                 ▼                  ▼
     ┌──────────────┐  ┌──────────────┐  ┌──────────────┐
     │ User Module  │  │ Resume Module│  │ Gemini AI    │
     │              │  │              │  │ Service      │
     └──────┬───────┘  └──────┬───────┘  └──────┬───────┘
            │                 │                  │
            │                 │                  ▼
            │                 │          ┌───────────────┐
            │                 │          │ Google Gemini │
            │                 │          │      AI       │
            │                 │          └───────────────┘
            │                 │
            └────────────┬────┘
                         ▼
                ┌─────────────────┐
                │      MySQL      │
                │     Database    │
                └─────────────────┘