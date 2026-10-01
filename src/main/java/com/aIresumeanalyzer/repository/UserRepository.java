package com.aIresumeanalyzer.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aIresumeanalyzer.entity.User;

public interface UserRepository extends JpaRepository<User, Long>{
	

    User findByEmail(String email);
}
