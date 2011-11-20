---
layout: post
title: Q16 - Sortability
date: '2011-11-07'
slug: Time for a different kind of challenge with sorting arrays
---

JavaScripts [Array.sort][1] method is a bit different to other array manipulation methods, rather than returning a modified version of the array it will actually modify the source array.

I've seen this as the source of many bugs but it's easy to avoid.

## Todays challenge

Sort an array *without* modifying the source array in **the fewest characters possible**.

Post your JavaScript as a comment. Comments will be held in the moderation queue until the answer is posted. Full answer and explanation will be appended to this post around 72 - 96 hours after the question is posted.

If you don't want your answer public, please post a comment like 'playing at home' so I can at least guage how many people are participating and whether the questions are useful.

Good Luck :).

* *

This weeks question (ok, it ran over two weeks :P) was more about knowing JavaScript APIs.

The shortest way (that I've been able to work out) is to use the [Array.slice][2] method:

    [1,2,3].slice().sort();
    
Passing no arguments to the `slice` method it will default to `0` and return a copy of the array.

`slice` is the easiest way to shallow-clone an array.


  [1]: https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Array/sort
  [2]: https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Array/slice