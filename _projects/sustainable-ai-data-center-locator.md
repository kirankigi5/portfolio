---
layout: page
title: Sustainable AI Data Center Locator
description: A county-level decision platform for screening U.S. data-center sites on official sustainability and infrastructure data. Third place at the NYU Stern Business Analytics Competition.
importance: 1
category: Hackathons
related_publications: false
---

Built for the BAC x iMason competition, this platform screens U.S. counties as candidate data-center locations. A deterministic engine ranks processed official indicators against a canonical project profile, so every score traces back to a real measurement rather than a model's guess. Chat handles project intake, and the map workspace surfaces rankings, side-by-side comparisons, concise explanations and the underlying source evidence.

The design decision I care most about: **no custom ML model computes the scores.** An optional server-side LLM interprets requests and selects verified explanation facts, but it never touches the ranking. Without credentials, the app runs on its deterministic fallback and behaves identically.

The published release covers 3,109 counties and 71,471 evidence rows at roughly 90.5% metric completeness, joined by FIPS from official sources:

- **EPA eGRID** — carbon intensity and generation mix
- **Census ACS** — population, income and workforce
- **WRI Aqueduct** — area-weighted county water stress
- **FEMA National Risk Index** — wildfire, drought, flood, hurricane and heat
- **NOAA nClimDiv** — county temperature normals
- **EIA** — industrial electricity prices
- **FCC** — business fiber availability

Exports retain raw values, units, vintages, transformations and source hashes. Missing measurements stay `null` — never silently zero-filled — and unknown evidence can't satisfy a hard constraint. Scores are screening indicators, not construction feasibility: no public dataset establishes interconnection capacity, permits or community acceptance.

Next.js and TypeScript for the application, Python for the ingestion pipelines, deployed on Railway.

[View Live App](https://nextdatacenter.up.railway.app/) | [View on GitHub](https://github.com/kirankigi5/bac_imason_hackathon) | [Competition result](https://www.linkedin.com/posts/kiranreddy-bhumireddy_third-place-at-nyu-stern-business-analytics-ugcPost-7514503741342015488-sfjb/)

<div class="row justify-content-sm-center mt-4">
  <div class="col-sm-8 mt-3 mt-md-0">
    <iframe
      src="https://www.linkedin.com/embed/feed/update/urn:li:ugcPost:7514503741342015488"
      title="LinkedIn post: third place at the NYU Stern Business Analytics Competition"
      height="600"
      width="100%"
      frameborder="0"
      allowfullscreen
      loading="lazy"
      style="border: 1px solid rgba(128, 128, 128, 0.25); border-radius: 0.5rem;"
    ></iframe>
  </div>
</div>

<div class="caption">
  Announcing third place at the NYU Stern Business Analytics Competition. If the embed does not load, view the
  <a href="https://www.linkedin.com/posts/kiranreddy-bhumireddy_third-place-at-nyu-stern-business-analytics-ugcPost-7514503741342015488-sfjb/">post on LinkedIn</a>.
</div>
