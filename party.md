---
layout: post
title: 近期聚会
permalink: /party/
---
<h4>Category</h4>
<ul>
    {% for category in site.categories %}
    <li><a href="/categories/{{ category | first }}/" title="view all
posts">{{ category | first }} {{ category | last | size }}</a>
    </li>
    {% endfor %}
</ul>
