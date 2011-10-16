# Requires
docpad = require 'docpad'
express = require 'express'

# Variables
oneDay = 86400000
expiresOffset = oneDay
debug = true

# -------------------------------------
# Generator
# console.log 'Time to regenerate the site'

# builder = docpad.createInstance { }
# builder.generateAction (err) -> console.log err 

# console.log 'Aaaaaand we are done!'

# -------------------------------------
# Server

# Configuration
masterPort = process.env.PORT || 10113

# Create Servers
docpadServer = express.createServer()
masterServer = docpadServer

# Setup DocPad
docpadInstance = docpad.createInstance {
	port: masterPort
	maxAge: expiresOffset
	server: docpadServer
	logLevel: 6
}

# -------------------------------------
# Middlewares

# Configure
docpadServer.configure ->
	# Redirect Middleware
	docpadServer.use (req,res,next) ->
		if req.headers.host in ['www.javascripquiz.com']
			res.redirect 'http://javascripquiz.com'+req.url, 301
			res.end()
		else
			next()

	# Static Middleware
	docpadInstance.serverAction (err) -> throw err  if err

	# Router Middleware
	docpadServer.use docpadServer.router

	# 404 Middleware
	docpadServer.use (req,res,next) ->
		res.send(404)


# -------------------------------------
# Start Server

# Start Server
docpadServer.listen masterPort
console.log 'Express server listening on port %d', docpadServer.address().port

# DNS Servers
# masterServer.use express.vhost 'balupton.*', docpadServer
# masterServer.use express.vhost 'balupton.*.*', docpadServer
# masterServer.use express.vhost 'lupton.*', docpadServer


# -------------------------------------
# Redirects

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