<!-- #region -->
# Affine geometry, robotics, and numerical approximations


## Overview

In these two lectures, we review numerical approaches to solving (systems of) polynomial equations.

## Usefull resources

* [`Scipy` Lecture Notes](https://scipy-lectures.org/index.html)
* [`Matplotlib` cheatsheet](https://matplotlib.org/cheatsheets/)
* [`NumPy` cheatsheet](https://media.geeksforgeeks.org/wp-content/uploads/20240104182515/NumPy-Cheat-Sheet.pdf)
* [`NumPy` for Matlab users](https://numpy.org/doc/stable/user/numpy-for-matlab-users.html)

## Lecture 3

Recap of rootfinding, computing in finite precision arithmetic, accuracy and stability of algorithms for solving linear systems of equations. 

* Read: [Numerical methods and optimization](https://link.springer.com/book/10.1007%2F978-3-319-07671-3) chapters 7.3, 14, 3.6

* The slides are found [here](https://tristanvanleeuwen.github.io/WISM100_Robotics/lecture1.html#/) 
* The notebooks used in the lecture are found [here](https://github.com/TristanvanLeeuwen/WISM100_Robotics)

Suggested exercises:

* Analyse the convergence of the fixed point method with $g(x) = x + \alpha f(x)$; under what conditions on $\alpha$ does the method converge and what is the optimal $\alpha$?
* Analyse the convergence of the modified Newton's method $x_{k+1} = x_k - m f(x_k)/f'(x_k)$ when applied to a function that has a root with multiplicity m. What happens when you apply this method to a function with a root with higher or lower multiplicity?
* Try to solve the Cyclic-6 problem using Gröbner basis and elimination. How sensitive is the system to small errors?

## Lecture 4

Newton-methods for solving systems of non-linear equations, 

* Read: [Numerical methods and optimization](https://link.springer.com/book/10.1007%2F978-3-319-07671-3), chapter 7.4
* The slides are found [here](https://tristanvanleeuwen.github.io/WISM100_Robotics/lecture2.html#/) 
* The notebooks used in the lecture are found [here](https://github.com/TristanvanLeeuwen/WISM100_Robotics)

Suggested exercises:

* Prove convergence of the multivariate Newton method using a fixed point argument. Start by proving convergence for the multi-variate fixed-point iteration $x_{k+1} = g(x_k)$
* Show that minimizing $\phi(x) = \|f(x)\|^2$ is equivalent to using Newton's method using the pseudo-inverse of the Jacobian in case the system is overdetermined (in this case $J^{\dagger} = (J^TJ)^{-1}J^T$). Recall that at a minimum, the gradient of $\phi$ is zero.
* Solve the Cyclic-6 problem using Newton's method
