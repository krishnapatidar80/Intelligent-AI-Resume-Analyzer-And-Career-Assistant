package com.aIresumeanalyzer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;

@SpringBootApplication
public class AiResumeAnalyzerProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(AiResumeAnalyzerProjectApplication.class, args);
	}
	
	// Automatically open Chrome/browser  direct project open ho jayega


	@EventListener(ApplicationReadyEvent.class)
	public void openBrowser() {

		try {
			new ProcessBuilder(
				"cmd",
				"/c",
				"start",
				"chrome",
				"http://localhost:8080/"
			).start();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}