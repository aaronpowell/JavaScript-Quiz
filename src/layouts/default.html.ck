doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    meta content: "IE=edge,chrome=1", "http-equiv": "X-UA-Compatible"
    meta content: "text/html; charset=utf-8", "http-equiv": "content-type"
    title -> @Document.title
    
    meta content: "Aaron Powell", name: "author"
    meta content: "me@aaron-powell.com", name: "email"
    meta content: @Document.title, name: "title"
    meta content: "Regular JavaScript questions to explore the fun world of JavaScript and keep you on your toes. Follow @JavaScriptQuiz on Twitter for the latest questions", name: "description"
    meta content: "width=device-width", name: "viewport"
    link href: "styles/site.css", rel: "stylesheet", type: "text/css"
    link href:'/favicon.ico', rel:'shortcut icon', type:'image/x-icon'
  body "class": "#{@Document.title.toLowerCase().replace(' ', '') || "home" }", ->
    div "#main", ->
      header ->
        h1 ->
          a href: "http://javascriptquiz.com", -> "JavaScript Quiz"
        h3 -> "Regular JavaScript questions to explore the fun world of JavaScript and keep you on your toes. Follow @JavaScriptQuiz on Twitter for the latest questions"
      div "#content.content", ->
        @content
    script src: "http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"
    script src: "http://javascriptquiz.disqus.com/embed.js"
    script src: "http://www.google-analytics.com/ga.js"
    script src: "/scripts/modernizr.custom.js"
    script src: "/scripts/analytics.js"