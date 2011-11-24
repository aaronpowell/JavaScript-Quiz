---
layout: post
title: Q17 - Really negative
date: '2011-11-21'
slug: Why so negative?
---

Under what conditions would the following code snippet return a result of `true`?

<script src="https://gist.github.com/1380123.js"> </script>

<span style="text-decoration: line-through;">Post your JavaScript as a comment. Comments will be held in the moderation queue until the answer is posted. Full answer and explanation will be appended to this post around 72 - 96 hours after the question is posted.</span>

<span style="text-decoration: line-through;">If you don't want your answer public, please post a comment like 'playing at home' so I can at least guage how many people are participating and whether the questions are useful.</span>

Good Luck :).

* * *

The JavaScript [Number][1] type is an implementation of IEEE 754 and it has all the really exciting things that come along with that.

One of the things that is included in the numbering thing is the implementation of `-0`.

If you guessed that `-0` will return `true` then you're right, well at least you're *partially* right (excluding values that coerce to 0), there's actually another value (well, range of values) that will do it...

Any number less than or equal to `-Math.pow(2, -1074)` will also return `-Infinity` when the divisor of 1, thus resulting in true being retured. Sorry I'm not enough of a math nerd to tell you *why*, just that it's an interesting footnote. If you actually want to test for `-0` then you want to do this:

	var fn = function(x) {
		return x === 0 && (1/x) === -Infinitiy;
	};

Hang on though, why does `-0` equal `0` (or `+0`)?

Well if you take a look [11.9.6 - The Strict Equality Comparison Algorithm][2] (and the [11.9.3 The Abstract Equality Comparison Algorithm][3]) if they are either forms of `0` they will be treated as having the same sign.

And there you have it, that's how to test for `-0` separately from `+0`. The usefulness of this is up to you to work out :P.

  [1]: http://es5.github.com/#x8.5
  [2]: http://es5.github.com/#x11.9.6
  [3]: http://es5.github.com/#x11.9.3