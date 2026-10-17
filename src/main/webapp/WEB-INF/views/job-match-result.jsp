<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="theme-color" content="#060b18">
<title>Job Match Result | AI Resume Analyzer</title>

<style>
*{box-sizing:border-box;margin:0;padding:0}
:root{
 --cyan:#67e8f9;--blue:#60a5fa;--purple:#a78bfa;
 --text:#f1f5f9;--muted:#a9bad0;
 --glass:rgba(12,24,44,.69);
 --border:rgba(148,190,230,.20)
}
html{scroll-behavior:smooth}
body{
 min-height:100vh;font-family:"Segoe UI",Arial,sans-serif;
 color:var(--text);line-height:1.65;background:#060b18;
 overflow-x:hidden
}
a{text-decoration:none;color:inherit}

/* FUTURISTIC ANIMATED BACKGROUND - NO VIDEO REQUIRED */
.animated-bg{
 position:fixed;inset:0;z-index:-3;overflow:hidden;
 background:
 radial-gradient(ellipse at 15% 20%,rgba(0,149,255,.20),transparent 40%),
 radial-gradient(ellipse at 85% 75%,rgba(124,58,237,.18),transparent 42%),
 #060b18
}
.animated-bg:before{
 content:"";position:absolute;inset:-50%;
 background-image:
 linear-gradient(rgba(56,189,248,.065) 1px,transparent 1px),
 linear-gradient(90deg,rgba(56,189,248,.065) 1px,transparent 1px);
 background-size:55px 55px;
 transform:perspective(650px) rotateX(15deg) scale(1.2);
 animation:gridMove 28s linear infinite
}
.animated-bg:after{
 content:"";position:absolute;width:600px;height:600px;
 left:calc(50% - 300px);top:calc(50% - 300px);
 border-radius:50%;
 background:conic-gradient(from 0deg,transparent,#0ea5e9,transparent,#8b5cf6,transparent);
 filter:blur(100px);opacity:.13;
 animation:rotateGlow 20s linear infinite
}
.glow{
 position:absolute;border-radius:50%;filter:blur(85px);
 opacity:.25;animation:floatGlow 13s ease-in-out infinite alternate
}
.glow-one{width:300px;height:300px;background:#0284c7;top:10%;left:-100px}
.glow-two{width:350px;height:350px;background:#6d28d9;right:-120px;top:42%;animation-delay:-5s}
.glow-three{width:220px;height:220px;background:#0891b2;left:38%;bottom:-140px;animation-delay:-8s}
.network-lines{
 position:absolute;inset:0;
 background:
 radial-gradient(circle at 15% 25%,rgba(103,232,249,.9) 0 2px,transparent 3px),
 radial-gradient(circle at 38% 18%,rgba(96,165,250,.8) 0 2px,transparent 3px),
 radial-gradient(circle at 64% 32%,rgba(103,232,249,.7) 0 2px,transparent 3px),
 radial-gradient(circle at 82% 21%,rgba(167,139,250,.8) 0 2px,transparent 3px),
 radial-gradient(circle at 27% 68%,rgba(103,232,249,.8) 0 2px,transparent 3px),
 radial-gradient(circle at 72% 77%,rgba(96,165,250,.8) 0 2px,transparent 3px),
 radial-gradient(circle at 90% 61%,rgba(103,232,249,.7) 0 2px,transparent 3px);
 opacity:.55;animation:particles 7s ease-in-out infinite alternate
}
.bg-overlay{
 position:absolute;inset:0;
 background:linear-gradient(180deg,rgba(4,9,21,.55),rgba(4,10,23,.78) 50%,rgba(4,9,20,.9))
}
@keyframes gridMove{from{background-position:0 0}to{background-position:110px 110px}}
@keyframes rotateGlow{to{transform:rotate(360deg)}}
@keyframes floatGlow{from{transform:translate(0,0) scale(1)}to{transform:translate(55px,-35px) scale(1.2)}}
@keyframes particles{from{transform:translateY(0);opacity:.3}to{transform:translateY(-15px);opacity:.75}}

/* NAVIGATION */
.navbar{
 position:sticky;top:0;z-index:100;
 background:rgba(5,12,26,.83);
 border-bottom:1px solid var(--border);
 backdrop-filter:blur(18px);padding:0 5%
}
.navbar-top{min-height:64px;display:flex;align-items:center;justify-content:space-between;gap:16px}
.logo{font-size:19px;font-weight:800;white-space:nowrap;color:white}
.logo span{color:var(--cyan)}
.user-area{display:flex;align-items:center;gap:10px}
.user-name{font-size:12px;color:#dbeafe;padding:7px 12px;border:1px solid var(--border);border-radius:22px;background:rgba(255,255,255,.05)}
.logout{font-size:12px;font-weight:700;color:#fecaca;border:1px solid rgba(248,113,113,.3);background:rgba(220,38,38,.15);padding:7px 12px;border-radius:8px}
.nav-links{display:flex;gap:5px;padding:8px 0 11px;overflow-x:auto;scrollbar-width:none}
.nav-links::-webkit-scrollbar{display:none}
.nav-links a{color:#b2c1d6;font-size:12px;font-weight:600;padding:7px 10px;border-radius:8px;white-space:nowrap;border:1px solid transparent}
.nav-links a:hover,.nav-links a.active{color:var(--cyan);background:rgba(34,211,238,.08);border-color:rgba(103,232,249,.2)}

/* MAIN */
.container{width:92%;max-width:1180px;margin:38px auto 55px}
.page-header{text-align:center;margin-bottom:26px}
.eyebrow{display:inline-block;font-size:10px;letter-spacing:1.7px;font-weight:800;color:var(--cyan);background:rgba(34,211,238,.08);border:1px solid rgba(103,232,249,.25);padding:6px 13px;border-radius:25px;margin-bottom:15px}
.page-header h1{font-size:clamp(28px,4vw,43px);line-height:1.25;letter-spacing:-1px;margin-bottom:10px}
.gradient-text{background:linear-gradient(90deg,#67e8f9,#93c5fd,#c4b5fd);background-clip:text;-webkit-background-clip:text;color:transparent}
.page-header p{color:var(--muted);font-size:13px}
.job-info{display:flex;justify-content:center;flex-wrap:wrap;gap:10px;margin-top:18px}
.job-badge{background:var(--glass);border:1px solid var(--border);padding:8px 13px;border-radius:10px;color:#c5d4e8;font-size:12px;overflow-wrap:anywhere;backdrop-filter:blur(12px)}
.job-badge strong{color:var(--cyan)}

/* GLASS SURFACES */
.glass{
 background:var(--glass);border:1px solid var(--border);
 backdrop-filter:blur(18px);-webkit-backdrop-filter:blur(18px);
 box-shadow:0 16px 45px rgba(0,0,0,.19),inset 0 1px rgba(255,255,255,.035);
 border-radius:17px
}

/* SCORE HERO */
.score-card{
 display:grid;grid-template-columns:1fr auto;align-items:center;gap:25px;
 padding:27px 30px;margin-bottom:17px;
 background:linear-gradient(115deg,rgba(10,37,61,.9),rgba(16,27,52,.8));
 border:1px solid rgba(103,232,249,.27);border-radius:20px;
 backdrop-filter:blur(20px);position:relative;overflow:hidden
}
.score-card:after{content:"";position:absolute;width:230px;height:230px;right:10%;top:-170px;border-radius:50%;background:rgba(34,211,238,.13);filter:blur(55px)}
.score-left{display:flex;align-items:center;gap:16px;position:relative;z-index:1}
.score-icon{width:55px;height:55px;flex-shrink:0;display:grid;place-items:center;font-size:26px;border-radius:15px;background:rgba(34,211,238,.1);border:1px solid rgba(103,232,249,.25)}
.score-title{font-size:21px;font-weight:800}
.score-subtitle{font-size:12px;color:#a9bdd4}
.score-description{font-size:12px;color:#c0d0e4;max-width:500px;margin-top:10px}
.score-ring{
 --score:0;position:relative;z-index:1;width:140px;height:140px;flex-shrink:0;
 border-radius:50%;display:grid;place-items:center;
 background:conic-gradient(from -90deg,#67e8f9 0deg,#60a5fa calc(var(--score)*3.6deg),rgba(148,163,184,.16) calc(var(--score)*3.6deg),rgba(148,163,184,.16) 360deg);
 box-shadow:0 0 32px rgba(56,189,248,.14);
 animation:ringAppear 1s ease-out both
}
.score-ring:before{content:"";position:absolute;inset:9px;border-radius:50%;background:#0b192d;border:1px solid rgba(148,190,230,.17)}
.score-ring-inner{position:relative;text-align:center}
.score-value{font-size:36px;font-weight:900;line-height:1.2;color:#f0fdff}
.score-out-of{font-size:10px;color:#a5b9d0}
@keyframes ringAppear{from{transform:scale(.8);opacity:0}to{transform:scale(1);opacity:1}}

/* SUMMARY */
.quick-summary{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:13px;margin-bottom:27px}
.summary-box{text-align:center;padding:17px 12px;min-width:0;transition:transform .25s,border-color .25s}
.summary-box:hover{transform:translateY(-4px);border-color:rgba(103,232,249,.45)}
.summary-icon{font-size:23px;margin-bottom:5px}
.summary-title{font-size:11px;color:var(--muted)}
.summary-value{font-size:13px;color:var(--cyan);font-weight:800;overflow-wrap:anywhere}

/* SECTIONS */
.section-heading{display:flex;justify-content:space-between;align-items:end;flex-wrap:wrap;gap:10px;margin:28px 0 15px}
.section-kicker{color:var(--cyan);font-size:10px;font-weight:800;letter-spacing:1.6px;margin-bottom:4px}
.section-heading h2{font-size:21px}
.section-heading p{color:var(--muted);font-size:12px}
.cards{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:15px}
.card{padding:20px;min-width:0;transition:transform .2s,border-color .2s}
.card:hover{transform:translateY(-2px);border-color:rgba(103,232,249,.36)}
.card.full{grid-column:1/-1}
.card-head{display:flex;align-items:center;gap:11px;margin-bottom:13px}
.card-icon{width:40px;height:40px;display:grid;place-items:center;flex-shrink:0;border:1px solid rgba(103,232,249,.2);background:rgba(34,211,238,.08);border-radius:11px;font-size:19px}
.card h2{font-size:15px;font-weight:800;color:#edf6ff}
.card-subtitle{font-size:11px;color:#96abc4;margin-top:2px}
.card-content{font-size:13px;line-height:1.8;color:#c4d2e5;white-space:pre-line;overflow-wrap:anywhere;max-height:260px;overflow-y:auto;scrollbar-width:thin;scrollbar-color:#38516c transparent}
.accent-card{background:rgba(10,31,49,.78);border-color:rgba(103,232,249,.3)}

/* ROADMAP */
.learning-card{grid-column:1/-1;padding:22px;border:1px solid rgba(167,139,250,.28);border-radius:18px;background:linear-gradient(135deg,rgba(30,35,73,.75),rgba(10,34,52,.78));backdrop-filter:blur(20px)}
.learning-header{display:flex;align-items:center;gap:12px;margin-bottom:7px}
.learning-icon{width:44px;height:44px;display:grid;place-items:center;border-radius:12px;background:rgba(167,139,250,.13);border:1px solid rgba(167,139,250,.28);font-size:22px}
.learning-header h2{font-size:18px}
.learning-description{font-size:12px;color:var(--muted);margin-bottom:17px}
.roadmap{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:13px}
.roadmap-box{padding:15px;min-width:0;border:1px solid rgba(148,190,230,.15);border-radius:12px;background:rgba(4,13,28,.48)}
.roadmap-box.full{grid-column:1/-1}
.roadmap-label{font-size:13px;font-weight:800;color:#c4b5fd;margin-bottom:8px}
.roadmap-content{font-size:12.5px;line-height:1.8;color:#c4d2e5;white-space:pre-line;overflow-wrap:anywhere;max-height:220px;overflow-y:auto}

/* COMPLETE RESPONSE */
.analysis-card{padding:22px;margin-top:20px}
.analysis-heading{display:flex;align-items:center;gap:12px;margin-bottom:9px}
.analysis-heading h2{font-size:18px}
.analysis-note{font-size:12px;color:var(--muted);margin-bottom:15px}
.analysis-content{padding:18px;border-radius:12px;border:1px solid rgba(148,190,230,.16);background:rgba(3,11,24,.68);color:#d2deed;font-size:13px;line-height:1.9;white-space:pre-wrap;overflow-wrap:anywhere;max-height:650px;overflow-y:auto}

/* BUTTONS */
.actions{display:flex;justify-content:center;flex-wrap:wrap;gap:11px;margin-top:27px}
.btn{display:inline-flex;align-items:center;justify-content:center;padding:11px 16px;border-radius:10px;font-size:12px;font-weight:800;border:1px solid transparent;transition:transform .2s,background .2s}
.btn:hover{transform:translateY(-2px)}
.btn-primary{color:#061321;background:linear-gradient(100deg,#67e8f9,#93c5fd);box-shadow:0 6px 22px rgba(56,189,248,.16)}
.btn-secondary{color:#dce8f8;background:rgba(15,29,49,.8);border-color:rgba(148,190,230,.23)}
.btn-secondary:hover{border-color:rgba(103,232,249,.5);color:var(--cyan)}

/* FOOTER */
.site-footer{margin-top:52px;padding:30px 20px 22px;text-align:center;background:rgba(3,9,20,.86);border-top:1px solid var(--border);backdrop-filter:blur(15px)}
.footer-logo{font-size:19px;font-weight:800;color:var(--cyan);margin-bottom:6px}
.footer-project-title{font-size:12px;color:var(--muted);margin-bottom:13px}
.footer-developer{font-size:12px;color:#d8e3f2;margin-bottom:5px}
.footer-email a{font-size:12px;color:var(--cyan)}
.footer-line{height:1px;max-width:700px;margin:18px auto 13px;background:rgba(148,190,230,.16)}
.footer-copyright{font-size:11px;color:#8294ad}

/* MOBILE */
@media(max-width:900px){
 .quick-summary{grid-template-columns:repeat(2,minmax(0,1fr))}
}
@media(max-width:650px){
 .navbar{padding:0 15px}
 .navbar-top{flex-direction:column;justify-content:center;padding:12px 0;gap:10px}
 .logo{font-size:18px}
 .user-area{flex-wrap:wrap;justify-content:center}
 .nav-links{justify-content:flex-start}
 .container{width:93%;margin-top:25px}
 .page-header h1{letter-spacing:-.4px}
 .page-header p{font-size:12px}
 .score-card{grid-template-columns:1fr;justify-items:center;text-align:center;padding:23px 16px}
 .score-left{flex-direction:column}
 .score-description{margin-left:auto;margin-right:auto}
 .score-ring{width:128px;height:128px}
 .cards{grid-template-columns:1fr}
 .card.full,.learning-card,.roadmap-box.full{grid-column:auto}
 .roadmap{grid-template-columns:1fr}
 .card,.learning-card,.analysis-card{padding:16px}
 .actions{flex-direction:column}
 .btn{width:100%}
}
@media(prefers-reduced-motion:reduce){
 *,*:before,*:after{animation:none!important;transition:none!important;scroll-behavior:auto!important}
}
</style>
</head>

<body>

<!-- ANIMATED BACKGROUND -->
<div class="animated-bg" aria-hidden="true">
    <div class="glow glow-one"></div>
    <div class="glow glow-two"></div>
    <div class="glow glow-three"></div>
    <div class="network-lines"></div>
    <div class="bg-overlay"></div>
</div>

<!-- NAVBAR -->
<nav class="navbar" aria-label="Main navigation">
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
        <a class="active" aria-current="page" href="${pageContext.request.contextPath}/job-matching">💼 Job Matching</a>
        <a href="${pageContext.request.contextPath}/interview-questions">🎯 Interview Questions</a>
        <a href="${pageContext.request.contextPath}/home#features">✨ Features</a>
        <a href="${pageContext.request.contextPath}/home#how-it-works">⚙️ How It Works</a>
    </div>
</nav>

<main class="container">

    <header class="page-header">
        <div class="eyebrow">✦ AI CAREER INTELLIGENCE</div>

        <h1>
            Your Career <span class="gradient-text">Compatibility</span>
        </h1>

        <p>
            Explore your resume's alignment with the target role,
            discover your strengths and plan your next career move.
        </p>

        <div class="job-info">
            <div class="job-badge">
                💼 Target Role:
                <strong><c:out value="${jobTitle}" default="Selected Job"/></strong>
            </div>

            <div class="job-badge">
                📄 Resume:
                <strong><c:out value="${resume.fileName}" default="Uploaded Resume"/></strong>
            </div>
        </div>
    </header>

    <!-- SCORE -->
    <section class="score-card" aria-label="Job match score">
        <div class="score-left">
            <div class="score-icon">🎯</div>

            <div>
                <div class="score-title">Job Match Score</div>
                <div class="score-subtitle">
                    Resume compatibility with your target role
                </div>

                <p class="score-description">
                    Use this AI-generated score as a guide to understand
                    how your resume aligns with the job description.
                    It is an estimate, not a hiring guarantee.
                </p>
            </div>
        </div>

        <div class="score-ring" id="scoreRing">
            <div class="score-ring-inner">
                <div class="score-value">
                    <c:out value="${matchScore}" default="0"/>
                </div>
                <div class="score-out-of">OUT OF 100</div>
            </div>
        </div>
    </section>

    <!-- SUMMARY -->
    <section class="quick-summary" aria-label="Analysis overview">
        <div class="summary-box glass">
            <div class="summary-icon">✅</div>
            <div class="summary-title">Skill Alignment</div>
            <div class="summary-value">Matched Skills</div>
        </div>

        <div class="summary-box glass">
            <div class="summary-icon">⚡</div>
            <div class="summary-title">Growth Areas</div>
            <div class="summary-value">Skill Gaps</div>
        </div>

        <div class="summary-box glass">
            <div class="summary-icon">🧠</div>
            <div class="summary-title">Career Insights</div>
            <div class="summary-value">AI Analysis</div>
        </div>

        <div class="summary-box glass">
            <div class="summary-icon">🚀</div>
            <div class="summary-title">Next Steps</div>
            <div class="summary-value">Learning Plan</div>
        </div>
    </section>

    <div class="section-heading">
        <div>
            <div class="section-kicker">YOUR RESULTS</div>
            <h2>Role Alignment Insights</h2>
        </div>
        <p>Explore your job match details.</p>
    </div>

    <section class="cards">

        <article class="card glass">
            <div class="card-head">
                <div class="card-icon">✅</div>
                <div>
                    <h2>Matching Skills</h2>
                    <div class="card-subtitle">Your relevant strengths</div>
                </div>
            </div>
            <div class="card-content"><c:out value="${matchingSkills}" default="Separate matching-skill details are not available. See the complete AI analysis below."/></div>
        </article>

        <article class="card glass">
            <div class="card-head">
                <div class="card-icon">⚠️</div>
                <div>
                    <h2>Skills to Develop</h2>
                    <div class="card-subtitle">Potential growth areas</div>
                </div>
            </div>
            <div class="card-content"><c:out value="${missingSkills}" default="Separate missing-skill details are not available. See the complete AI analysis below."/></div>
        </article>

        <article class="card glass">
            <div class="card-head">
                <div class="card-icon">💼</div>
                <div>
                    <h2>Experience Gap</h2>
                    <div class="card-subtitle">Experience-related observations</div>
                </div>
            </div>
            <div class="card-content"><c:out value="${experienceGap}" default="Separate experience-gap details are not available. See the complete AI analysis below."/></div>
        </article>

        <article class="card glass">
            <div class="card-head">
                <div class="card-icon">🚀</div>
                <div>
                    <h2>Relevant Projects</h2>
                    <div class="card-subtitle">Project relevance to the role</div>
                </div>
            </div>
            <div class="card-content"><c:out value="${matchingProjects}" default="Separate project recommendations are not available. See the complete AI analysis below."/></div>
        </article>

        <article class="card glass full accent-card">
            <div class="card-head">
                <div class="card-icon">📊</div>
                <div>
                    <h2>Skill Gap Analysis</h2>
                    <div class="card-subtitle">Where to focus your preparation</div>
                </div>
            </div>
            <div class="card-content"><c:out value="${skillGap}" default="Separate skill-gap details are not available. See the complete AI analysis below."/></div>
        </article>

        <!-- LEARNING ROADMAP -->
        <section class="learning-card">
            <div class="learning-header">
                <div class="learning-icon">🎓</div>
                <div>
                    <h2>AI Learning Roadmap</h2>
                    <div class="card-subtitle">Turn skill gaps into a learning plan</div>
                </div>
            </div>

            <p class="learning-description">
                Focus on the skills and knowledge most relevant to your target role.
            </p>

            <div class="roadmap">
                <div class="roadmap-box">
                    <div class="roadmap-label">📚 What to Learn</div>
                    <div class="roadmap-content"><c:out value="${learningGap}" default="Separate learning topics are not available. See the complete AI analysis below."/></div>
                </div>

                <div class="roadmap-box">
                    <div class="roadmap-label">🔥 Learning Priority</div>
                    <div class="roadmap-content"><c:out value="${learningPriority}" default="Separate learning priorities are not available. See the complete AI analysis below."/></div>
                </div>

                <div class="roadmap-box full">
                    <div class="roadmap-label">🎯 Career Focus</div>
                    <div class="roadmap-content">
                        Prioritize relevant job requirements, practice through
                        projects and update your resume with skills you have
                        genuinely developed.
                    </div>
                </div>
            </div>
        </section>

        <article class="card glass">
            <div class="card-head">
                <div class="card-icon">💡</div>
                <div>
                    <h2>AI Recommendations</h2>
                    <div class="card-subtitle">Suggested next steps</div>
                </div>
            </div>
            <div class="card-content"><c:out value="${recommendations}" default="Separate recommendations are not available. See the complete AI analysis below."/></div>
        </article>

        <article class="card glass">
            <div class="card-head">
                <div class="card-icon">📋</div>
                <div>
                    <h2>Final Assessment</h2>
                    <div class="card-subtitle">Overall role compatibility</div>
                </div>
            </div>
            <div class="card-content"><c:out value="${finalAssessment}" default="A separate final assessment is not available. See the complete AI analysis below."/></div>
        </article>
    </section>

    <!-- COMPLETE AI RESPONSE -->
    <section class="analysis-card glass">
        <div class="analysis-heading">
            <div class="card-icon">🧠</div>
            <div>
                <h2>Complete AI Analysis</h2>
                <div class="card-subtitle">Full resume-to-job comparison</div>
            </div>
        </div>

        <p class="analysis-note">
            Your complete AI response is displayed here, including details
            that may not appear in the individual cards.
        </p>

        <div class="analysis-content"><c:out value="${matchResult}" default="The AI analysis result is not available. Verify that the controller sets the matchResult model attribute."/></div>
    </section>

    <!-- ACTIONS -->
    <div class="actions">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/job-matching">
            🔄 Analyze Another Job
        </a>

        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/resume-rewriter">
            ✨ Rewrite Resume
        </a>

        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/interview-questions">
            🎯 Practice Interview
        </a>

        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/home">
            🏠 Dashboard
        </a>
    </div>

</main>

<footer class="site-footer">
    <div class="footer-logo">🤖 AI Resume Analyzer</div>
    <div class="footer-project-title">
        Intelligent AI Resume Analyzer and Career Assistant
    </div>
    <div class="footer-developer">Developed by Krishnakant Patidar</div>
    <div class="footer-email">
        <a href="mailto:patidarkrishna188@gmail.com">patidarkrishna188@gmail.com</a>
    </div>
    <div class="footer-line"></div>
    <div class="footer-copyright">
        © 2026 AI Resume Analyzer | All Rights Reserved
    </div>
</footer>

<script>
(function () {
    "use strict";

    var ring = document.getElementById("scoreRing");
    var valueElement = document.querySelector(".score-value");

    if (ring && valueElement) {
        var score = parseInt(valueElement.textContent.trim(), 10);

        if (!Number.isFinite(score)) {
            score = 0;
        }

        score = Math.max(0, Math.min(100, score));
        ring.style.setProperty("--score", score);
        ring.setAttribute("role", "img");
        ring.setAttribute("aria-label", "Job match score: " + score + " out of 100");
    }
})();
</script>

</body>
</html>