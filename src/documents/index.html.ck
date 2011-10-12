---
layout: 'page'
title: 'Latest Posts'
---
aside ->
  img src: 'http://www.gravatar.com/avatar/5d608d8fe9156b0e01b3f224e28409b0.png'
  h4 ->
    a href:"http://aaron-powell.com", title: 'Aaron Powell', -> "Aaron Powell"
  p ->
    "I'm a web developer out of Sydney, Australia, working primarily on the Microsoft stack but I'm not scared of those other server technologies."
  p ->
    "You can find more of my inane ramblings on my blog - "
    a href:"http://aaron-powell.com", title: 'http://aaron-powell.com', -> "http://aaron-powell.com"

section ".posts", ->
    nav ".linklist", typeof:"dc:collection", ->
    for Document in @Documents
      if Document.url.indexOf('/blog') == 0
          section ".post-link", typeof:"sioc:Post", about: Document.url, ->
            # regex = /(\d{4})-(\d{2})-(\d{2})/
            # date = new Date Document.date.match(regex)[1], Document.date.match(regex)[2] - 1, Document.date.match(regex)[3]
            h1 ->
              a href: Document.url, property:"dc:title", -> Document.title
            h5 property:"dc:created", -> "#{Document.date.toDateString()}"
            p -> Document.slug

div "#disqus_thread", style:"display:none;"