---
layout: default
---
article "#page.page", ->
  if @Document.title
  	h1 -> @Document.title
  div -> @content

