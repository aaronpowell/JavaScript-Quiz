---
layout: 'page'
title: 'JavaScript Quiz'
---

section ".posts", ->
    h2 -> "Posts"
    nav ".linklist", typeof:"dc:collection", ->
		for Document in @Documents
			if Document.url.indexOf('/blog') == 0
			    li typeof:"sioc:Post", about: @Document.url, ->
				    span property:"dc:created", -> @Document.date
				    "&raquo;"
				    a href: @Document.url, property:"dc:title", -> @Document.title

div "#disqus_thread", style:"display:none;"