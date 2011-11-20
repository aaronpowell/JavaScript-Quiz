---
layout: default
---
article '#post.post ' + @content.class, ->
  h1 ->
    @document.title
  h3 ->
    @document.date.toDateString()
  div ->
    @content
    
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

  
