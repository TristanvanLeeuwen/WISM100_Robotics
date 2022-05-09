<!-- #region -->
# Affine geometry, robotics, and numerical approximations


## Overview

In these two lectures, we review numerical approaches to solving (systems of) polynomial equations.

## Usefull resources

* [`Scipy` Lecture Notes](https://scipy-lectures.org/index.html)
* [`Matplotlib` cheatsheet (basics)](https://camo.githubusercontent.com/b1b8838502a81077591ccadbf45dc45f2207637b41245e557198b680b0a2e662/68747470733a2f2f6d6174706c6f746c69622e6f72672f63686561747368656574732f68616e646f75742d626567696e6e65722e706e67)
* [`Matplotlib` cheatsheet (advanced)](https://camo.githubusercontent.com/fc055a0d3897e7aec7ec66fc1d7f70cfb2873f82eb5be4ea977286a1cf08fa74/68747470733a2f2f6d6174706c6f746c69622e6f72672f63686561747368656574732f68616e646f75742d696e7465726d6564696174652e706e67)
* [`Matplotlib` cheatsheet (expert)](https://camo.githubusercontent.com/62a744e98372f7aaad377cf1f535dcc10117ff196c876102682b03ca4759f420/68747470733a2f2f6d6174706c6f746c69622e6f72672f63686561747368656574732f68616e646f75742d746970732e706e67)
* [`NumPy` cheatsheet](http://datacamp-community-prod.s3.amazonaws.com/ba1fe95a-8b70-4d2f-95b0-bc954e9071b0)
* [`NumPy` for Matlab users](https://numpy.org/doc/stable/user/numpy-for-matlab-users.html)

## Lecture 3

Recap of rootfinding, computing in finite precision arithmetic, accuracy and stability of algorithms for solving linear systems of equations. 

* Read: [Numerical methods and optimization](https://link.springer.com/book/10.1007%2F978-3-319-07671-3) chapters 7.3, 14, 3.6

* The slides are found [here](...) 
* The notebooks used in the lecture are found [here](...)

Suggested exercises:

* Analyse the convergence of the fixed point method with $g(x) = x + \alpha f(x)$; under what conditions on $\alpha$ does the method converge and what is the optimal $\alpha$?
* Analyse the convergence of the modified Newton's method $x_{k+1} = x_k - m f(x_k)/f'(x_k)$ when applied to a function that has a root with multiplicity m. What happens when you apply this method to a function with a root with higher or lower multiplicity?
* Try to solve the Cyclic-6 problem using Gröbner basis and elimination. How sensitive is the system to small errors?

## Lecture 4

Newton-methods for solving systems of non-linear equations, 

* Read: [Numerical methods and optimization](https://link.springer.com/book/10.1007%2F978-3-319-07671-3), chapter 7.4
* The slides are found [here](...) 
* The notebooks used in the lecture are found [here](...)

Suggested exercises:

* Prove convergence of the multivariate Newton method using a fixed point argument. Start by proving convergence for the multi-variate fixed-point iteration $x_{k+1} = g(x_k)$
* Show that minimizing $\phi(x) = \|f(x)\|^2$ is equivalent to using Newton's method using the pseudo-inverse of the Jacobian in case the system is overdetermined (in this case $J^{\dagger} = (J^TJ)^{-1}J^T$). Recall that at a minimum, the gradient of $\phi$ is zero.
* Solve the Cyclic-6 problem using Newton's method
