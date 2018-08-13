# Ulam Prime Spiral

### [Link to code](https://github.com/rdslade/ProcessingApps/tree/master/ulam)

### [Link to project home](https://rdslade.com/rdslade/ProcessingApps)

The Ulam Prime Spiral was discovered by scientist and mathmetician Stanislaw Ulam in 1963. The story goes that Ulam was sitting through a boring lecture at a scientific meeting and began doodling a spiral of numbers. He began with the number 1 directly in the middle of the paper and began spiraling around from there. '2' went directly to the right of '1', '3' directly below '2', '4' to the left of '3', and so on. He continued with this to fill up some area of a square grid.

This swirling pattern is demonstrated by the image made by my code below.

<center>
	<img src="https://rdslade.github.io/otherPics/ulam_plain.png">
</center>

Ulam went about playing with his spiral when he noticed something very interesting. If he colored in the prime numbers on his spiral, diagonal lines would begin to appear. Not neceessarilly every space on a specific diagonal line would show up, but the more he zoomed out on his spiral the more definite the pattern of extending diagonal lines would appear. Here is a series of images rendered from my Ulam program that show this phenomena. 

| ![](https://rdslade.github.io/otherPics/ulam_close.png) | ![](https://rdslade.github.io/otherPics/ulam_mid.png) | ![](https://rdslade.github.io/otherPics/ulam_far.png) |
| ---------- | -------- | -------- |
| Close zoom | Mid zoom | Far zoom |


This program uses a predicate called `isPrime(int n)` to determine whether or not a number is prime. This being the case, many modes can be derived each having it's own predicate to determine whether or not the number should be colored or not. As seen by the options detailed below and in the instructions of the images above, these other options are as follows.

| ![](https://rdslade.github.io/otherPics/ulam_even.png) | ![](https://rdslade.github.io/otherPics/ulam_odd.png) | ![](https://rdslade.github.io/otherPics/ulam_square.png) | ![](https://rdslade.github.io/otherPics/ulam_cube.png) |
| --------------- | --------------- | ------------------------- | ---------------------- |
| `isEven(int n)` | `isOdd(int n)`  | `isPerfectSquare(int n)`  | `isPerfectCube(int n)` |

Lastly, in a similar way to the color scheme described in the Hilbert curve project, it is possible to change the color mode between a solid red color and a Perlin noise controlled color that smoothly changes over time. The following is a capture of this with every one of the squares colored in.

![](https://rdslade.github.io/otherPics/ulam_pretty.gif)

At first I did not expect the color changes to have any sort of pattern or noticable movement to it, however since the perlin noise is based on the the number of the square, a noticable swirling motion can be seen in the last GIF. This is because the numbers themselves increase in that swirling curve!

### Controls
*Zoom:*

<kbd>↑</kbd> to zoom in

<kbd>↓</kbd> to zoom out

*Mode:*

<kbd>p</kbd> to highlight prime numbers

<kbd>e</kbd> to highlight even numbers

<kbd>o</kbd> to highlight odd numbers

<kbd>[n]</kbd> to highlight perfect nth numbers (where n is a digit)

<kbd>c</kbd> to highlight no numbers (clear)

*Display:*

<kbd>s</kbd> to show number text

<kbd>SHIFT</kbd> to switch color scheme
### References
* [Wikipedia](https://en.wikipedia.org/wiki/Ulam_spiral)
* [Wolfram Mathworld](http://mathworld.wolfram.com/PrimeSpiral.html)
* [Prime Spirals - Numberphile](https://www.youtube.com/watch?v=iFuR97YcSLM)
* [Reasoning behind the prime spiral](http://www.betweenartandscience.com/ulamspiral_words.html)
