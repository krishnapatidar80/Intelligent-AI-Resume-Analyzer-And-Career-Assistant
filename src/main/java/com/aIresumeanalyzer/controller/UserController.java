package com.aIresumeanalyzer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.aIresumeanalyzer.daoimpl.UserDaoImpl;
import com.aIresumeanalyzer.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller
public class UserController {
	
	@Autowired
	private UserDaoImpl daoImpl;
	
	@GetMapping("/")				//login page show
	public String loginPage()
	{
		return "login";
	}
	
	@GetMapping("/login")				//login page show
	public String loginPageShow()
	{
		return "login";
	}
	
	@GetMapping("/register")		//register page show
	public String registerPage()
	{
		return "register";
	}
	
	@PostMapping(value="/adduser")		//user register
	public String registerUser(User user, Model model)
	{
		if(daoImpl.addNewUser(user)) {
			return "redirect:/login?success";
//			model.addAttribute("MSG","Registration Successfull");
//			model.addAttribute("MSGCOLOR","green");
//			return "login";
		}else {
			return "redirect:/register?error=emailExists";
//			model.addAttribute("MSG","Registration Failed");
//			model.addAttribute("MSGCOLOR","red");
//			return "register";
		}
	}
	
	@PostMapping(value="/checkuser")		//user login
	public String loginUser(User user, Model model,
					HttpServletRequest request,
					HttpServletResponse response)
	{
		 // Browser cache disable
        response.setHeader("Cache-Control",
                "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
		
		if(daoImpl.checkUsercredentials(user)) {
			HttpSession session = 
						request.getSession(true);
			// Save email in session
	        session.setAttribute("USEREMAIL", user.getEmail());

	        // Add logged-in user to Model
	        User loggedInUser = daoImpl.getUserByEmail(user.getEmail());
	        model.addAttribute("user", loggedInUser);
			return "home";
		}else {
			return "redirect:/login?error=invalid";
//			model.addAttribute("MSG","Invalid User credentials");
//			model.addAttribute("MSGCOLOR","red");
//			return "login";
		}
	}
	
	@GetMapping(value="/logout")			//user logout
	public String logoutUser(User user, Model model,
					HttpServletRequest request)
	{
		HttpSession session = 
						request.getSession(false);
		
		if(session.getAttribute("USEREMAIL") == null) {
			return "redirect:/login?logout=error";
//			model.addAttribute("MSG","you need to login first");
//			model.addAttribute("MSGCOLOR","red");
//			return "login";
		}else {
			session.setAttribute("USEREMAIL", null);
			session.invalidate();
			return "redirect:/login?logout=success";
//			model.addAttribute("MSG","User Logout Success");
//			model.addAttribute("MSGCOLOR","green");
//			return "login";
		}
	}
	
}
