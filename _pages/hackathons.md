---
layout: page
title: hackathons
permalink: /hackathons/
description: Things I built under a deadline.
nav: true
nav_order: 4
horizontal: false
---

<!-- pages/hackathons.md -->
<div class="projects">
  {% assign hackathon_projects = site.projects | where: "category", "Hackathons" %}
  {% assign sorted_projects = hackathon_projects | sort: "importance" %}
  {% if page.horizontal %}
  <div class="container">
    <div class="row row-cols-1 row-cols-md-2">
    {% for project in sorted_projects %}
      {% include projects_horizontal.liquid %}
    {% endfor %}
    </div>
  </div>
  {% else %}
  <div class="row row-cols-1 row-cols-md-3">
    {% for project in sorted_projects %}
      {% include projects.liquid %}
    {% endfor %}
  </div>
  {% endif %}
</div>
