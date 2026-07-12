---
layout: page
title: TokenTriage
description: A local-first inference router for AI agents that proves every dollar it saves.
importance: 1
category: Agentic Engineering
related_publications: false
---

TokenTriage is a FastAPI gateway that sits between agent apps and LLM providers. It accepts OpenAI-compatible and Gemini-compatible requests, then decides the cheapest sufficient route for each task using security checks, semantic cache, task triage, MCP-backed pricing, policy rules, local model dispatch, verifier sampling, optional OpenRouter rescue, and a final decision receipt.

Headline result: 97.7% lower modeled inference cost versus an always-frontier Gemini baseline on the bundled business workload.

[View Live App](https://tokentriage.onrender.com) | [View on GitHub](https://github.com/kirankigi5/tokentriage)
