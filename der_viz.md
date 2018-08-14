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
