---
layout: post
title: Q18 - Powerful properties
date: '2011-11-28'
slug: What can you do with ES5 properties?
---

The following example uses a ECMAScript 5 properties and also fails.

Is it possible to use `defineProperty` on a frozen object and have it not fail?

<script src="https://gist.github.com/1397338.js"> </script>

<span style="text-decoration: line-through;">Post your JavaScript as a comment. Comments will be held in the moderation queue until the answer is posted. Full answer and explanation will be appended to this post around 72 - 96 hours after the question is posted.</span>

<span style="text-decoration: line-through;">If you don't want your answer public, please post a comment like 'playing at home' so I can at least guage how many people are participating and whether the questions are useful.</span>

Good Luck :).

* * *

There's a lot of power which can be obtained from the properties which are included in ECMAScript 5, but one thing that you can't *normally* do is define a property on a frozen object.

Although the spec doesn't explain it clearly the crux is *if you call `defineProperty` on a frozen object with the value of the existing property it wont fail*.

Where this can become interesting is to improve our [-0 test from last time][1], like so:

	function negativeZero(x) {
	   if (x!==0) return false;
	   var obj=Object.freeze({z:-0});
	   try {
	      Object.defineProperty(obj,'z',{value:x});
	   } catch (e) {return false};
	   return true;
	}

This will only pass for -0, unlike the previous implementation (the idea I got from [here][2]).

  [1]: http://javascriptquiz.com/blog/q17-really-negative.html
  [2]: http://www.wirfs-brock.com/allen/posts/128