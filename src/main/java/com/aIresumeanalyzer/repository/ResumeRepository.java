package com.aIresumeanalyzer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aIresumeanalyzer.entity.Resume;
import com.aIresumeanalyzer.entity.User;

public interface ResumeRepository extends JpaRepository<Resume, Long>{
	
    List<Resume> findByUser(User user);
    
    List<Resume> findByUserOrderByUploadedAtDesc(User user);
}
