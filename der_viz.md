# Derivative vizualization

### [Link to code](https://github.com/rdslade/ProcessingApps/tree/master/derivative_viz)

### [Link to project home](https://rdslade.github.io/ProcessingApps)

The concept of derivatives is a prevalnt topic when introducing calculus as well as an essential piece of advanced mathematics. While differentiation explains many funamental concepts familiar to most people ([displacment and it's derivatives in physics](http://wearcam.org/absement/Derivatives_of_displacement.htm), [maximizing cost](http://tutorial.math.lamar.edu/Classes/CalcI/BusinessApps.aspx), etc.), it is often introduced with confusing formulas and proofs that are unfamiliar to students getting introduced to calculus.

When I was first learning about the topic, it really started to click once I was shown a visualization of what the derivative of a function is and how it relates to inherent features of that function. For this reason, I decided to try to recreate and reimagine a helpful visualization. In order to see how this thought process began, we need to see how the math behind the derivative plays in with visuals.

In order to tackle this programming problem, I had to start by figuring out how to display a single function (before even considering it's derivative). For this purpose, I restricted my problem to dealing with polynomials since specifying a specific function is easy and the operations involved in calculating points on a polynomial are generally easy/understandable. I created a class called `Polynomial` that takes in an array specifying the coeffcients on successive powers of x. Since a person usually writes a polynomial from left to right beginning with the highest powers of x, this is how my code interprets the coeffcients of the input array. The following is an example of initialization of a `Polynomial`.

```
ArrayList<Float> powers = new ArrayList<Float>();
powers.add(1.0); //x^3
powers.add(0.0); //x^2
powers.add(0.0); //x
powers.add(0.0); //1
poly = new Polynomial(powers);

//poly(x) = x^3
```

After initializing, there needs to be some way to display the function. Given a certain input, it is not difficult to calculate the output at the point since you simply have to add each term of the polynomial together. However, figuring out what the input(s) should be was a tougher problem. First off all, it wasn't clear to me at first how the polynomial should even be displayed. How would I create a continuous line describing the function? Is there an easy way to created a curved output in just the correct spots using Processing? My solution to this was to approximate each function with points a discrete number of inputs. This way, I could add more and more input points to the environment to get a better look of the curve without having to invent some complex way of displaying a continuous curve. Instead, I could simply plot many points using the native `ellipse` function in Processing.

By splitting the canvas width (in pixels) into a number of discrete chunks, I created an input space to be put into my `Polynomial` class. After tweaking with the displays and figuring out the orientation of the graphics, I was able to get an output below.

<img width="500" src="https://rdslade.github.io/otherPics/blank_der.png">

Hey! That looks like a graph of x^3! I was now ready to get started with the derivative portion of this project. Instead of thinking about the derivative with the equations stating the definition of the derivative, I thought about it in terms of intuition and the initial 'feel' I had for what the derivative means. By this I'm talking about the concept that the derivative is the slope of a function at all points; it represents the steepness of a graph as it changes it's output. So, how do we measure the steepness of a function I've displayed on the screen?

Finding the steepness of straight line is very easy. We pick two points, find the difference between their x's and y's and the steepness is `change in y / change in x`.

Unfortunatley, we are trying to find the steepness of this graph at a *single* point. So, we initially don't have two points to pick in order to find the changes to x and y. However, there are points that 'live' *around* each point in question. Let's pick two points near the point in question to approximate the slope at a single point. Somewhat arbitrarily, my program starts with points that lie 3 input units to the right and the left. Let's see what the slope is at the points +-3 units from a specific point in question. 

<img width="500" src="https://rdslade.github.io/otherPics/der_three.png">

The red point is the point at which we are trying to find the derivative. The blue line runs through the points that lie 3 to the left and 3 to the right of the red point. We can see that this is a pretty good approximation. At the red point, x^3 looks like it is increasing a moderate rate and this is demonstrated through the approximate slope in the last image. However, we can get an even better approximation. By making the distance between the chosen points *smaller*, we get closer to the point in question and find that the new slope is a slightly better guess for the slope at the red point (as seen below).

<img width="500" src="https://rdslade.github.io/otherPics/der_two.png">

We keep making the distance between the chosen points smaller until they are only one point away from the input point. In reality, we would also want to continue increasing the number of points drawn so that the number of pixels between each point also is decreasing. Once we've gotten sufficiently close to our input point, we can be confident that the slope of the secant line (that which is connecting the points around the input point) is the actual slope at the single point itself! I will place a new point at the same x coordinate as the input but has a y coordinate equal to the slope of the approximation line we have just drawn.

Once we repeat this process of find the slope at each point and graphing the result, we get the following result.

<img width="500" src="https://rdslade.github.io/otherPics/der_full.png">

The green points represent the slope at each input graphed at the same x coordinate. In other words, the green function is the derivative of the white function!

---

This 'intuition' process that we went through to graph the derivative is essentially the same as how it is found using the definition of the derivative whose equation is layed out below.

<img src="https://latex.codecogs.com/gif.latex?f'(x)&space;=&space;\lim_{h\to0}\frac{f(x&plus;h)&space;-&space;f(x)}{h}"/>

Imagine `h` being the distance between the two points as I was describing above. In our intuitive example, we found `change of y / change of x` using two points around the input point. In the definition of the derivative, the `change of y` is written as <img src="https://latex.codecogs.com/gif.latex?f(x&plus;h)&space;-&space;f(x)" /> and `change of x` is just <img src="https://latex.codecogs.com/gif.latex?h" /> itself.

By making h smaller and smaller (aka the limit as h approaches 0) then we get to a smaller and smaller neighborhood around the input point and can accept the 'approximate' slope as the *actual* slope at the single input point. 

---

Following is a GIF that shows use of the controls of the derivative visualization program.

<img width="500" src="https://rdslade.github.io/otherPics/der_gif.gif">

Also, here are more images with functions and their corresponding derivatives.

| ![](https://rdslade.github.io/otherPics/der_x2.PNG) | ![](https://rdslade.github.io/otherPics/der_3x.PNG) | ![](https://rdslade.github.io/otherPics/der_complex.PNG) |
| ------------------------ | ------------------ | ---------------- |
| <img src="https://latex.codecogs.com/gif.latex?f'(x^2)&space;=&space;2x"/> | <img src="https://latex.codecogs.com/gif.latex?f'(3x)&space;=&space;3"/> | <img src="https://latex.codecogs.com/gif.latex?f'(\frac{1}{3}x^3&space;-&space;x&space;&plus;&space;2)&space;=&space;(x&space;&plus;&space;1)(x&space;-&space;1)" /> |

### Controls
There are buttons in the upper left side of the screen to control:

**STEP** - Plots a single point of the derivative

**CONTINUE/STOP** - Toggles the running state of the program

**RESET** - Resets the program to the right side of the input space

### References
* [Wikipedia](https://en.wikipedia.org/wiki/Derivative)
* [Wolfram MathWorld](http://mathworld.wolfram.com/Derivative.html)
* [The paradox of the derivative - 3Blue1Brown](https://www.youtube.com/watch?v=9vKqVkMQHKk)
* [Interactive derivative - Desmos](https://www.desmos.com/calculator/4pf1dxxzq2)

