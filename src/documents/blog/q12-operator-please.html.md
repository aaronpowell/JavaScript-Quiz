---
layout: post
title: Q12 - Operator Please
tags: []
date: '2011-10-05'
slug: How well do you know your operators?
---
*This post was migrated from the old website. For the initial answers that people submitted (and aren't migrated) please see [here][4].*

What is the result of executing function `b` in the following code snippet?

<script src="https://gist.github.com/1238701.js"> </script>

Post your JavaScript as a comment. Comments will be held in the moderation queue until the answer is posted. Full answer and explanation will be appended to this post around 72 - 96 hours after the question is posted.

<span style="text-decoration: line-through;">If you don't want your answer public, please post a comment like 'playing at home' so I can at least guage how many people are participating and whether the questions are useful.</span>  

Updated: Answer published.

Follow [@JavaScriptQuiz][1] to know when the answer is up and to catch the next question.

Happy hacking.

* * *

The result of executing the function **b** is **2**, and this is because of the [comma is an operator][2] in JavaScript! The comma operator is the very bottom of the operator evaluation stack, meaning a trailing comma will cause following commands to be evaluated and in this case, returned.

The comma operator is quite often seen used in for loops like so:

`for(var i = 0, j = array.length; i < j; i++)`

Here we're using the comma operator to chain variable assignments.

There's a lot of interesting things which can be done with the comma operator, [have a read here for more ideas][3].

 [1]: http://twitter.com/JavaScriptQuiz
 [2]: http://es5.github.com/#x11.14
 [3]: http://javascriptweblog.wordpress.com/2011/04/04/the-javascript-comma-operator/
 [4]: http://javascriptquiz.posterous.com/q12-operator-please