# ProcessingApps
An assortment of visual 'applets' written using the Java based sketchbook Processing.

# Table of Contents
* [ProcessingApps](#processingapps)
* [Introduction](#introduction)
  * [What inspires these mini projects?](#what-inspires-these-mini-projects)
  * [What is Processing?](#what-is-processing)
  * [How to run code in this repo?](#how-to-run-code-in-this-repo)
* [Hilbert Curve](#hilbert-curve)
* [Ulam Prime Spiral](#ulam-prime-spiral)

# Introduction
## What inspires these mini projects?
One of my favorite ways to spend my free time is watching and reading creative content online through services like Youtube and blog-like websites.
My favorite creators are the likes of [3Blue1Brown](https://www.youtube.com/channel/UCYO_jab_esuFRV4b17AJtAw), [Numberphile](https://www.youtube.com/channel/UCoxcjq-8xIDTYp3uz647V5A), and [Vi Hart](https://www.youtube.com/user/Vihart).
In their content, these users feature math concepts (some familiar and others unheard of) that have applications in many different areas and often have some beautiful explanation, proof, or visualization. 

This repo is starting with just a few of my own creations, many of which derive from other content that I've already seen. I don't plan on all of the work being
math based visualizations, however it seems to be a great starting place and it's fun finding and deriving math concepts in code. 
I will try my best to list references and inspirations I had for each individual project. Feel free to use the code I've written as a starting point for your own projects
or to vizualize the same concepts I've looked at in a different way!

## What is Processing?
[Processing](https://processing.org/) is a Java based language that is very friendly for graphic design and visually artistic projects. It lends itself to being easy to understand for beginners and was a quick way for me to begin working on visual programming which I had not done much of before. I owe Daniel Shiffman and [The Coding Train](http://thecodingtrain.com/) a thank you for introducing this environment to me as well as giving inspiration to make interesting and fun content.

Here is an excerpt from the Processing website:
>Processing is a flexible software sketchbook and a language for learning how to code within the context of the visual arts. Since 2001, Processing has promoted software literacy within the visual arts and visual literacy within technology. There are tens of thousands of students, artists, designers, researchers, and hobbyists who use Processing for learning and prototyping.
>* Free to download and open source
>* Interactive programs with 2D, 3D, PDF, or SVG output
>* OpenGL integration for accelerated 2D and 3D
>* For GNU/Linux, Mac OS X, Windows, Android, and ARM
>* Over 100 libraries extend the core software
>* Well documented, with many books available

## How to run code in this repo?
Unfortunatley, the Processing environment is needed to run and interact with the code directly. I will do my best to layout all of the visually stunning and interesting parts of my projects through images and code excerpts through out this README, however the environment can be downloaded [here](https://processing.org/download/) if you choose to run the code on your own.

## How to run code in this repo?
Unfortunatley, the Processing environment is needed to run and interact with the code directly. I will do my best to layout all of the visually stunning and interesting parts of my projects through images and code excerpts through out this README, however the environment can be downloaded [here](https://processing.org/download/) if you choose to run the code on your own.

# Hilbert Curve
[Link to code](https://github.com/rdslade/ProcessingApps/tree/master/hilbert)

The Hilbert curve is a [space filling curve](https://en.wikipedia.org/wiki/Space-filling_curve) derived by German mathematician David Hilbert in 1891. This curve can be drawn at different levels with increasing levels approximating the entirety of the unit square. 

The first iteration of the Hilbert curve simple looks like a 'U' with rigid corners. From here on, each subsequent level can be created by drawing 4 copies of the previous levels curve in a specific orientation and then connecting those 4 curves to create one continuous line where each level tightens the spacing between the lines.

The static images seen below demonstrate this recursive technique. 

| ![](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Hilbert_curve_1.svg/120px-Hilbert_curve_1.svg.png)  | ![](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Hilbert_curve_2.svg/120px-Hilbert_curve_2.svg.png) | ![](https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Hilbert_curve_3.svg/120px-Hilbert_curve_3.svg.png)|
| ---------------------- | -------------------------------------------- | -------------------------------------------- |
| Rigid 'U' shape; n = 1 | 4 smaller versions of n = 1 connected; n = 2 | 4 smaller versions of n = 2  connected; n = 3

(Images from the Wikipedia link below)

In my code, as opposed to performing the drawing method recursively, the implementation finds the (X, Y) coordinates of each vertex in the curve in successive order. This means the drawing technique is iterative and resembles drawing a long continuous curve as opposed to putting together disconnected pieces in each step. Much of the algorithm was traced from the 'Iterative algorithm for drawing Hilbert curve' which was originally written in Javascript. The piece as a whole gives great insight for deriving the algorithm from scratch by considering the curve as a maze where each n = 1 Hilbert curve is a room which has a single entrance and exit.

Following is a playback of my code running in the Processing environment:

<center>
	<img src="https://rdslade.github.io/otherPics/hilbert.gif">
</center>

This GIF ranges from n = 3 up to n = 9. However, the program can run down to n = 1 and is capped at n = 10 as controlled by the user. The image rending is very slow at levels higher than n = 10.

As for color, I used 1 dimensional [Perlin noise](https://en.wikipedia.org/wiki/Perlin_noise) that relied on the fraction of the way through the curve (e.g. 2/3 of the way through) as well as a time offset that begins at the beginning of the program. This results in both a smooth, random change in colors as the curve moves through the page, as well as a 'forward' movement that results in a snake like motion with the colors progressing through the body of the curve continuously over time.
### Controls
<kbd>↑</kbd> to zoom in

<kbd>↓</kbd> to zoom out

### References
* [Wikipedia](https://en.wikipedia.org/wiki/Hilbert_curve)
* [Wolfram MathWorld](http://mathworld.wolfram.com/HilbertCurve.html)
* [Iterative algorithm for drawing Hilbert curve](https://marcin-chwedczuk.github.io/iterative-algorithm-for-drawing-hilbert-curve)
* [Hilbert's Curve: Is Infinite Math Useful?](https://www.youtube.com/watch?v=3s7h2MHQtxc&vl=en)

# Ulam Prime Spiral
[Link to code](https://github.com/rdslade/ProcessingApps/tree/master/ulam)

The Ulam Prime Spiral was discovered by scientist and mathmetician Stanislaw Ulam in 1963. The story goes that Ulam was sitting through a boring lecture at a scientific meeting and began doodling a spiral of numbers. He began with the number 1 directly in the middle of the paper and began spiraling around from there. '2' went directly to the right of '1', '3' directly below '2', '4' to the left of '3', and so on. He continued with this to fill up some area of a square grid.

This swirling pattern is demonstrated by the image made by my code below.

<center>
	<img src="https://rdslade.github.io/otherPics/ulam_plain.png">
</center>

Ulam went about playing with his spiral when he noticed something very interesting. If he colored in the prime numbers on his spiral, diagonal lines would begin to appear. Not neceessarilly every space on a specific diagonal line would show up, but the more he zoomed out on his spiral the more definite the pattern of extending diagonal lines would appear. Here is a series of images rendered from my Ulam program that show this phenomena. 

| ![](https://rdslade.github.io/otherPics/ulam_close.png)  | ![](https://rdslade.github.io/otherPics/ulam_mid.png) | ![](https://rdslade.github.io/otherPics/ulam_far.png)|
| ---------------------- | -------------------------------------------- | -------------------------------------------- |

