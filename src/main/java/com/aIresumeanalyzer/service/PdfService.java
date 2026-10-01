package com.aIresumeanalyzer.service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.pdfbox.Loader;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class PdfService {

	public String extractText(MultipartFile file) throws IOException {

		try (InputStream inputStream = file.getInputStream()) {

			byte[] bytes = inputStream.readAllBytes();

			try (PDDocument document = Loader.loadPDF(bytes)) {

				PDFTextStripper stripper = new PDFTextStripper();

				return stripper.getText(document);
			}
		}
	}
}
