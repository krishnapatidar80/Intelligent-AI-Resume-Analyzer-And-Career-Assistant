<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Interview Questions | AI Resume Analyzer</title>

<style>
:root {
    --bg:#070d1b;
    --panel:rgba(15,27,48,.88);
    --border:rgba(148,163,184,.20);
    --text:#f1f5f9;
    --muted:#a8b6cb;
    --cyan:#67e8f9;
    --blue:#60a5fa;
    --purple:#c4b5fd;
    --green:#86efac;
    --orange:#fdba74;
}
* { box-sizing:border-box; margin:0; padding:0; }
body {
    min-height:100vh;
    display:flex;
    flex-direction:column;
    color:var(--text);
    font-family:"Segoe UI",Arial,sans-serif;
    line-height:1.65;
    background:
        radial-gradient(ellipse at 10% 0%,rgba(37,99,235,.17),transparent 35%),
        radial-gradient(ellipse at 90% 20%,rgba(124,58,237,.12),transparent 35%),
        var(--bg);
}
a { text-decoration:none; }
.navbar {
    position:sticky;
    top:0;
    z-index:20;
    padding:0 5%;
    background:rgba(5,11,23,.96);
    border-bottom:1px solid var(--border);
    backdrop-filter:blur(14px);
}
.navbar-top {
    min-height:64px;
    display:flex;
    align-items:center;
    justify-content:space-between;
    gap:14px;
}
.logo {
    color:white;
    font-size:19px;
    font-weight:800;
    white-space:nowrap;
}
.logo span { color:var(--cyan); }
.user-area {
    display:flex;
    align-items:center;
    gap:10px;
}
.user-name {
    color:#dbeafe;
    background:rgba(255,255,255,.05);
    border:1px solid var(--border);
    padding:6px 12px;
    border-radius:20px;
    font-size:12px;
}
.logout {
    padding:6px 12px;
    color:#fecaca;
    border:1px solid rgba(248,113,113,.3);
    border-radius:8px;
    font-size:12px;
    font-weight:700;
}
.nav-links {
    display:flex;
    gap:5px;
    padding:8px 0 11px;
    overflow-x:auto;
    scrollbar-width:none;
}
.nav-links::-webkit-scrollbar { display:none; }
.nav-links a {
    color:#b6c4d8;
    padding:7px 10px;
    border-radius:8px;
    font-size:12px;
    font-weight:600;
    white-space:nowrap;
    border:1px solid transparent;
}
.nav-links a:hover,
.nav-links a.active {
    color:var(--cyan);
    background:rgba(34,211,238,.08);
    border-color:rgba(103,232,249,.2);
}
main { flex:1; }
.container {
    width:min(1050px,92%);
    margin:auto;
    padding:43px 0 60px;
}
.hero { text-align:center; margin-bottom:30px; }
.eyebrow {
    display:inline-block;
    padding:6px 13px;
    border-radius:30px;
    color:var(--cyan);
    background:rgba(34,211,238,.07);
    border:1px solid rgba(103,232,249,.25);
    font-size:11px;
    font-weight:800;
    letter-spacing:1px;
    margin-bottom:14px;
}
.hero h1 {
    font-size:clamp(29px,4vw,42px);
    line-height:1.25;
    letter-spacing:-1px;
    margin-bottom:12px;
}
.hero h1 span { color:var(--cyan); }
.hero p {
    max-width:670px;
    margin:auto;
    color:var(--muted);
    font-size:14px;
}
.summary-grid {
    display:grid;
    grid-template-columns:repeat(3,minmax(0,1fr));
    gap:15px;
    margin-bottom:25px;
}
.summary-card {
    padding:19px;
    border:1px solid var(--border);
    border-radius:15px;
    background:var(--panel);
    position:relative;
    overflow:hidden;
}
.summary-card:before {
    content:"";
    position:absolute;
    left:0;
    top:0;
    width:100%;
    height:2px;
    background:linear-gradient(90deg,var(--cyan),var(--purple));
}
.summary-icon { font-size:23px; margin-bottom:7px; }
.summary-label { color:var(--muted); font-size:12px; }
.summary-value {
    font-size:17px;
    font-weight:800;
    overflow-wrap:anywhere;
}
.cyan { color:var(--cyan); }
.purple { color:var(--purple); }
.panel {
    border:1px solid var(--border);
    border-radius:18px;
    overflow:hidden;
    background:var(--panel);
    box-shadow:0 15px 45px rgba(0,0,0,.15);
}
.panel-header {
    padding:20px 23px;
    display:flex;
    align-items:center;
    justify-content:space-between;
    gap:12px;
    border-bottom:1px solid var(--border);
    background:rgba(255,255,255,.025);
}
.panel-header h2 { font-size:18px; }
.panel-header p { color:var(--muted); font-size:12px; }
.count {
    min-width:40px;
    padding:5px 12px;
    text-align:center;
    border:1px solid rgba(103,232,249,.3);
    background:rgba(34,211,238,.08);
    color:var(--cyan);
    border-radius:9px;
    font-weight:800;
}
.question-list { padding:20px; }
.question-card {
    padding:21px;
    margin-bottom:16px;
    border:1px solid rgba(148,163,184,.18);
    border-radius:14px;
    background:rgba(4,12,27,.58);
    break-inside:avoid;
}
.question-card:last-child { margin-bottom:0; }
.question-top {
    display:flex;
    align-items:flex-start;
    gap:13px;
}
.question-number {
    width:37px;
    height:37px;
    flex:0 0 37px;
    display:flex;
    align-items:center;
    justify-content:center;
    border-radius:10px;
    color:#06111e;
    background:linear-gradient(135deg,var(--cyan),var(--blue));
    font-size:13px;
    font-weight:900;
}
.question-main { min-width:0; flex:1; }
.question-meta {
    display:flex;
    align-items:center;
    gap:8px;
    flex-wrap:wrap;
    margin-bottom:9px;
}
.question-tag {
    color:var(--cyan);
    font-size:10px;
    letter-spacing:.7px;
    font-weight:900;
    text-transform:uppercase;
}
.difficulty {
    font-size:10px;
    font-weight:800;
    padding:3px 9px;
    border-radius:20px;
    border:1px solid var(--border);
    color:var(--muted);
}
.difficulty.easy {
    color:var(--green);
    border-color:rgba(134,239,172,.25);
    background:rgba(134,239,172,.06);
}
.difficulty.medium {
    color:var(--orange);
    border-color:rgba(253,186,116,.25);
    background:rgba(253,186,116,.06);
}
.difficulty.hard {
    color:#fda4af;
    border-color:rgba(253,164,175,.25);
    background:rgba(253,164,175,.06);
}
.question-text {
    color:#f1f5f9;
    font-size:15px;
    font-weight:600;
    line-height:1.85;
    white-space:pre-wrap;
    overflow-wrap:anywhere;
}
.answer-box {
    margin:18px 0 0 50px;
    padding:15px 17px;
    border-left:3px solid var(--green);
    border-radius:0 10px 10px 0;
    background:rgba(134,239,172,.055);
}
.answer-title {
    color:var(--green);
    font-size:11px;
    font-weight:900;
    letter-spacing:.4px;
    margin-bottom:7px;
}
.answer-text {
    color:#d6e4dd;
    font-size:13px;
    line-height:1.9;
    white-space:pre-wrap;
    overflow-wrap:anywhere;
}
.empty-state {
    padding:40px 20px;
    text-align:center;
    color:var(--muted);
}
.empty-state .icon { font-size:36px; margin-bottom:10px; }
.empty-state h3 { color:var(--text); margin-bottom:7px; }
.actions {
    display:flex;
    justify-content:center;
    align-items:center;
    gap:11px;
    flex-wrap:wrap;
    margin-top:25px;
}
.btn {
    display:inline-flex;
    justify-content:center;
    align-items:center;
    gap:8px;
    padding:11px 17px;
    border:1px solid var(--border);
    border-radius:10px;
    color:var(--text);
    background:rgba(255,255,255,.04);
    cursor:pointer;
    font-size:12px;
    font-weight:800;
    transition:.2s;
}
.btn:hover { transform:translateY(-2px); }
.btn-primary {
    color:#07111f;
    border:0;
    background:linear-gradient(135deg,var(--cyan),var(--blue));
}
.footer {
    margin-top:auto;
    padding:27px 20px 22px;
    text-align:center;
    background:rgba(4,9,20,.8);
    border-top:1px solid var(--border);
}
.footer-logo { color:white; font-weight:800; font-size:18px; }
.footer-logo span { color:var(--cyan); }
.footer-desc,.footer-dev { color:var(--muted); font-size:12px; }
.footer-dev { margin-top:4px; color:#dbeafe; }
.footer a { color:var(--cyan); font-size:12px; }
.footer-line {
    width:min(460px,90%);
    height:1px;
    margin:15px auto 12px;
    background:var(--border);
}
.copyright { color:#718096; font-size:11px; }

@media(max-width:700px) {
    .summary-grid { grid-template-columns:1fr; }
    .container { padding-top:30px; }
    .question-list { padding:12px; }
    .question-card { padding:15px; }
    .answer-box { margin-left:0; }
}
@media(max-width:560px) {
    .navbar { padding:0 13px; }
    .navbar-top { flex-direction:column; padding:12px 0; }
    .user-area { flex-wrap:wrap; justify-content:center; }
    .question-text { font-size:14px; }
    .actions .btn { width:100%; }
}
@media print {
    body { color:#111827; background:white; }
    .navbar,.actions,.footer { display:none !important; }
    .container { width:100%; padding:10px 0; }
    .panel,.summary-card,.question-card {
        color:#111827;
        background:white;
        border:1px solid #d1d5db;
        box-shadow:none;
    }
    .question-text,.summary-value { color:#111827 !important; }
    .answer-text,.hero p,.summary-label { color:#374151; }
}
</style>
</head>

<body>

<nav class="navbar">
    <div class="navbar-top">
        <a class="logo" href="${pageContext.request.contextPath}/home">
            🤖 AI Resume <span>Analyzer</span>
        </a>

        <div class="user-area">
            <span class="user-name">
                👋 Hi, <c:out value="${user.name}" default="User"/>
            </span>
            <a class="logout" href="${pageContext.request.contextPath}/logout">
                🚪 Logout
            </a>
        </div>
    </div>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/home">🏠 Home</a>
        <a href="${pageContext.request.contextPath}/upload_resume">📄 Analyze Resume</a>
        <a href="${pageContext.request.contextPath}/resume-history">📊 Resume History</a>
        <a href="${pageContext.request.contextPath}/resume-rewriter">✨ AI Resume Rewriter</a>
        <a href="${pageContext.request.contextPath}/job-matching">💼 Job Matching</a>
        <a class="active" href="${pageContext.request.contextPath}/interview-questions">🎯 Interview Questions</a>
        <a href="${pageContext.request.contextPath}/home#features">✨ Features</a>
        <a href="${pageContext.request.contextPath}/home#how-it-works">⚙️ How It Works</a>
    </div>
</nav>

<main>
<div class="container">

    <section class="hero">
        <div class="eyebrow">🎯 AI-Powered Interview Preparation</div>
        <h1>Your Interview <span>Questions</span></h1>
        <p>
            Practice interview questions tailored to your skills and projects.
            Review the difficulty level and suggested answer for every question.
        </p>
    </section>

    <section class="summary-grid">
        <div class="summary-card">
            <div class="summary-icon">📚</div>
            <div class="summary-label">Question Category</div>
            <div class="summary-value cyan">
                <c:out value="${questionType}" default="Technical Interview"/>
            </div>
        </div>

        <div class="summary-card">
            <div class="summary-icon">⚡</div>
            <div class="summary-label">Difficulty Selected</div>
            <div class="summary-value purple">
                <c:out value="${difficulty}" default="Mixed"/>
            </div>
        </div>

        <div class="summary-card">
            <div class="summary-icon">📝</div>
            <div class="summary-label">Questions Requested</div>
            <div class="summary-value">
                <c:out value="${numberOfQuestions}" default="AI Generated"/>
            </div>
        </div>
    </section>

    <section class="panel">
        <div class="panel-header">
            <div>
                <h2>💡 Generated Questions & Answers</h2>
                <p>Question, difficulty and suggested answer are shown separately.</p>
            </div>
            <span class="count" id="questionCount">0</span>
        </div>

        <div class="question-list" id="questionList">
            <div id="rawResult" hidden><c:out value="${questionResult}"/></div>
            <div class="empty-state">
                <div class="icon">⏳</div>
                <h3>Loading interview questions</h3>
                <p>Please wait while the generated result is formatted.</p>
            </div>
        </div>
    </section>

    <div class="actions">
        <button type="button" class="btn btn-primary" onclick="window.print()">
            🖨️ Print Questions
        </button>

        <a class="btn" href="${pageContext.request.contextPath}/interview-questions">
            🔄 Generate More
        </a>

        <a class="btn" href="${pageContext.request.contextPath}/home">
            🏠 Back to Home
        </a>
    </div>

</div>
</main>

<footer class="footer">
    <div class="footer-logo">🤖 AI Resume <span>Analyzer</span></div>
    <div class="footer-desc">Intelligent AI Resume Analyzer and Career Assistant</div>
    <div class="footer-dev">Developed by Krishnakant Patidar</div>
    <a href="mailto:patidarkrishna188@gmail.com">patidarkrishna188@gmail.com</a>
    <div class="footer-line"></div>
    <div class="copyright">© 2026 AI Resume Analyzer | All Rights Reserved</div>
</footer>

<script>
(function () {
    "use strict";

    const list = document.getElementById("questionList");
    const count = document.getElementById("questionCount");
    const rawElement = document.getElementById("rawResult");

    function el(tag, className, text) {
        const node = document.createElement(tag);
        if (className) node.className = className;
        if (text !== undefined && text !== null) {
            node.textContent = text;
        }
        return node;
    }

    function cleanText(value) {
        return (value || "")
            .replace(/\*\*/g, "")
            .replace(/`/g, "")
            .replace(/^\s*[-*]\s+/, "")
            .trim();
    }

    function normalizeDifficulty(value) {
        const difficulty = (value || "").toLowerCase();

        if (difficulty.includes("easy")) return "Easy";
        if (difficulty.includes("medium")) return "Medium";
        if (difficulty.includes("hard")) return "Hard";

        return "";
    }

    function showEmpty(message) {
        list.innerHTML = "";

        const state = el("div", "empty-state");
        state.appendChild(el("div", "icon", "📭"));
        state.appendChild(el("h3", "", "No interview questions found"));
        state.appendChild(el("p", "", message));

        list.appendChild(state);
        count.textContent = "0";
    }

    /*
     * Convert the model response into separate question objects.
     * Supports multiline Markdown and one-line question/answer output.
     */
    function parseResponse(source) {
        let text = (source || "")
            .replace(/\r\n?/g, "\n")
            .replace(/&nbsp;/gi, " ")
            .trim();

        if (!text) return [];

        text = text.replace(/^\s*#+\s*Interview Questions\s*/i, "");

        /*
         * Insert a line break before each numbered question,
         * including when Gemini puts the entire response on one line.
         */
        text = text.replace(
            /(?:^|\s|\*)+(?:QUESTION|Q)\s*(\d+)\s*[:.)-]\s*/gi,
            function (whole, number) {
                return "\n@@QUESTION_" + number + "@@ ";
            }
        );

        text = text.replace(
            /(?:^|\s)\*\*\s*Question\s+(\d+)\s*\*\*/gi,
            "\n@@QUESTION_$1@@ "
        );

        text = text.replace(
            /(?:^|\s)\*\*\s*QUESTION\s+(\d+)\s*\*\*/gi,
            "\n@@QUESTION_$1@@ "
        );

        const lines = text.split("\n");
        const questions = [];
        let current = null;
        let activeField = "";

        function save() {
            if (!current) return;

            current.question = cleanText(current.question);
            current.answer = cleanText(current.answer);
            current.difficulty = normalizeDifficulty(current.difficulty);

            if (current.question) questions.push(current);

            current = null;
            activeField = "";
        }

        function addField(field, value) {
            const cleaned = cleanText(value);

            if (!current || !cleaned) return;

            if (field === "question") {
                current.question +=
                    (current.question ? "\n" : "") + cleaned;
            } else if (field === "answer") {
                current.answer +=
                    (current.answer ? "\n" : "") + cleaned;
            } else if (field === "difficulty") {
                current.difficulty = cleaned;
            }
        }

        lines.forEach(function (rawLine) {
            let line = rawLine.trim();

            if (!line) return;

            const marker = line.match(/^@@QUESTION_(\d+)@@\s*(.*)$/i);

            if (marker) {
                save();
                current = {
                    number: Number(marker[1]),
                    question: "",
                    difficulty: "",
                    answer: ""
                };
                activeField = "question";
                line = marker[2].trim();

                if (!line) return;
            }

            /*
             * Handle labels embedded in a question or answer,
             * even when several labels occur on the same line.
             */
            const labelPattern =
                /(?:^|\s)(?:\*\*)?\s*(DIFFICULTY|ANSWER|SUGGESTED ANSWER|SAMPLE ANSWER|MODEL ANSWER)\s*:\s*/ig;

            const labels = [];
            let match;

            while ((match = labelPattern.exec(line)) !== null) {
                labels.push({
                    index: match.index,
                    end: labelPattern.lastIndex,
                    label: match[1].toUpperCase()
                });
            }

            if (labels.length > 0) {
                const firstLabel = labels[0];
                const questionPart = line.substring(0, firstLabel.index).trim();

                if (!current) {
                    current = {
                        number: questions.length + 1,
                        question: "",
                        difficulty: "",
                        answer: ""
                    };
                }

                if (questionPart) {
                    addField("question", questionPart);
                }

                labels.forEach(function (label, index) {
                    const start = label.end;
                    const end = index + 1 < labels.length
                        ? labels[index + 1].index
                        : line.length;

                    const value = line.substring(start, end)
                        .replace(/^\s*\[/, "")
                        .replace(/\]\s*$/, "")
                        .trim();

                    if (label.label === "DIFFICULTY") {
                        addField("difficulty", value);
                        activeField = "difficulty";
                    } else {
                        addField("answer", value);
                        activeField = "answer";
                    }
                });

                return;
            }

            if (!current) {
                current = {
                    number: questions.length + 1,
                    question: "",
                    difficulty: "",
                    answer: ""
                };
            }

            const stripped = line
                .replace(/^\*\*\s*/, "")
                .replace(/\s*\*\*$/, "")
                .trim();

            if (/^(QUESTION|Q)\s*\d+\s*[:.)-]/i.test(stripped)) {
                const questionText = stripped.replace(
                    /^(?:QUESTION|Q)\s*\d+\s*[:.)-]\s*/i,
                    ""
                );
                addField("question", questionText);
                activeField = "question";
                return;
            }

            if (/^(?:ANSWER|SUGGESTED ANSWER|SAMPLE ANSWER|MODEL ANSWER)\s*:/i.test(stripped)) {
                addField(
                    "answer",
                    stripped.replace(
                        /^(?:ANSWER|SUGGESTED ANSWER|SAMPLE ANSWER|MODEL ANSWER)\s*:\s*/i,
                        ""
                    )
                );
                activeField = "answer";
                return;
            }

            if (/^DIFFICULTY\s*:/i.test(stripped)) {
                addField(
                    "difficulty",
                    stripped.replace(/^DIFFICULTY\s*:\s*/i, "")
                );
                activeField = "difficulty";
                return;
            }

            /*
             * Remove optional brackets around field values.
             */
            const cleaned = stripped
                .replace(/^\[/, "")
                .replace(/\]$/, "")
                .trim();

            if (activeField === "answer") {
                addField("answer", cleaned);
            } else if (activeField === "difficulty") {
                addField("difficulty", cleaned);
            } else {
                addField("question", cleaned);
            }
        });

        save();

        /*
         * Remove common introductory text that may have been
         * incorrectly attached to the first question.
         */
        if (questions.length > 0) {
            questions[0].question = questions[0].question.replace(
                /^(?:here are your interview questions|interview questions|generated questions)\s*:?\s*/i,
                ""
            ).trim();
        }

        return questions.filter(function (item) {
            return item.question.length > 0;
        });
    }

    function renderQuestions(source) {
        const questions = parseResponse(source);

        if (!questions.length) {
            showEmpty(
                "The AI response was empty or could not be separated into questions. Please generate the questions again."
            );
            return;
        }

        list.innerHTML = "";

        questions.forEach(function (question, index) {
            const card = el("article", "question-card");
            const top = el("div", "question-top");
            const number = el("div", "question-number", String(index + 1));
            const main = el("div", "question-main");
            const meta = el("div", "question-meta");

            meta.appendChild(
                el("span", "question-tag", "Interview Question")
            );

            if (question.difficulty) {
                const className = "difficulty " +
                    question.difficulty.toLowerCase();

                meta.appendChild(
                    el("span", className, question.difficulty)
                );
            }

            main.appendChild(meta);
            main.appendChild(
                el("div", "question-text", question.question)
            );

            top.appendChild(number);
            top.appendChild(main);
            card.appendChild(top);

            if (question.answer) {
                const answerBox = el("div", "answer-box");

                answerBox.appendChild(
                    el("div", "answer-title", "✅ SUGGESTED ANSWER")
                );

                answerBox.appendChild(
                    el("div", "answer-text", question.answer)
                );

                card.appendChild(answerBox);
            }

            list.appendChild(card);
        });

        count.textContent = String(questions.length);
    }

    const result = rawElement ? rawElement.textContent : "";
    renderQuestions(result);
})();
</script>

</body>
</html>