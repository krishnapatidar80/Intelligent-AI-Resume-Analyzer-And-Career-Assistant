package com.aIresumeanalyzer.dao;

import com.aIresumeanalyzer.entity.User;

public interface UserDao {
	
	boolean addNewUser(User user);
	boolean checkUsercredentials(User user);
	
	User getUserByEmail(String email);
}
