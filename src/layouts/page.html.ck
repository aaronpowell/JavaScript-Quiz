---
layout: default
---
article "#page.page", ->
  if @document.title
  	h1 -> @document.title
  div -> @content

