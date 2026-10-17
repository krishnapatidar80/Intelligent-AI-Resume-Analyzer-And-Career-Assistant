<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AI Resume Analyzer</title>

<style>
:root {
    --bg: #080d1b;
    --panel: #111b30;
    --border: #263650;
    --text: #e5edf9;
    --muted: #9aaac1;
    --blue: #38bdf8;
    --purple: #a78bfa;
}

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    min-height: 100vh;
    font-family: "Segoe UI", Arial, sans-serif;
    background:
        radial-gradient(ellipse at top left, rgba(56,189,248,.10), transparent 35%),
        radial-gradient(ellipse at top right, rgba(139,92,246,.10), transparent 35%),
        var(--bg);
    color: var(--text);
}

/* ================= NAVBAR ================= */

.navbar {
    position: sticky;
    top: 0;
    z-index: 100;
    background: rgba(8,13,27,.96);
    border-bottom: 1px solid var(--border);
    backdrop-filter: blur(14px);
}

.nav-inner {
    max-width: 1380px;
    min-height: 74px;
    margin: auto;
    padding: 12px 24px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
}

.brand {
    display: flex;
    align-items: center;
    gap: 10px;
    color: #f8fafc;
    text-decoration: none;
    font-size: 17px;
    font-weight: 800;
    white-space: nowrap;
}

.brand-icon {
    width: 40px;
    height: 40px;
    display: grid;
    place-items: center;
    border-radius: 12px;
    background: linear-gradient(135deg, #0284c7, #7c3aed);
    font-size: 20px;
}

.brand span:last-child span {
    color: var(--blue);
}

.nav-links {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
    gap: 4px;
}

.nav-links a {
    padding: 9px 10px;
    color: #b9c6da;
    border: 1px solid transparent;
    border-radius: 8px;
    text-decoration: none;
    font-size: 12px;
    transition: .2s ease;
}

.nav-links a:hover,
.nav-links a.active {
    color: #7dd3fc;
    background: rgba(56,189,248,.08);
    border-color: rgba(56,189,248,.18);
}

.nav-user {
    display: flex;
    align-items: center;
    gap: 12px;
    white-space: nowrap;
}

.user-name {
    max-width: 125px;
    overflow: hidden;
    text-overflow: ellipsis;
    font-size: 12px;
    color: #dbeafe;
}

.logout-btn {
    padding: 9px 12px;
    color: #fda4af;
    background: rgba(244,63,94,.08);
    border: 1px solid rgba(244,63,94,.25);
    border-radius: 8px;
    text-decoration: none;
    font-size: 12px;
    font-weight: 700;
}

/* ================= MAIN CONTENT ================= */

.container {
    width: min(1120px, 94%);
    margin: 0 auto;
}

.page-heading {
    padding: 40px 0 24px;
}

.eyebrow {
    display: inline-block;
    padding: 8px 12px;
    color: #7dd3fc;
    background: rgba(56,189,248,.08);
    border: 1px solid rgba(56,189,248,.2);
    border-radius: 30px;
    font-size: 11px;
    font-weight: 800;
    letter-spacing: 1px;
}

.page-heading h1 {
    margin: 16px 0 10px;
    font-size: clamp(27px, 4vw, 40px);
    line-height: 1.2;
}

.gradient-text {
    color: var(--blue);
}

.page-heading p {
    max-width: 720px;
    margin: 0;
    color: var(--muted);
    font-size: 14px;
    line-height: 1.8;
}

/* ================= TOOLBAR ================= */

.toolbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 18px;
    margin-bottom: 22px;
    padding: 18px 20px;
    background: rgba(17,27,48,.9);
    border: 1px solid var(--border);
    border-radius: 14px;
}

.toolbar-title {
    margin: 0 0 5px;
    font-size: 14px;
}

.toolbar-description {
    margin: 0;
    color: var(--muted);
    font-size: 12px;
    line-height: 1.7;
}

