---
layout: post
title: Q15 - What's the index?
date: '2011-10-31'
slug: Can you make indexOf play nicer with boolean statements?
---

Take the following JavaScript code:

<script src="https://gist.github.com/1326706.js"> </script>

How can I change the *if condition statement* so that I can compare against `true` while still using the `String.indexOf` method?

<span style="text-decoration: line-through;">Post your JavaScript as a comment. Comments will be held in the moderation queue until the answer is posted. Full answer and explanation will be appended to this post around 72 - 96 hours after the question is posted.</span>

<span style="text-decoration: line-through;">If you don't want your answer public, please post a comment like 'playing at home' so I can at least guage how many people are participating and whether the questions are useful.</span>

Good Luck :).

* * *

With this question we're looking at another seldom used operator in JavaScript... `~` or the [bitwise NOT operator][1]. JavaScript has a number of [bitwise operators][2] and they are used to convert an operand into a sequence of 32 bits.

The way the bitwise NOT operator works is through this formular ([source][3]):

    -(x + 1)

So when we use this with the potential results of the `String.indexOf` we shift the value by one and then rely on the falsy values in JavaScript to take care of it. Let's assume the following code:

	var index = 'abcd'.indexOf('a');
	if(~index) {
		console.log('found it!');
	}

Now if we think back to the above formular, it means we're really doing this:

	if(-(0 + 1))

	if(-(1))

	if(true)

And what if the `index` wasn't found? We'll end up with `-1` wont we? Let's pass that through our bitwise NOT?

	if(-(-1 + 1))

	if(-(0))

	if(false)

And there we go, now we've got a false value properly!

Enjoy the bitwise operators :).


  [1]: http://es5.github.com/#x11.4.8
  [2]: https://developer.mozilla.org/en/JavaScript/Reference/Operators/Bitwise_Operators
  [3]: https://developer.mozilla.org/en/JavaScript/Reference/Operators/Bitwise_Operators#.7E_(Bitwise_NOT)