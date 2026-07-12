---
layout: page
title: Startup Scout AI (JudgeVC)
description: Automating venture screening with a multi-agent AI committee powered by NVIDIA Nemotron.
importance: 2
category: work
related_publications: false
---

A FastAPI + React application that uses three AI agents to automatically score and tier startup opportunities. Upload a CSV/Excel file and get instant investment recommendations with reasoning. 

It runs 3 AI Agents in parallel:
- **Nemotron (Market Analyst)** - Scores market opportunity & TAM
- **Claude (Devil's Advocate)** - Identifies team weaknesses & risks
- **GPT-4 (Judge)** - Weighs both sides, renders final verdict

[View on GitHub](https://github.com/kirankigi5/startup-scout-ai)
