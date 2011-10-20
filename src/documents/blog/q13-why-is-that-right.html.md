---
layout: post
title: Q13 - Why is that right?
slug: You'd be surprised at what passes for the truth these days
date: '2011-10-17'
---
Assume the following conditional statement:

<script src="https://gist.github.com/1291477.js"> </script>

What are the values that `a` can be for the **truth** path to be executed?

<span style="text-decoration: line-through;">Post your JavaScript as a comment. Comments will be held in the moderation queue until the answer is posted. Full answer and explanation will be appended to this post around 72 - 96 hours after the question is posted.</span>

<span style="text-decoration: line-through;">If you don't want your answer public, please post a comment like 'playing at home' so I can at least guage how many people are participating and whether the questions are useful.</span>

**Update: Answer published**

* * *

*I forgot to mention that this weeks post was brought to us by [Adam Ahmed][1] from Atlassian (sorry Adam!).*

This week we've taken a look at an interesting part of the JavaScript type coercion. For this we need to take a dive into the ECMAScript 5 spec, in particular section [11.9.3 The Abstract Equality Comparison Algorithm][2].

It all comes down to how the left and right hand side parts of the equality comparision works. The first thing to note is that the right-hand side part will actually be a `boolean` type, due to the [Logical NOT operator][3] being applied. This will ultimately be converted to a number for the next part of the comparison.

Then with the left hand side (assuming it's a [primative value][4]) an attempt will be made to convert it to a [number][5]. The thing with this is that if it's something such as an **empty array** or **empty string** it'll end up as a **0** which is a falsy value, resulting in `0 == false`!

But there's another time that this can happen, you can do it with objects. As mentioned the primative types are converted to a number, but object's are not, so how can you do it with an object? You need to override the [valueOf][6] method and make it return false. That means you can do this:

    var a = { valueOf: function() { return false; } }

Since we're overriding `valueOf` the expression `a == !a` will return true. To understand why we need to look back at the Abstract Edquality Commparison Algorithm. First off the expression `!a` which is the same as `!{ ... }` will **always** return `false` (as objects are coerced to `true`) and with an object when the `ToPrimative` converson happens it'll look at the [Default Value][7], which in turn is requested from valueOf, resulting in `false == false`!

And this is yet another reason why you want to watch out how you're constructing your equality expressions.

  [1]: http://twitter.com/#!/hitsthings
  [2]: http://es5.github.com/#x11.9.3
  [3]: http://es5.github.com/#x11.4.9
  [4]: http://es5.github.com/#primitive_value
  [5]: http://es5.github.com/#x9.3
  [6]: http://es5.github.com/#x15.2.4.4
  [7]: http://es5.github.com/#x8.12.8