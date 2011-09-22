---
layout: default
---
article '#post.post ' + @Document.class, ->
  h1 ->
    @Document.title
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
            
section '#comments', ->
  h3 -> 'Feedback'
  div '#disqus_thread', -> '&nbsp;'
  coffeescript ->
    $ ->
      window.disqus_identifier= "#{@Document.slug}"
      window.disqus_developer= document.location.href.indexOf("localhost")
      window.disqus_url= @Document.url
      if typeof window.DISQUS isnt "undefined"
        window.DISQUS.reset
          reload: yes
          config: ->
            @page.identifier = @Document.slug
            @page.url = @Document.url

  
