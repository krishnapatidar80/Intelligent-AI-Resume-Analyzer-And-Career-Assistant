package com.aIresumeanalyzer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aIresumeanalyzer.entity.JobDescription;
import com.aIresumeanalyzer.entity.User;

public interface JobDescriptionRepository extends JpaRepository<JobDescription, Long>{
	
	List<JobDescription> findByUserOrderByCreatedAtDesc(User user);

}
