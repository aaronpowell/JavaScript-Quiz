---
layout: post
title: Q14 - The interval dance
date: '2011-10-24'
slug: Using the setInterval command may give you a headache
---
A developer has been asked to write some JavaScript which will perform an AJAX request every 30 seconds and display the returned data on the page.

The code produced by the developer looks as follows:

<script src="https://gist.github.com/1308134.js"> </script>

What problem can come up if the server load fluctuates, resulting in the response time changing?

How would you change the code to negate the problem?

Post your JavaScript as a comment. Comments will be held in the moderation queue until the answer is posted. Full answer and explanation will be appended to this post around 72 - 96 hours after the question is posted.

If you don't want your answer public, please post a comment like 'playing at home' so I can at least guage how many people are participating and whether the questions are useful.

Good Luck :).

* * *

In this weeks question we were looking at a common mistake that people make when using the `setInterval` method in JavaScript. With `setInterval` the function that you pass in will always be executed when the timeout period rolls over. This is why you can run into an issue when you're using it to perform operations which you don't control the duration of, a server call.

Because of this a new design pattern has come into common use, the [Recursive SetTimeout Pattern][1]. The idea behind this pattern is that you perform your operation in a `setTimeout` callback function (using the time period you would in the interval) and within the timeout execution you kick off a new timeout.

Here is the code for the answer:

<script src="https://gist.github.com/1321278.js"> </script>

What I've done is added a name to the function, `go`, and added a new call in the success callback that will kick off the new timeout call.

  [1]: http://www.erichynds.com/javascript/a-recursive-settimeout-pattern/