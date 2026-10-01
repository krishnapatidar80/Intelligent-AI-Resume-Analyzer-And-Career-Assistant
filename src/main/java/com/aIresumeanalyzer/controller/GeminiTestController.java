package com.aIresumeanalyzer.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aIresumeanalyzer.service.GeminiService;

@RestController
public class GeminiTestController {

    @Autowired
    private GeminiService geminiService;

    @GetMapping("/test-gemini")
    public String testGemini() {

        return geminiService.testGemini();
    }
}