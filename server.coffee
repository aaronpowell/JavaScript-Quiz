# Requires
docpad = require 'docpad'
express = require 'express'

# Variables
oneDay = 86400000
expiresOffset = oneDay


# -------------------------------------
# Server

# Configuration
masterPort = process.env.PORT || 10113

# Create Server
masterServer = express.createServer()

# Setup DocPad
docpadPort = masterPort
docpadServer = masterServer
docpadInstance = docpad.createInstance {
	port: docpadPort
	maxAge: expiresOffset
	server: masterServer
}

# -------------------------------------
# Middlewares

# Configure
docpadServer.configure ->
	### Correct Domain Middleware
	docpadServer.use (req,res,next) ->
		if req.headers.host in ['www.yourwebsite.com']
			res.redirect 'http://yourwebsite.com'+req.url, 301
			res.end()
		else
			next()
	###

	# Static Middleware
	# docpadInstance.serverAction (err) -> throw err  if err
	docpadInstance.action 'server'

	# Router Middleware
	# docpadServer.use docpadServer.router

	# 404 Middleware
	# docpadServer.use (req,res,next) ->
	#	res.send(404)


# -------------------------------------
# Start Server

# Start Server
# masterServer.listen masterPort
console.log 'Express server listening on port %d', masterServer.address().port

# DNS Servers
# masterServer.use express.vhost 'yourwebsite.*', docpadServer


# -------------------------------------
# Redirects

# Place your redirects here

###
NotFound = (msg) ->
  this.name = 'NotFound';
  Error.call this, msg ;
  Error.captureStackTrace this, arguments.callee ;

NotFound.prototype.__proto__ = Error.prototype;

# Twitter
docpadServer.get /^\/(?:t|twitter|tweet)\/?.*$/, (req, res) ->
	res.redirect "https://twitter.com/javascriptquiz", 301
    
posterousRegex = /^\/q\d(1-2)*$/
docpadServer.get posterousRegex, (req, res) ->
    res.redirect "http://javascriptquiz.com/blog" + req.url + ".html", 302

docpadServer.get '/api/q14', (req, res) ->
	setTimeout ->
		res.contentType 'application/json'  
		res.send
			date: new Date().toIsoDateString()
			data: ['Hello', 'players', 'you', 'got', 'a', 'response', 'it', 'is', 'cool']
	, Math.random(0, 40000) * 10000

docpadServer.get '*', (req, res) ->
	throw new NotFound

docpadServer.error (err, req, res, next) ->
	if err instanceof NotFound
		if posterousRegex.test req.url
			res.redirect 'http://javascriptquiz.posterous.com/' + req.url, 302
		else
			res.redirect "http://javascriptquiz.com/404.html", 404
	else
		next err

###