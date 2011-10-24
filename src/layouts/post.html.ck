---
layout: default
---
article '#post.post ' + @Document.class, ->
  h1 ->
    @Document.title
  h3 ->
    @Document.date.toDateString()
  div ->
    @content
    
if @Documents.relatedDocuments && @Document.relatedDocuments.length
  section '#related', ->
    h3 -> 'Related Posts'
    nav '.linklist', ->
      ul ->
        for doc in @Document.relatedDocument
          li ->
            span -> doc.date
            a href: doc.url, -> doc.title

a href:"https://twitter.com/share", class:"twitter-share-button", data: {count:"horizontal", via:"javascriptquiz"}, -> "Tweet"
script type:"text/javascript", src:"//platform.twitter.com/widgets.js", -> ' '
section '#comments', ->
  h3 -> 'Answers'
  div '#disqus_thread', -> '&nbsp;'
  coffeescript ->
    $ ->
      window.disqus_shortname = "javascriptquiz"
      window.disqus_identifier = document.title or 'Home'
      window.disqus_developer = if document.location.href.indexOf("localhost") then 1 else 0
      window.disqus_url= document.location.href
      if typeof window.DISQUS isnt "undefined"
        window.DISQUS.reset
          reload: yes
          config: =>
            @page.identifier = document.title
            @page.url = document.location.href

  
