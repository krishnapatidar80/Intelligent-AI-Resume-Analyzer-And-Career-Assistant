package com.aIresumeanalyzer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aIresumeanalyzer.entity.Resume;
import com.aIresumeanalyzer.entity.ResumeRewrite;

public interface ResumeRewriteRepository
        extends JpaRepository<ResumeRewrite, Long> {

    List<ResumeRewrite> findByResumeOrderByCreatedAtDesc(Resume resume);
}