.actions {
    display: flex;
    flex-wrap: wrap;
    gap: 9px;
}

.btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 7px;
    min-height: 41px;
    padding: 10px 15px;
    border: 1px solid var(--border);
    border-radius: 9px;
    font-family: inherit;
    font-size: 12px;
    font-weight: 800;
    text-decoration: none;
    cursor: pointer;
    transition: .2s ease;
}

.btn:hover {
    transform: translateY(-1px);
}

.btn-primary {
    color: #07111f;
    background: linear-gradient(135deg, #38bdf8, #818cf8);
    border-color: transparent;
}

.btn-secondary {
    color: #e2e8f0;
    background: #1e293b;
}

.btn-secondary:hover {
    background: #293951;
}

/* ================= RESUME PREVIEW ================= */

.resume-frame {
    margin-bottom: 50px;
    padding: 20px;
    background: rgba(17,27,48,.8);
    border: 1px solid var(--border);
    border-radius: 16px;
    box-shadow: 0 20px 55px rgba(0,0,0,.15);
}

.preview-heading {
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 10px;
    margin-bottom: 17px;
    color: #cbd5e1;
    font-size: 11px;
    font-weight: 800;
    letter-spacing: .7px;
}

.preview-status {
    color: #6ee7b7;
}

.resume-sheet {
    width: 100%;
    max-width: 794px;
    min-height: 600px;
    margin: 0 auto;
    padding: 42px 48px;
    color: #202938;
    background: #fff;
    border: 1px solid #e2e8f0;
    box-shadow: 0 8px 30px rgba(0,0,0,.13);
    overflow-wrap: anywhere;
}

/* ================= RESUME HEADER ================= */

.resume-header {
    margin-bottom: 18px;
    padding-bottom: 15px;
    text-align: center;
    border-bottom: 2px solid #1e3a5f;
}

.resume-name {
    margin: 0;
    color: #14243a;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 22pt;
    font-weight: 800;
    line-height: 1.25;
    letter-spacing: .4px;
}

.resume-role {
    margin-top: 7px;
    color: #334e68;
    font-size: 10pt;
    font-weight: 700;
    line-height: 1.5;
}

.resume-contact {
    margin-top: 9px;
    color: #334155;
    font-size: 8.5pt;
    line-height: 1.8;
    overflow-wrap: anywhere;
}

.resume-contact a {
    color: #174e80;
    text-decoration: none;
}

.separator {
    padding: 0 4px;
    color: #64748b;
}

/* ================= RESUME BODY ================= */

.resume-content {
    color: #202938;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 10pt;
    line-height: 1.5;
    white-space: pre-wrap;
    overflow-wrap: anywhere;
    word-wrap: break-word;
}

.resume-content h1,
.resume-content h2,
.resume-content h3 {
    color: #173653;
    line-height: 1.35;
    font-weight: 800;
    break-after: avoid;
    page-break-after: avoid;
}

.resume-content h1 {
    margin: 14px 0 7px;
    font-size: 14pt;
}

.resume-content h2 {
    margin: 13px 0 6px;
    padding-bottom: 4px;
    border-bottom: 1px solid #d6dee8;
    font-size: 11pt;
}

.resume-content h3 {
    margin: 10px 0 5px;
    font-size: 10pt;
}

.resume-content p {
    line-height: 1.55;
    overflow-wrap: anywhere;
    margin: 0 0 7px;
}

.resume-content ul,
.resume-content ol {
    margin: 5px 0 9px;
    padding-left: 21px;
}

.resume-content li {
    line-height: 1.5;
    margin-bottom: 4px;
    margin-bottom: 4px;
}

/* ================= WEBSITE FOOTER ================= */

.site-footer {
    margin-top: 30px;
    padding: 28px 20px;
    background: #0c1426;
    border-top: 1px solid var(--border);
}

.footer-inner {
    max-width: 1200px;
    margin: auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 18px;
}

.footer-brand {
    color: #f8fafc;
    font-size: 14px;
    font-weight: 800;
}

.footer-brand span {
    color: var(--blue);
}

.footer-description {
    margin-top: 6px;
    color: #8797ae;
    font-size: 11px;
    line-height: 1.7;
}

.footer-links {
    display: flex;
    flex-wrap: wrap;
    gap: 16px;
}

.footer-links a {
    color: #aab8cc;
    font-size: 11px;
    text-decoration: none;
}

.footer-links a:hover {
    color: var(--blue);
}

.copyright {
    max-width: 1200px;
    margin: 20px auto 0;
    padding-top: 15px;
    border-top: 1px solid #263650;
    color: #718096;
    font-size: 10px;
    text-align: center;
}

/* ================= RESPONSIVE ================= */

@media (max-width: 1100px) {
    .nav-inner {
        flex-direction: column;
        gap: 12px;
    }

    .nav-links {
        width: 100%;
    }
}

@media (max-width: 650px) {
    .nav-inner {
        padding: 13px;
    }

    .nav-links {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        width: 100%;
    }

    .nav-links a {
        text-align: center;
    }

    .nav-user {
        width: 100%;
        justify-content: space-between;
    }

    .page-heading {
        padding-top: 28px;
    }

    .toolbar {
        align-items: stretch;
        padding: 15px;
    }

    .actions {
        display: grid;
        grid-template-columns: 1fr;
    }

    .btn {
        width: 100%;
    }

    .resume-frame {
        padding: 8px;
    }

    .resume-sheet {
        min-height: 400px;
        padding: 25px 19px;
    }

    .resume-name {
        font-size: 19pt;
    }

    .resume-role {
        font-size: 9pt;
    }

    .resume-contact {
        font-size: 8pt;
    }

    .resume-content {
        font-size: 9.5pt;
        line-height: 1.48;
    }

    .footer-inner {
        flex-direction: column;
        align-items: flex-start;
    }
}

/* ================= PDF PRINT ================= */

@page {
    size: A4;
    margin: 15mm 16mm;
}

@media print {
    html,
    body {
        width: auto !important;
        min-height: 0 !important;
        margin: 0 !important;
        padding: 0 !important;
        background: #fff !important;
        color: #202938 !important;
        overflow: visible !important;
        -webkit-print-color-adjust: exact;
        print-color-adjust: exact;
    }

    .no-print,
    .navbar,
    .page-heading,
    .toolbar,
    .preview-heading,
    .site-footer,
    .copyright {
        display: none !important;
    }

    .container,
    .page {
        width: 100% !important;
        max-width: none !important;
        margin: 0 !important;
        padding: 0 !important;
    }

    .resume-frame {
        width: 100% !important;
        margin: 0 !important;
        padding: 0 !important;
        border: none !important;
        border-radius: 0 !important;
        background: #fff !important;
        box-shadow: none !important;
    }

    .resume-sheet {
        width: 100% !important;
        max-width: none !important;
        min-height: 0 !important;
        margin: 0 !important;
        padding: 0 !important;
        border: none !important;
        box-shadow: none !important;
        background: #fff !important;
        color: #202938 !important;
        overflow: visible !important;
    }

    .resume-header {
        margin-bottom: 15px !important;
        padding-bottom: 12px !important;
    }

    .resume-name {
        font-size: 21pt !important;
    }

    .resume-role {
        font-size: 9.5pt !important;
    }

    .resume-contact {
        font-size: 8pt !important;
    }

    .resume-content {
        font-size: 9.5pt !important;
        line-height: 1.43 !important;
        white-space: pre-wrap !important;
        overflow: visible !important;
    }

    .resume-content h1,
    .resume-content h2,
    .resume-content h3 {
        break-after: avoid !important;
        page-break-after: avoid !important;
    }

    .resume-content li {
    line-height: 1.5;
    margin-bottom: 4px;
        break-inside: avoid;
        page-break-inside: avoid;
    }

    a {
        color: #174e80 !important;
        text-decoration: none !important;
    }
}
</style>
</head>

<body>

<!-- WEBSITE HEADER -->

<nav class="navbar no-print">
    <div class="nav-inner">

        <a class="brand"
           href="${pageContext.request.contextPath}/home">
            <span class="brand-icon">🤖</span>
            <span>AI Resume <span>Analyzer</span></span>
        </a>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/home">🏠 Home</a>
            <a href="${pageContext.request.contextPath}/upload_resume">📄 Analyze Resume</a>
            <a href="${pageContext.request.contextPath}/resume-history">📊 History</a>
            <a class="active" href="${pageContext.request.contextPath}/resume-rewriter">✨ Resume Rewriter</a>
            <a href="${pageContext.request.contextPath}/job-matching">🎯 Job Matching</a>
            <a href="${pageContext.request.contextPath}/interview-questions">💬 Interview Prep</a>
        </div>

        <div class="nav-user">
            <span class="user-name">
                👤 <c:out value="${user.name}" default="User"/>
            </span>

            <a class="logout-btn"
               href="${pageContext.request.contextPath}/logout">
                Logout ↗
            </a>
        </div>

    </div>
</nav>

<!-- MAIN PAGE -->

<main class="container">

    <section class="page-heading no-print">
        <div class="eyebrow">✦ AI-POWERED RESUME BUILDER</div>

        <h1>
            Your <span class="gradient-text">Professional Resume</span>
        </h1>

        <p>
            Your resume has been rewritten with AI. Review the document
            below and save a clean, professional PDF for your job applications.
        </p>
    </section>

    <section class="toolbar no-print">
        <div>
            <h2 class="toolbar-title">Resume Preview</h2>
            <p class="toolbar-description">
                Professional layout · A4 PDF · Balanced margins
            </p>
        </div>

        <div class="actions">
            <button type="button" class="btn btn-primary"
                    onclick="downloadResume()">
                ⬇ Download / Save as PDF
            </button>

            <a class="btn btn-secondary"
               href="${pageContext.request.contextPath}/resume-rewriter">
                ✨ Rewrite Again
            </a>

            <a class="btn btn-secondary"
               href="${pageContext.request.contextPath}/home">
                ← Home
            </a>
        </div>
    </section>

    <!-- THIS SECTION ALONE IS PRINTED -->

    <section class="resume-frame">
        <div class="preview-heading no-print">
            <span>RESUME DOCUMENT</span>
            <span class="preview-status">✓ READY TO PRINT</span>
        </div>

        <article class="resume-sheet" id="resumePrintable">

            <header class="resume-header">

                <h1 class="resume-name" id="generatedResumeName"></h1>

                <div class="resume-role" id="generatedResumeRole" hidden></div>

                <div class="resume-contact" id="generatedResumeContact" hidden></div>

            </header>

            <div class="resume-content" id="resumeContent"><c:out value="${rewrittenResume}" default="Resume content is not available. Please return to Resume Rewriter and generate your resume again."/></div>

        </article>
    </section>

</main>

<!-- WEBSITE FOOTER - HIDDEN WHEN PRINTING -->

<footer class="site-footer no-print">

    <div class="footer-inner">

        <div>
            <div class="footer-brand">
                AI Resume <span>Analyzer</span>
            </div>

            <div class="footer-description">
                Intelligent AI Resume Analyzer &amp; Career Assistant<br>
                Build a stronger resume. Prepare for your next opportunity.
            </div>
        </div>

        <div class="footer-links">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/upload_resume">Analyze Resume</a>
            <a href="${pageContext.request.contextPath}/resume-history">Resume History</a>
            <a href="${pageContext.request.contextPath}/resume-rewriter">Resume Rewriter</a>
        </div>

    </div>

    <div class="copyright">
        © 2026 AI Resume Analyzer &amp; Career Assistant
        · Developed by Krishnakant Patidar
    </div>

</footer>

<script>
/*
 * Create the resume header from the AI-generated resume text.
 * The site owner's personal details are not hardcoded into every resume.
 */
document.addEventListener("DOMContentLoaded", function () {
    const resumeContent = document.getElementById("resumeContent");
    const nameElement = document.getElementById("generatedResumeName");
    const roleElement = document.getElementById("generatedResumeRole");
    const contactElement = document.getElementById("generatedResumeContact");

    if (!resumeContent || !nameElement || !roleElement || !contactElement) return;

    // Clean Markdown markers that AI responses sometimes leave in plain text.
    let rawText = resumeContent.innerText || resumeContent.textContent || "";
    rawText = rawText
        .replace(/\r/g, "")
        .replace(/^\s{0,3}[#]{1,6}\s*/gm, "")
        .replace(/\*\*(.*?)\*\*/g, "$1")
        .replace(/__(.*?)__/g, "$1")
        .replace(/(?<!\*)\*(?!\s)(.*?)(?<!\s)\*(?!\*)/g, "$1")
        .replace(/^\s*[-*]\s+/gm, "• ");

    const lines = rawText.split("\n").map(line => line.trim()).filter(Boolean);
    const isSectionHeading = line =>
        /^(professional summary|summary|career objective|objective|technical skills|skills|work experience|professional experience|experience|projects|education|certifications|certificates|achievements|languages|internship|internships)$/i.test(line.replace(/[:：]$/, "").trim());

    const emailRegex = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}/ig;
    const phoneRegex = /(?:\+?\d[\d\s().-]{7,}\d)/g;
    const urlRegex = /(?:https?:\/\/)?(?:www\.)?(?:linkedin\.com\/[^\s,|]+|github\.com\/[^\s,|]+|[A-Za-z0-9-]+\.github\.io\/[^\s,|]+)/ig;

    function looksLikeName(line) {
        if (!line || line.length > 55 || /[@:/|•]/.test(line) || /\d/.test(line) || isSectionHeading(line)) return false;
        const words = line.replace(/[.,]/g, "").split(/\s+/);
        return words.length >= 2 && words.length <= 5 &&
            words.every(word => /^[A-Za-z][A-Za-z.'’-]*$/.test(word));
    }

    const headerLines = new Set();
    let name = "";
    let nameIndex = -1;
    for (let i = 0; i < Math.min(lines.length, 10); i++) {
        if (looksLikeName(lines[i])) {
            name = lines[i];
            nameIndex = i;
            break;
        }
    }

    // Use the next short, non-section line as the role/title when available.
    let role = "";
    if (nameIndex >= 0) {
        for (let i = nameIndex + 1; i < Math.min(lines.length, nameIndex + 5); i++) {
            const candidate = lines[i];
            if (isSectionHeading(candidate)) break;
            if (candidate.length <= 100 && !emailRegex.test(candidate) && !phoneRegex.test(candidate) &&
                !urlRegex.test(candidate) && !/^[•-]/.test(candidate)) {
                role = candidate.replace(/^[|•\-–—\s]+|[|•\-–—\s]+$/g, "");
                if (role) break;
            }
            emailRegex.lastIndex = phoneRegex.lastIndex = urlRegex.lastIndex = 0;
        }
    }

    if (nameIndex >= 0) headerLines.add(nameIndex);
    if (role && nameIndex >= 0) {
        const roleIndex = lines.indexOf(role, nameIndex + 1);
        if (roleIndex >= 0) headerLines.add(roleIndex);
    }

    const contacts = [];
    const seenContacts = new Set();
    function addContact(value, type) {
        const clean = value.trim().replace(/[.,;|]+$/, "");
        if (clean && !seenContacts.has(clean.toLowerCase())) {
            seenContacts.add(clean.toLowerCase());
            contacts.push({ value: clean, type });
        }
    }

    lines.forEach((line, index) => {
        let foundContact = false;
        const emails = line.match(emailRegex) || [];
        emails.forEach(value => { addContact(value, "email"); foundContact = true; });
        emailRegex.lastIndex = 0;

        const urls = line.match(urlRegex) || [];
        urls.forEach(value => { addContact(value, "link"); foundContact = true; });
        urlRegex.lastIndex = 0;

        const phones = line.match(phoneRegex) || [];
        phones.forEach(value => {
            const digits = value.replace(/\D/g, "");
            if (digits.length >= 10 && digits.length <= 15) {
                addContact(value, "phone");
                foundContact = true;
            }
        });
        phoneRegex.lastIndex = 0;

        if (foundContact && (/@|linkedin|github|portfolio|phone|mobile|contact/i.test(line))) {
            headerLines.add(index);
        }
    });

    const firstNameMatch = rawText.match(/^\s*([A-Z][A-Z ]{1,40})\s*$/m);

    nameElement.textContent = firstNameMatch
        ? firstNameMatch[1].trim()
        : (name || "Professional Resume");
    if (role) {
        roleElement.textContent = role;
        roleElement.hidden = false;
    }

    contacts.forEach((item, index) => {
        const span = document.createElement("span");
        span.className = "resume-contact-item";

        if (item.type === "link") {
            const link = document.createElement("a");
            let url = item.value.trim();

            if (!/^https?:\/\//i.test(url)) {
                url = "https://" + url;
            }

            link.href = url;
            link.target = "_blank";
            link.rel = "noopener noreferrer";
            link.textContent = item.value.trim();

            span.appendChild(link);
        } else {
            span.textContent = item.value;
        }

        contactElement.appendChild(span);

        if (index < contacts.length - 1) {
            const separator = document.createElement("span");
            separator.className = "separator";
            separator.textContent = " | ";
            contactElement.appendChild(separator);
        }
    });

    if (contacts.length) {
        contactElement.hidden = false;
    }
    

    // Rebuild content with clean section headings, paragraphs, and bullet lists.
    const bodyLines = lines.filter((line, index) => {
    if (headerLines.has(index)) {
        return false;
    }

    return true;
});

// Remove a repeated candidate name only if it is the
// final non-empty line of the resume body.
while (
    bodyLines.length > 0 &&
    bodyLines[bodyLines.length - 1].trim() === ""
) {
    bodyLines.pop();
}

const candidateName = (name || "").trim();

if (candidateName && bodyLines.length > 0) {
    const lastLine = bodyLines[bodyLines.length - 1]
        .replace(/^[#]{1,6}\s*/, "")
        .replace(/\*\*/g, "")
        .trim();

    if (
        lastLine.localeCompare(candidateName, undefined, {
            sensitivity: "accent"
        }) === 0
    ) {
        bodyLines.pop();
    }
}
const cleanedLines = bodyLines.map(line => line.replace(/\*\*/g, "").replace(/__/g, "").trim());
    const output = document.createDocumentFragment();
    let list = null;

    cleanedLines.forEach(line => {
        if (!line) return;
        const heading = line.replace(/[:：]$/, "").trim();
        if (isSectionHeading(heading)) {
            if (list) { output.appendChild(list); list = null; }
            const h2 = document.createElement("h2");
            h2.textContent = heading.toUpperCase();
            output.appendChild(h2);
            return;
        }

        const bulletMatch = line.match(/^(?:•|[-*])\s+(.+)$/);
        if (bulletMatch) {
            if (!list) {
                list = document.createElement("ul");
                list.className = "resume-list";
            }
            const li = document.createElement("li");
            li.textContent = bulletMatch[1].replace(/\*\*/g, "");
            list.appendChild(li);
            return;
        }

        if (list) { output.appendChild(list); list = null; }
        const p = document.createElement("p");
        p.textContent = line;
        output.appendChild(p);
    });
    if (list) output.appendChild(list);
    resumeContent.replaceChildren(output);
});
function downloadResume() {
    window.print();
}
</script>

</body>
</html>