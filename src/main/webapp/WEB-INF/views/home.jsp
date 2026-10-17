<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AI Resume Analyzer | Career Assistant</title>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>
*{margin:0;padding:0;box-sizing:border-box}
html{scroll-behavior:smooth;scroll-padding-top:100px}
body{font-family:Arial,Helvetica,sans-serif;background:#020617;color:#fff;overflow-x:hidden}
a{text-decoration:none}
button,a{-webkit-tap-highlight-color:transparent}
img,video{max-width:100%}

/* NAVBAR */
.navbar{position:sticky;top:0;z-index:9999;background:rgba(2,6,23,.94);backdrop-filter:blur(20px);border-bottom:1px solid rgba(255,255,255,.08)}
.navbar-top{width:min(1400px,94%);min-height:64px;margin:auto;display:flex;align-items:center;justify-content:space-between;gap:15px}
.logo{font-size:20px;font-weight:800;white-space:nowrap;background:linear-gradient(90deg,#60a5fa,#22d3ee,#a78bfa);-webkit-background-clip:text;background-clip:text;color:transparent}
.top-user{display:flex;align-items:center;gap:10px;min-width:0}
.user-name{padding:8px 14px;border-radius:30px;color:#dbeafe;background:rgba(37,99,235,.12);border:1px solid rgba(96,165,250,.18);font-size:13px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;max-width:240px}
.logout{padding:8px 14px;border-radius:9px;color:#fff;background:linear-gradient(135deg,#ef4444,#dc2626);font-size:13px;font-weight:700;transition:.3s;white-space:nowrap}
.logout:hover{transform:translateY(-2px);box-shadow:0 10px 25px rgba(239,68,68,.35)}
.nav-links{width:min(1400px,94%);margin:auto;display:flex;justify-content:center;gap:5px;padding:5px 0 10px;overflow-x:auto;scrollbar-width:none;-webkit-overflow-scrolling:touch}
.nav-links::-webkit-scrollbar{display:none}
.nav-links a{color:#cbd5e1;font-size:12px;font-weight:600;padding:8px 11px;border-radius:8px;white-space:nowrap;flex-shrink:0;transition:.3s}
.nav-links a:hover{color:#fff;background:rgba(37,99,235,.18)}
.nav-links a.active{color:#fff;background:linear-gradient(135deg,#2563eb,#7c3aed);box-shadow:0 5px 20px rgba(37,99,235,.3)}

/* HERO WITH BACKGROUND VIDEO */
.hero{
    position:relative;
    isolation:isolate;
    min-height:700px;
    padding:90px max(5%,calc((100% - 1400px)/2));
    display:flex;
    align-items:center;
    gap:65px;
    overflow:hidden;
    background:
        radial-gradient(circle at 10% 20%,rgba(37,99,235,.38),transparent 32%),
        radial-gradient(circle at 90% 20%,rgba(124,58,237,.35),transparent 32%),
        radial-gradient(circle at 50% 100%,rgba(6,182,212,.18),transparent 35%),
        #020617;
}
.hero-video{
    position:absolute;
    inset:0;
    width:100%;
    height:100%;
    object-fit:cover;
    z-index:-2;
    opacity:.40;
    pointer-events:none;
}
.hero-video-overlay{
    position:absolute;
    inset:0;
    z-index:-1;
    background:linear-gradient(90deg,rgba(2,6,23,.92),rgba(2,6,23,.66) 55%,rgba(2,6,23,.78));
    pointer-events:none;
}

.hero::before{
    content:"";
    position:absolute;
    inset:-50%;
    z-index:0;
    pointer-events:none;
    background-image:linear-gradient(rgba(255,255,255,.035) 1px,transparent 1px),linear-gradient(90deg,rgba(255,255,255,.035) 1px,transparent 1px);
    background-size:45px 45px;
    transform:perspective(500px) rotateX(55deg);
    animation:gridMove 14s linear infinite;
}
@keyframes gridMove{
    from{transform:perspective(500px) rotateX(55deg) translateY(0)}
    to{transform:perspective(500px) rotateX(55deg) translateY(45px)}
}
.hero-content,.hero-dashboard{position:relative;z-index:2;min-width:0}
.hero-content{flex:1;max-width:700px}
.welcome{display:inline-block;padding:9px 17px;margin-bottom:20px;border-radius:30px;color:#a5f3fc;background:rgba(6,182,212,.09);border:1px solid rgba(6,182,212,.3);font-size:13px;font-weight:700}
.hero h1{font-size:clamp(40px,5.3vw,72px);line-height:1.04;letter-spacing:-2px;margin-bottom:25px;overflow-wrap:anywhere}
.hero h1 span{display:inline-block;background:linear-gradient(90deg,#60a5fa,#22d3ee,#a78bfa,#ec4899,#60a5fa);background-size:300%;-webkit-background-clip:text;background-clip:text;color:transparent;animation:gradientText 5s ease infinite}
@keyframes gradientText{50%{background-position:100%}}
.hero p{color:#cbd5e1;font-size:17px;line-height:1.8;max-width:680px;margin-bottom:32px}
.hero-buttons{display:flex;flex-wrap:wrap;gap:14px}
.primary-btn,.secondary-btn{display:inline-block;padding:15px 24px;border-radius:12px;font-weight:700;transition:.35s;text-align:center}
.primary-btn{color:#fff;background:linear-gradient(135deg,#2563eb,#7c3aed);box-shadow:0 12px 35px rgba(37,99,235,.3)}
.primary-btn:hover{transform:translateY(-4px) scale(1.02)}
.secondary-btn{color:#dbeafe;border:1px solid rgba(255,255,255,.18);background:rgba(255,255,255,.06);backdrop-filter:blur(10px)}
.secondary-btn:hover{background:rgba(255,255,255,.13);transform:translateY(-4px)}

/* HERO DASHBOARD */
.hero-dashboard{flex:1;width:100%;max-width:590px;min-height:390px;padding:20px;border-radius:28px;background:linear-gradient(145deg,rgba(255,255,255,.12),rgba(255,255,255,.035));border:1px solid rgba(255,255,255,.14);backdrop-filter:blur(20px);box-shadow:0 35px 100px rgba(0,0,0,.45);animation:dashboardFloat 5s ease-in-out infinite}
@keyframes dashboardFloat{50%{transform:translateY(-10px)}}
.dashboard-top{display:flex;align-items:center;justify-content:space-between;gap:10px;margin-bottom:17px}
.dashboard-title{font-size:14px;font-weight:800}
.live{color:#86efac;font-size:10px;font-weight:800;white-space:nowrap}
.live span{display:inline-block;width:7px;height:7px;margin-right:5px;border-radius:50%;background:#22c55e;box-shadow:0 0 12px #22c55e}
.ai-screen{position:relative;min-height:245px;overflow:hidden;border-radius:20px;background:radial-gradient(circle at center,rgba(37,99,235,.2),transparent 60%),#07111f;border:1px solid rgba(96,165,250,.15)}
.ai-screen::before{content:"";position:absolute;width:170px;height:170px;left:50%;top:50%;transform:translate(-50%,-50%);border-radius:50%;border:1px solid rgba(34,211,238,.3);box-shadow:0 0 60px rgba(34,211,238,.15)}
.ai-chip{position:absolute;left:50%;top:50%;transform:translate(-50%,-50%);z-index:4;width:82px;height:82px;display:flex;align-items:center;justify-content:center;border-radius:22px;color:#67e8f9;background:linear-gradient(145deg,#0f172a,#172554);border:1px solid rgba(103,232,249,.45);box-shadow:0 0 40px rgba(34,211,238,.25);font-size:29px;font-weight:900;animation:chipFloat 3s ease-in-out infinite}
@keyframes chipFloat{50%{transform:translate(-50%,-50%) scale(1.06)}}
.ai-line{position:absolute;height:1px;background:linear-gradient(90deg,transparent,#22d3ee,transparent);box-shadow:0 0 10px #22d3ee;animation:lineMove 3s linear infinite}
.line1{width:170px;left:7%;top:30%}
.line2{width:180px;right:5%;top:63%;animation-delay:1s}
.line3{width:130px;left:25%;bottom:20%;animation-delay:2s}
@keyframes lineMove{50%{opacity:.25}}
.ai-tag{position:absolute;z-index:5;padding:7px 10px;border-radius:9px;color:#dbeafe;background:rgba(15,23,42,.82);border:1px solid rgba(255,255,255,.12);backdrop-filter:blur(8px);font-size:9px;font-weight:700}
.tag1{left:15px;top:25px}.tag2{right:15px;top:45px}.tag3{left:18px;bottom:25px}.tag4{right:15px;bottom:35px}
.dashboard-bottom{display:grid;grid-template-columns:90px minmax(0,1fr);gap:15px;margin-top:15px;padding:13px;border-radius:15px;background:rgba(255,255,255,.045);border:1px solid rgba(255,255,255,.08)}
.score-ring{width:72px;height:72px;border-radius:50%;display:flex;align-items:center;justify-content:center;background:conic-gradient(#22c55e 85%,rgba(255,255,255,.08) 0);position:relative}
.score-ring::before{content:"";position:absolute;width:54px;height:54px;border-radius:50%;background:#07111f}
.score-ring strong{position:relative;font-size:19px}
.score-text{min-width:0}
.score-text h3{font-size:14px;margin-bottom:5px}
.score-text p{color:#94a3b8;font-size:10px;line-height:1.6;margin:0}

/* COMMON SECTIONS */
.section{position:relative;padding:95px max(5%,calc((100% - 1400px)/2));overflow:hidden;text-align:center}
.section-title{font-size:clamp(30px,4vw,46px);margin-bottom:12px;overflow-wrap:anywhere}
.section-subtitle{color:#94a3b8;font-size:15px;margin-bottom:50px;line-height:1.7}
.features-section{background:radial-gradient(circle at 5% 15%,rgba(37,99,235,.16),transparent 25%),radial-gradient(circle at 95% 85%,rgba(124,58,237,.16),transparent 25%),#030712}
.features-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:22px}

/* FEATURE CARDS */
.feature-card{position:relative;min-height:325px;overflow:hidden;border-radius:24px;background:#0f172a;border:1px solid rgba(255,255,255,.1);transition:transform .4s,box-shadow .4s,border-color .4s;isolation:isolate}
.feature-card:hover{transform:translateY(-10px) scale(1.01);box-shadow:0 30px 70px rgba(0,0,0,.5);border-color:rgba(96,165,250,.42)}
.video-bg{position:absolute;inset:0;width:100%;height:100%;object-fit:cover;z-index:0;opacity:.72;transform:scale(1.05);transition:transform .7s,opacity .5s}
.feature-card:hover .video-bg{transform:scale(1.14);opacity:.9}
.video-overlay{position:absolute;inset:0;z-index:1;background:linear-gradient(180deg,rgba(2,6,23,.05),rgba(2,6,23,.30) 35%,rgba(2,6,23,.98) 100%)}
.video-glow{position:absolute;width:190px;height:190px;right:-80px;top:-70px;border-radius:50%;z-index:2;filter:blur(8px);animation:glowFloat 5s ease-in-out infinite}
.blue-glow{background:rgba(37,99,235,.42)}.cyan-glow{background:rgba(6,182,212,.42)}.green-glow{background:rgba(34,197,94,.38)}.purple-glow{background:rgba(124,58,237,.44)}.pink-glow{background:rgba(236,72,153,.4)}.orange-glow{background:rgba(249,115,22,.4)}
@keyframes glowFloat{50%{transform:translate(-30px,25px) scale(1.25)}}
.feature-content{position:absolute;left:0;right:0;bottom:0;z-index:5;padding:25px;text-align:left}
.feature-icon{position:absolute;right:20px;top:20px;z-index:5;width:55px;height:55px;display:flex;align-items:center;justify-content:center;border-radius:16px;background:rgba(15,23,42,.7);border:1px solid rgba(255,255,255,.2);backdrop-filter:blur(12px);font-size:24px;animation:iconFloat 3s ease-in-out infinite}
@keyframes iconFloat{50%{transform:translateY(-6px)}}
.feature-badge{display:inline-block;padding:6px 10px;margin-bottom:10px;border-radius:20px;background:rgba(255,255,255,.08);border:1px solid rgba(255,255,255,.14);color:#dbeafe;font-size:9px;font-weight:800;letter-spacing:1px}
.feature-content h3{font-size:20px;margin-bottom:9px}
.feature-content p{color:#cbd5e1;font-size:12px;line-height:1.7;max-width:450px}

/* ANIMATED FEATURE VISUALS */
.visual{position:absolute;z-index:3;left:25px;right:25px;top:50px;height:110px;pointer-events:none}
.visual-ring{position:absolute;width:105px;height:105px;left:50%;top:50%;transform:translate(-50%,-50%);border-radius:50%;border:1px solid rgba(96,165,250,.4);box-shadow:0 0 30px rgba(37,99,235,.2);animation:ringRotate 8s linear infinite}
.visual-ring::before{content:"";position:absolute;inset:15px;border-radius:50%;border:1px dashed rgba(34,211,238,.6)}
@keyframes ringRotate{to{transform:translate(-50%,-50%) rotate(360deg)}}
.visual-core{position:absolute;left:50%;top:50%;transform:translate(-50%,-50%);width:38px;height:38px;display:flex;align-items:center;justify-content:center;border-radius:12px;background:linear-gradient(135deg,#2563eb,#7c3aed);box-shadow:0 0 30px rgba(37,99,235,.5);font-size:15px;animation:corePulse 2s ease-in-out infinite}
@keyframes corePulse{50%{transform:translate(-50%,-50%) scale(1.15)}}
.network-dot{position:absolute;width:9px;height:9px;border-radius:50%;background:#22d3ee;box-shadow:0 0 15px #22d3ee;animation:dotPulse 1.8s ease-in-out infinite}
.network-dot:nth-child(1){left:10%;top:25%}.network-dot:nth-child(2){left:28%;top:70%;animation-delay:.3s}.network-dot:nth-child(3){right:24%;top:20%;animation-delay:.6s}.network-dot:nth-child(4){right:7%;top:65%;animation-delay:.9s}
@keyframes dotPulse{50%{transform:scale(1.7);opacity:.5}}
.network-line{position:absolute;height:1px;background:linear-gradient(90deg,transparent,rgba(34,211,238,.7),transparent);transform-origin:left center;animation:linePulse 2s ease-in-out infinite}
.nl1{width:120px;left:13%;top:38%;transform:rotate(27deg)}.nl2{width:130px;left:29%;top:69%;transform:rotate(-25deg)}.nl3{width:120px;right:17%;top:36%;transform:rotate(145deg)}
@keyframes linePulse{50%{opacity:.2}}
.ats-visual{display:flex;align-items:center;justify-content:center;gap:25px}
.ats-circle{width:100px;height:100px;border-radius:50%;display:flex;align-items:center;justify-content:center;background:conic-gradient(#22c55e 85%,rgba(255,255,255,.1) 0);position:relative}
.ats-circle::before{content:"";position:absolute;width:72px;height:72px;border-radius:50%;background:#07111f}
.ats-circle strong{position:relative;font-size:25px}
.ats-bars{display:flex;align-items:end;gap:7px;height:75px}
.ats-bar{width:10px;border-radius:5px 5px 2px 2px;background:linear-gradient(to top,#22c55e,#86efac);animation:barAnimation 1.5s ease-in-out infinite alternate}
.ats-bar:nth-child(1){height:30%}.ats-bar:nth-child(2){height:55%;animation-delay:.2s}.ats-bar:nth-child(3){height:80%;animation-delay:.4s}.ats-bar:nth-child(4){height:65%;animation-delay:.6s}.ats-bar:nth-child(5){height:95%;animation-delay:.8s}
@keyframes barAnimation{to{transform:scaleY(.55)}}
.match-visual{display:flex;align-items:center;justify-content:center;gap:28px}
.match-box{width:125px;height:80px;padding:13px;border-radius:14px;background:rgba(15,23,42,.8);border:1px solid rgba(167,139,250,.3);box-shadow:0 0 25px rgba(124,58,237,.15)}
.match-box span{display:block;width:75%;height:6px;margin-bottom:8px;border-radius:5px;background:#7c3aed}
.match-box span:nth-child(2){width:55%;background:#a78bfa}.match-box span:nth-child(3){width:85%;background:#c4b5fd}
.match-arrow{font-size:30px;color:#c4b5fd;animation:arrowMove 1.5s ease-in-out infinite}
@keyframes arrowMove{50%{transform:translateX(8px)}}
.skill-visual{display:flex;justify-content:center;align-items:center;gap:13px}
.skill-pill{padding:10px 14px;border-radius:30px;color:#e9d5ff;background:rgba(124,58,237,.16);border:1px solid rgba(167,139,250,.28);font-size:10px;font-weight:800;animation:skillFloat 2.5s ease-in-out infinite}
.skill-pill:nth-child(2){animation-delay:.3s}.skill-pill:nth-child(3){animation-delay:.6s}
@keyframes skillFloat{50%{transform:translateY(-9px)}}
.learning-visual{display:flex;align-items:center;justify-content:center}
.learning-step{width:34px;height:34px;display:flex;align-items:center;justify-content:center;border-radius:50%;background:linear-gradient(135deg,#06b6d4,#22c55e);font-size:11px;font-weight:800;box-shadow:0 0 20px rgba(6,182,212,.25)}
.learning-line{width:35px;height:3px;background:linear-gradient(90deg,#06b6d4,#22c55e)}
.interview-visual{display:flex;justify-content:center;align-items:center;gap:20px}
.mic{width:65px;height:65px;display:flex;align-items:center;justify-content:center;border-radius:50%;background:linear-gradient(135deg,#f97316,#ec4899);box-shadow:0 0 35px rgba(249,115,22,.3);font-size:28px;animation:micPulse 2s infinite}
@keyframes micPulse{50%{transform:scale(1.1)}}
.wave{display:flex;align-items:center;gap:4px;height:65px}
.wave span{width:5px;border-radius:5px;background:#fb923c;animation:waveAnimation 1s ease-in-out infinite alternate}
.wave span:nth-child(1){height:25%}.wave span:nth-child(2){height:60%;animation-delay:.15s}.wave span:nth-child(3){height:90%;animation-delay:.3s}.wave span:nth-child(4){height:50%;animation-delay:.45s}.wave span:nth-child(5){height:75%;animation-delay:.6s}
@keyframes waveAnimation{to{transform:scaleY(.35)}}
.rewrite-visual{display:flex;justify-content:center;gap:20px}
.document{width:95px;height:110px;padding:15px;border-radius:10px;background:#f8fafc;box-shadow:0 15px 35px rgba(0,0,0,.25);animation:documentFloat 3s ease-in-out infinite}
.document:nth-child(2){background:#e0e7ff;animation-delay:.5s}
.document-line{height:5px;margin-bottom:8px;border-radius:4px;background:#64748b}
.document-line.short{width:60%}
@keyframes documentFloat{50%{transform:translateY(-8px) rotate(2deg)}}
.history-visual{display:flex;align-items:center;justify-content:center;gap:9px}
.history-box{width:52px;height:72px;padding:9px;border-radius:9px;background:linear-gradient(145deg,#0f172a,#1e293b);border:1px solid rgba(96,165,250,.3);animation:historyFloat 2.5s ease-in-out infinite}
.history-box:nth-child(2){transform:translateY(-12px);animation-delay:.3s}.history-box:nth-child(3){animation-delay:.6s}
.history-line{height:4px;margin-bottom:6px;border-radius:4px;background:#38bdf8}
.history-line.short{width:65%}
@keyframes historyFloat{50%{transform:translateY(-8px)}}

/* WORKFLOW */
.workflow-section{background:radial-gradient(circle at 10% 20%,rgba(37,99,235,.14),transparent 25%),radial-gradient(circle at 90% 80%,rgba(124,58,237,.15),transparent 25%),#020617}
.workflow{position:relative;display:grid;grid-template-columns:repeat(5,minmax(0,1fr));gap:17px}
.workflow-line{position:absolute;left:8%;right:8%;top:54px;height:3px;background:linear-gradient(90deg,#2563eb,#06b6d4,#7c3aed,#ec4899);box-shadow:0 0 20px rgba(37,99,235,.35);z-index:0}
.workflow-card{position:relative;z-index:2;min-height:290px;padding:24px 17px;border-radius:22px;background:linear-gradient(145deg,rgba(15,23,42,.98),rgba(15,23,42,.7));border:1px solid rgba(96,165,250,.12);transition:.4s;min-width:0}
.workflow-card:hover{transform:translateY(-9px);border-color:rgba(96,165,250,.42);box-shadow:0 25px 60px rgba(37,99,235,.16)}
.workflow-number{width:62px;height:62px;margin:0 auto 19px;display:flex;align-items:center;justify-content:center;border-radius:50%;background:linear-gradient(135deg,#2563eb,#7c3aed);border:4px solid #07111f;box-shadow:0 0 0 2px rgba(96,165,250,.28);font-size:20px;font-weight:800}
.workflow-icon{font-size:30px;margin-bottom:13px}
.workflow-card h3{font-size:18px;margin-bottom:10px}
.workflow-card p{color:#94a3b8;font-size:12px;line-height:1.7}
.workflow-status{max-width:800px;margin:40px auto 0;padding:15px;border-radius:14px;color:#bfdbfe;background:rgba(37,99,235,.07);border:1px solid rgba(96,165,250,.13);font-size:13px}

/* WHY USE */
.why-section{position:relative;padding:100px max(5%,calc((100% - 1400px)/2));background:#020617;overflow:hidden;text-align:center}
.why-container{position:relative;z-index:3;display:grid;grid-template-columns:minmax(0,.85fr) minmax(0,1.15fr);gap:60px;align-items:center;margin-top:50px}
.ai-visual{min-height:430px;display:flex;align-items:center;justify-content:center;position:relative;border-radius:30px;background:linear-gradient(145deg,rgba(15,23,42,.98),rgba(15,23,42,.65));border:1px solid rgba(96,165,250,.14);box-shadow:0 30px 80px rgba(0,0,0,.35)}
.ai-orbit{width:225px;height:225px;border-radius:50%;display:flex;align-items:center;justify-content:center;background:conic-gradient(#2563eb,#06b6d4,#7c3aed,#ec4899,#2563eb);animation:orbit 8s linear infinite;box-shadow:0 0 70px rgba(37,99,235,.25)}
@keyframes orbit{to{transform:rotate(360deg)}}
.ai-orbit::before{content:"";position:absolute;width:180px;height:180px;border-radius:50%;background:#07111f}
.ai-center{position:relative;z-index:2;animation:counterOrbit 8s linear infinite}
@keyframes counterOrbit{to{transform:rotate(-360deg)}}
.ai-center strong{display:block;font-size:40px;background:linear-gradient(90deg,#60a5fa,#22d3ee,#a78bfa);-webkit-background-clip:text;background-clip:text;color:transparent}
.ai-center span{color:#94a3b8;font-size:9px;letter-spacing:1px}
.ai-active{position:absolute;bottom:28px;padding:9px 16px;border-radius:30px;color:#86efac;background:rgba(34,197,94,.07);border:1px solid rgba(34,197,94,.2);font-size:10px;font-weight:800}
.benefits{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:17px}
.benefit{padding:21px;border-radius:18px;text-align:left;background:rgba(255,255,255,.045);border:1px solid rgba(255,255,255,.08);transition:.35s;min-width:0}
.benefit:hover{transform:translateY(-6px);background:rgba(37,99,235,.09);border-color:rgba(96,165,250,.27)}
.benefit-icon{width:45px;height:45px;display:flex;align-items:center;justify-content:center;border-radius:13px;margin-bottom:14px;background:linear-gradient(135deg,rgba(37,99,235,.2),rgba(124,58,237,.2));font-size:21px}
.benefit h3{font-size:15px;margin-bottom:7px}
.benefit p{color:#94a3b8;font-size:12px;line-height:1.6}

/* CTA */
.cta{padding:100px 20px;text-align:center;background:radial-gradient(circle at 20% 30%,rgba(6,182,212,.27),transparent 30%),radial-gradient(circle at 80% 70%,rgba(124,58,237,.3),transparent 30%),linear-gradient(135deg,#07152a,#11103a)}
.cta h2{font-size:clamp(30px,4vw,45px);margin-bottom:15px}
.cta p{color:#cbd5e1;font-size:17px;line-height:1.8;margin-bottom:30px}
.cta-button{display:inline-block;padding:16px 30px;border-radius:12px;color:#1d4ed8;background:#fff;font-weight:800;transition:.35s}
.cta-button:hover{transform:translateY(-4px) scale(1.04)}

/* FOOTER */
.site-footer{padding:40px 20px 25px;text-align:center;background:#030712}
.footer-logo{font-size:21px;font-weight:800;margin-bottom:10px}
.footer-project-title{color:#cbd5e1;font-size:14px;margin-bottom:17px}
.footer-developer{font-size:14px;margin-bottom:7px}
.footer-email a{color:#5eead4;font-size:13px;overflow-wrap:anywhere}
.footer-line{width:min(900px,100%);height:1px;margin:24px auto 16px;background:#1e293b}
.footer-copyright{color:#64748b;font-size:12px;line-height:1.7}

/* RESPONSIVE TABLET */
@media(max-width:1100px){
.hero{flex-direction:column;text-align:center;min-height:auto;padding-top:75px;padding-bottom:75px;gap:40px}
.hero-content{max-width:850px;width:100%}
.hero p{margin-left:auto;margin-right:auto}
.hero-buttons{justify-content:center}
.hero-dashboard{max-width:700px}
.features-grid{grid-template-columns:repeat(2,minmax(0,1fr))}
.workflow{grid-template-columns:repeat(3,minmax(0,1fr))}
.workflow-line{display:none}
.why-container{grid-template-columns:1fr;gap:35px}
.ai-visual{max-width:650px;width:100%;margin:auto}
}

/* RESPONSIVE MOBILE */
@media(max-width:768px){
.navbar-top{width:94%;padding:12px 0;flex-direction:row;flex-wrap:wrap;min-height:60px}
.top-user{gap:8px}
.nav-links{justify-content:flex-start;width:94%}
.nav-links a{font-size:11px;padding:9px 10px}
.hero{padding:65px 5%;gap:35px}
.hero h1{letter-spacing:-1px}
.hero-dashboard{width:100%;min-height:0}
.features-grid{grid-template-columns:1fr}
.feature-card{min-height:325px}
.workflow{grid-template-columns:repeat(2,minmax(0,1fr))}
.workflow-card{min-height:250px}
.benefits{grid-template-columns:repeat(2,minmax(0,1fr))}
.ai-visual{min-height:350px}
.hero-video{opacity:.30}
.hero-video-overlay{background:rgba(2,6,23,.78)}
.section{padding-top:75px;padding-bottom:75px}
.why-section{padding-top:75px;padding-bottom:75px}
}

/* RESPONSIVE SMALL MOBILE */
@media(max-width:520px){
.navbar-top{align-items:center;gap:10px}
.logo{font-size:17px;white-space:normal}
.top-user{max-width:100%;justify-content:flex-end}
.user-name{max-width:125px;padding:7px 9px;font-size:10px}
.logout{font-size:11px;padding:8px 10px}
.nav-links{padding-bottom:8px}
.nav-links a{font-size:10px;padding:8px 9px}
.hero{padding:55px 18px;gap:30px}
.hero h1{font-size:clamp(32px,9vw,40px);letter-spacing:-1px;line-height:1.12}
.hero p{font-size:14px;line-height:1.75}
.welcome{font-size:11px;padding:8px 12px}
.hero-buttons{flex-direction:column;width:100%;gap:11px}
.primary-btn,.secondary-btn{width:100%;text-align:center;padding:14px 16px;font-size:13px}
.hero-dashboard{padding:13px;border-radius:20px}
.dashboard-title{font-size:12px}
.ai-screen{min-height:210px}
.ai-screen::before{width:140px;height:140px}
.ai-chip{width:65px;height:65px;font-size:23px}
.ai-tag{font-size:8px;padding:6px 7px}
.tag1{left:8px;top:15px}.tag2{right:8px;top:25px}.tag3{left:8px;bottom:15px}.tag4{right:8px;bottom:20px}
.dashboard-bottom{grid-template-columns:70px minmax(0,1fr);gap:10px;padding:10px}
.score-ring{width:62px;height:62px}
.score-ring::before{width:46px;height:46px}
.score-ring strong{font-size:16px}
.score-text h3{font-size:12px}
.score-text p{font-size:9px}
.section{padding:65px 16px}
.section-title{font-size:30px}
.section-subtitle{font-size:13px;margin-bottom:32px}
.features-grid{gap:15px}
.feature-card{min-height:325px;border-radius:19px}
.feature-content{padding:19px}
.feature-content h3{font-size:18px}
.feature-content p{font-size:11px}
.feature-icon{right:14px;top:14px;width:46px;height:46px;font-size:20px}
.visual{left:15px;right:15px}
.workflow{grid-template-columns:1fr;gap:13px}
.workflow-card{min-height:0;padding:20px 15px}
.workflow-number{width:52px;height:52px;font-size:17px}
.workflow-card h3{font-size:16px}
.workflow-card p{font-size:12px}
.workflow-status{font-size:11px;margin-top:25px}
.why-section{padding:65px 16px}
.why-container{margin-top:30px;gap:25px}
.ai-visual{min-height:290px}
.ai-orbit{width:175px;height:175px}
.ai-orbit::before{width:140px;height:140px}
.ai-center strong{font-size:32px}
.ai-active{bottom:18px;font-size:9px;padding:8px 10px}
.benefits{grid-template-columns:1fr;gap:12px}
.benefit{padding:18px}
.cta{padding:65px 18px}
.cta h2{font-size:30px}
.cta p{font-size:14px}
.cta-button{display:block;width:100%;padding:15px}
.site-footer{padding:32px 15px 20px}
.footer-logo{font-size:19px}
.footer-project-title{font-size:12px;line-height:1.7}
.footer-developer{font-size:13px}
.footer-copyright{font-size:11px}
}

/* EXTRA SMALL DEVICES */
@media(max-width:360px){
.logo{font-size:15px}
.user-name{max-width:105px}
.logout{font-size:10px;padding:7px 8px}
.hero h1{font-size:30px}
.hero p{font-size:13px}
.feature-card{min-height:340px}
.feature-content h3{font-size:16px}
.ai-tag{font-size:7px}
.ai-active{font-size:8px}
}

/* REDUCED MOTION */
@media(prefers-reduced-motion:reduce){
*,*::before,*::after{
    animation-duration:.01ms!important;
    animation-iteration-count:1!important;
    scroll-behavior:auto!important;
    transition-duration:.01ms!important;
}
.hero-video{display:none}
}






/* FOOTER SOCIAL ICONS WITH BOX */
.footer-socials {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 14px;
    margin: 15px auto 20px;
}

.footer-socials a {
    width: 34px;
    height: 34px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #94a3b8;
    font-size: 16px;
    text-decoration: none;
    border: 1px solid rgba(148, 163, 184, 0.25);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.04);
    transition: all 0.3s ease;
}

.footer-socials a:hover {
    color: #fff;
    border-color: #38bdf8;
    background: rgba(56, 189, 248, 0.12);
    transform: translateY(-2px);
}



</style>
</head>

<body>

<nav class="navbar">
    <div class="navbar-top">
        <div class="logo">🤖 AI Resume Analyzer</div>
        <div class="top-user">
            <span class="user-name">👋 Hi, ${user.name}</span>
            <a class="logout" href="${pageContext.request.contextPath}/logout">🚪 Logout</a>
        </div>
    </div>

    <div class="nav-links">
        <a class="active" href="${pageContext.request.contextPath}/home">🏠 Home</a>
        <a href="${pageContext.request.contextPath}/upload_resume">📄 Analyze Resume</a>
        <a href="${pageContext.request.contextPath}/resume-history">📊 Resume History</a>
        <a href="${pageContext.request.contextPath}/resume-rewriter">✨ AI Resume Rewriter</a>
        <a href="${pageContext.request.contextPath}/job-matching">💼 Job Matching</a>
        <a href="${pageContext.request.contextPath}/interview-questions">🎯 Interview Questions</a>
        <a href="${pageContext.request.contextPath}/home#features">✨ Features</a>
        <a href="${pageContext.request.contextPath}/home#how-it-works">⚙️ How It Works</a>
    </div>
</nav>

<section class="hero">

   <!-- Your own meeting video: Hero background only -->
<video class="hero-video" autoplay muted loop playsinline preload="metadata" aria-hidden="true">
    <source src="${pageContext.request.contextPath}/videos/meeting.mp4" type="video/mp4">
</video>
<div class="hero-video-overlay"></div>

    <div class="hero-content">
        <div class="welcome">👋 Welcome back, ${user.name}!</div>
        <h1>Make Your Resume <span>AI-Powered</span></h1>
        <p>Analyze your resume with Artificial Intelligence, improve your ATS score, identify missing skills, match jobs, prepare for interviews and build a stronger professional profile.</p>

        <div class="hero-buttons">
            <a class="primary-btn" href="${pageContext.request.contextPath}/upload_resume">📄 Analyze My Resume</a>
            <a class="secondary-btn" href="#how-it-works">⚡ How It Works</a>
        </div>
    </div>

    <div class="hero-dashboard">
        <div class="dashboard-top">
            <div class="dashboard-title">🤖 AI Resume Intelligence</div>
            <div class="live"><span></span> AI ACTIVE</div>
        </div>

        <div class="ai-screen">
            <div class="ai-line line1"></div>
            <div class="ai-line line2"></div>
            <div class="ai-line line3"></div>
            <div class="ai-chip">AI</div>
            <div class="ai-tag tag1">✓ Resume Scan</div>
            <div class="ai-tag tag2">📊 ATS Analysis</div>
            <div class="ai-tag tag3">⚡ Skill Gap</div>
            <div class="ai-tag tag4">✓ AI Suggestions</div>
        </div>

        <div class="dashboard-bottom">
            <div class="score-ring"><strong>85</strong></div>
            <div class="score-text">
                <h3>Example ATS Score</h3>
                <p>This is a visual preview only. Your actual ATS score appears after resume analysis.</p>
            </div>
        </div>
    </div>
</section>

<section class="section features-section" id="features">
    <h2 class="section-title">Powerful AI Features</h2>
    <p class="section-subtitle">One intelligent platform for resume analysis, job matching and career preparation</p>

    <div class="features-grid">

        <div class="feature-card">
            <video class="video-bg" autoplay muted loop playsinline preload="metadata">
                <source src="https://assets.mixkit.co/videos/46977/46977-720.mp4" type="video/mp4">
            </video>
            <div class="video-overlay"></div><div class="video-glow blue-glow"></div>
            <div class="feature-icon">📄</div>
            <div class="feature-content">
                <span class="feature-badge">RESUME AI</span>
                <h3>AI Resume Analysis</h3>
                <p>Analyze resume content, strengths, weaknesses, skills and improvement areas using AI.</p>
            </div>
        </div>

        <div class="feature-card">
            <video class="video-bg" autoplay muted loop playsinline preload="metadata">
                <source src="https://assets.mixkit.co/videos/31771/31771-720.mp4" type="video/mp4">
            </video>
            <div class="video-overlay"></div><div class="video-glow cyan-glow"></div>
            <div class="feature-icon">🤖</div>
            <div class="feature-content">
                <span class="feature-badge">GENERATIVE AI</span>
                <h3>AI Career Intelligence</h3>
                <p>Convert resume information into meaningful AI-generated career insights.</p>
            </div>
        </div>

        <div class="feature-card">
            <video class="video-bg" autoplay muted loop playsinline preload="metadata">
                <source src="https://assets.mixkit.co/videos/5396/5396-720.mp4" type="video/mp4">
            </video>
            <div class="video-overlay"></div><div class="video-glow green-glow"></div>
            <div class="feature-icon">📊</div>
            <div class="feature-content">
                <span class="feature-badge">ATS INTELLIGENCE</span>
                <h3>ATS Resume Score</h3>
                <p>Understand ATS-oriented resume performance and improvement areas.</p>
            </div>
        </div>

        <div class="feature-card">
            <video class="video-bg" autoplay muted loop playsinline preload="metadata">
                <source src="https://assets.mixkit.co/videos/4813/4813-720.mp4" type="video/mp4">
            </video>
            <div class="video-overlay"></div><div class="video-glow purple-glow"></div>
            <div class="feature-icon">💼</div>
            <div class="feature-content">
                <span class="feature-badge">JOB MATCHING AI</span>
                <h3>Job Description Matching</h3>
                <p>Compare your resume with a target job and understand your job fit.</p>
            </div>
        </div>

        <div class="feature-card">
            <div class="video-glow purple-glow"></div>
            <div class="visual">
                <div class="visual-ring"></div><div class="visual-core">AI</div>
                <div class="network-dot"></div><div class="network-dot"></div>
                <div class="network-dot"></div><div class="network-dot"></div>
                <div class="network-line nl1"></div><div class="network-line nl2"></div><div class="network-line nl3"></div>
            </div>
            <div class="feature-content">
                <span class="feature-badge">SKILL INTELLIGENCE</span>
                <h3>Skill Gap Analysis</h3>
                <p>Identify important missing technical skills according to the target job.</p>
            </div>
        </div>

        <div class="feature-card">
            <div class="video-glow green-glow"></div>
            <div class="visual learning-visual">
                <div class="learning-step">1</div><div class="learning-line"></div>
                <div class="learning-step">2</div><div class="learning-line"></div>
                <div class="learning-step">3</div><div class="learning-line"></div>
                <div class="learning-step">✓</div>
            </div>
            <div class="feature-content">
                <span class="feature-badge">LEARNING GUIDANCE</span>
                <h3>Learning Roadmap</h3>
                <p>Get prioritized learning areas based on missing skills and job requirements.</p>
            </div>
        </div>

        <div class="feature-card">
            <video class="video-bg" autoplay muted loop playsinline preload="metadata">
                <source src="https://assets.mixkit.co/videos/47214/47214-720.mp4" type="video/mp4">
            </video>
            <div class="video-overlay"></div><div class="video-glow orange-glow"></div>
            <div class="feature-icon">🎯</div>
            <div class="feature-content">
                <span class="feature-badge">INTERVIEW AI</span>
                <h3>Interview Preparation</h3>
                <p>Generate interview questions and AI-powered answers based on your profile.</p>
            </div>
        </div>

        <div class="feature-card">
            <div class="video-glow pink-glow"></div>
            <div class="visual rewrite-visual">
                <div class="document">
                    <div class="document-line"></div><div class="document-line short"></div>
                    <div class="document-line"></div><div class="document-line short"></div><div class="document-line"></div>
                </div>
                <div class="document">
                    <div class="document-line"></div><div class="document-line"></div>
                    <div class="document-line short"></div><div class="document-line"></div><div class="document-line short"></div>
                </div>
            </div>
            <div class="feature-content">
                <span class="feature-badge">GENERATIVE AI</span>
                <h3>AI Resume Rewriter</h3>
                <p>Generate an improved and job-focused resume using Generative AI.</p>
            </div>
        </div>

        <div class="feature-card">
            <video class="video-bg" autoplay muted loop playsinline preload="metadata">
                <source src="https://assets.mixkit.co/videos/47214/47214-720.mp4" type="video/mp4">
            </video>
            <div class="video-overlay"></div><div class="video-glow blue-glow"></div>
            <div class="feature-icon">📋</div>
            <div class="feature-content">
                <span class="feature-badge">SAVED ANALYSIS</span>
                <h3>Resume History</h3>
                <p>Access previously analyzed resumes and review saved AI analysis results.</p>
            </div>
        </div>

    </div>
</section>

<section class="section workflow-section" id="how-it-works">
    <h2 class="section-title">How It Works</h2>
    <p class="section-subtitle">From resume upload to complete AI-powered career preparation</p>

    <div class="workflow">
        <div class="workflow-line"></div>

        <div class="workflow-card">
            <div class="workflow-number">1</div><div class="workflow-icon">🔐</div>
            <h3>Login</h3><p>Login to access your personalized AI career dashboard.</p>
        </div>
        <div class="workflow-card">
            <div class="workflow-number">2</div><div class="workflow-icon">📄</div>
            <h3>Upload Resume</h3><p>Upload your resume in PDF format for AI-powered analysis.</p>
        </div>
        <div class="workflow-card">
            <div class="workflow-number">3</div><div class="workflow-icon">🤖</div>
            <h3>AI Analysis</h3><p>Gemini AI analyzes your resume, skills and professional profile.</p>
        </div>
        <div class="workflow-card">
            <div class="workflow-number">4</div><div class="workflow-icon">📊</div>
            <h3>Career Insights</h3><p>Get ATS score, strengths, weaknesses, missing skills and recommendations.</p>
        </div>
        <div class="workflow-card">
            <div class="workflow-number">5</div><div class="workflow-icon">🚀</div>
            <h3>Prepare &amp; Improve</h3><p>Match jobs, learn missing skills, prepare interviews and rewrite your resume.</p>
        </div>
    </div>

    <div class="workflow-status">🟢 AI Career Assistant Workflow Active</div>
</section>

<section class="why-section" id="why-use">
    <h2 class="section-title">Why Use AI Resume Analyzer?</h2>
    <p class="section-subtitle">Turn your resume into a smarter career strategy</p>

    <div class="why-container">
        <div class="ai-visual">
            <div class="ai-orbit">
                <div class="ai-center">
                    <strong>AI</strong>
                    <span>CAREER INTELLIGENCE</span>
                </div>
            </div>
            <div class="ai-active">● AI CAREER ANALYSIS ACTIVE</div>
        </div>

        <div class="benefits">
            <div class="benefit"><div class="benefit-icon">📈</div><h3>Improve ATS Compatibility</h3><p>Understand your ATS-oriented resume performance and improvement areas.</p></div>
            <div class="benefit"><div class="benefit-icon">🧠</div><h3>Discover Missing Skills</h3><p>Identify technical skills that may be missing from your profile.</p></div>
            <div class="benefit"><div class="benefit-icon">💪</div><h3>Know Your Strengths</h3><p>Understand the strongest parts of your resume and profile.</p></div>
            <div class="benefit"><div class="benefit-icon">🔍</div><h3>Find Resume Weaknesses</h3><p>Detect areas that should be improved before applying for jobs.</p></div>
            <div class="benefit"><div class="benefit-icon">💡</div><h3>Get AI Recommendations</h3><p>Receive practical AI-powered suggestions for improving your resume.</p></div>
            <div class="benefit"><div class="benefit-icon">🚀</div><h3>Become Job Ready</h3><p>Prepare using job matching, learning guidance and interview preparation.</p></div>
        </div>
    </div>
</section>

<section class="cta">
    <h2>Ready to Improve Your Resume?</h2>
    <p>Upload your resume and let AI analyze it for you.</p>
    <a class="cta-button" href="${pageContext.request.contextPath}/upload_resume">🚀 Analyze My Resume</a>
</section>

<footer class="site-footer">
    <div class="footer-content">
        <div class="footer-logo">🤖 AI Resume Analyzer</div>
        <div class="footer-project-title">Intelligent AI Resume Analyzer and Career Assistant</div>
        <div class="footer-developer">Developed by Krishnakant Patidar</div>
        <div class="footer-email"><a href="mailto:patidarkrishna188@gmail.com">patidarkrishna188@gmail.com</a></div>
        
        
<!-- Social Media Icons -->
<div class="footer-socials">
    <a href="https://www.linkedin.com/in/krishnakant-patidar-3358772b9/"
       target="_blank" rel="noopener noreferrer"
       aria-label="LinkedIn">
        <i class="fa-brands fa-linkedin-in"></i>
    </a>

    <a href="https://krishnapatidar80.github.io/portfolio/"
       target="_blank" rel="noopener noreferrer"
       aria-label="Portfolio">
        <i class="fa-solid fa-globe"></i>
    </a>

    <a href="https://github.com/krishnapatidar80"
       target="_blank" rel="noopener noreferrer"
       aria-label="GitHub">
        <i class="fa-brands fa-github"></i>
    </a>

    
	<a href="https://www.instagram.com/krishnapatidar188/"
   		target="_blank"
   		rel="noopener noreferrer"
   		aria-label="Instagram">
    	<i class="fa-brands fa-instagram"></i>
	</a>

</div>
        
        <div class="footer-line"></div>
        <div class="footer-copyright">© 2026 AI Resume Analyzer | All Rights Reserved</div>
    </div>
</footer>

<script>
/* Attempt to play background videos; page still works if autoplay is blocked. */
document.querySelectorAll("video").forEach(function(video) {
    video.muted = true;
    var playPromise = video.play();

    if (playPromise && typeof playPromise.catch === "function") {
        playPromise.catch(function() {
            /* CSS background remains visible if video playback fails. */
        });
    }
});
</script>

</body>
</html>