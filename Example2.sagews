︠d9130465-070f-4ff3-a63a-5ff7e24369c0i︠
%md
# Working with univariate Polynomials

We can do symbolic manipulations with univariate Polynomials in SAGE. As an example, we consider the ring $\mathbb{Q}[x]$
︡d5c6a1e5-2a3d-451f-8d46-a0eda25baecb︡{"done":true,"md":"# Working with univariate Polynomials\n\nWe can do symbolic manipulations with univariate Polynomials in SAGE. As an example, we consider the ring $\\mathbb{Q}[x]$"}
︠051e935a-7b71-4dff-8510-d2d573cfc631s︠
R.<x> = PolynomialRing(RationalField())
︡1877adb2-4fb9-432e-a125-2f085253f1e6︡{"done":true}︡
︠fcd025b1-a4f6-4e51-99a0-ad5adff19439i︠
%md 
Now, lets define a few polynomials $f = 2x^2 - x - 1$ and $g = x$
︡a9f2ec56-f86b-40c1-9cf6-a313096057aa︡{"done":true,"md":"Now, lets define a few polynomials $f = 2x^2 - x - 1$ and $g = x$"}
︠38a0dc47-6948-4d04-a956-03a2abab8513s︠
f = 2*x^2 - x - 1
g = x
︡8dd0800c-2f0b-4369-9247-c74e95532d2a︡{"done":true}︡
︠eeec639a-c71f-4602-b61b-b43001eece51s︠
plot(f,-2,2)+plot(g,-2,2)
︡022b73fe-9799-4bdf-9019-e9f3ba3ef4ba︡{"file":{"filename":"/projects/77d85660-0be1-45e3-9b60-02095c4754f1/.sage/temp/compute1-us/31765/tmp_gK3GVi.svg","show":true,"text":null,"uuid":"5fa9c7bb-0308-42af-89ab-bb30c03f2426"},"once":false}︡{"done":true}︡
︠ea560347-162f-4bae-a184-d2b0dc349484i︠
%md 
We can get their leading terms, leading coefficients, derivatices, etc as follows
︡5e73077d-0999-4175-b76e-82c7873c1b69︡{"done":true,"md":"We can get their leading terms, leading coefficients, derivatices, etc as follows"}
︠dc4c5db2-65bc-4cd2-9465-dc75c76245dfs︠
f.lt() # leading term
︡98055822-cace-4001-b4fe-866b8031c068︡{"stdout":"2*x^2\n"}︡{"done":true}︡
︠8419b78c-423e-423f-9a8d-491060b43e94s︠
f.lc() # leading coefficient
︡aa5d8f36-8346-4bac-9e07-ffd35cbb6246︡{"stdout":"2\n"}︡{"done":true}︡
︠ee65fe74-6afa-48cf-bbe8-de2bc4c3a513s︠
f.lm() # leading monomial
︡6368e9f2-8a07-4a29-a0b7-66046b5e6d9a︡{"stdout":"x^2\n"}︡{"done":true}︡
︠11e19db0-174e-4438-a0af-8c8a2d7a5796s︠
f.degree() # degree
︡6dd0a6ad-1b5e-48e2-a404-a284745e7660︡{"stdout":"2\n"}︡{"done":true}︡
︠1af55bb3-e359-474b-86aa-945d9e69f1e2s︠
f.derivative()
︡a84d30be-8eb7-4929-ae67-7cf1ae90b1ed︡{"stdout":"4*x - 1\n"}︡{"done":true}︡
︠26a720ed-c43c-488d-ba14-667f00fbb9a4i︠
%md
## Euclids algorithm
We can now perform polynomial division of $f$ by $g$ as follows
︡8d15f648-670d-445e-8602-f7362e9679c0︡{"done":true,"md":"## Euclids algorithm\nWe can now perform polynomial division of $f$ by $g$ as follows"}
︠0112157c-4fe1-4bcd-8e42-f22ab5b3689es︠
q = 0
r = f
d = g.degree()
c = g.lc()
while r.degree() >= d:
    s = (r.lc()/c)*x^(r.degree()-d)
    q = q + s
    r = r - s*g
q
r
︡2ea1f1a5-9470-4c71-814b-e26f6c905642︡{"stdout":"2*x - 1\n"}︡{"stdout":"-1\n"}︡{"done":true}︡
︠c92300ac-e9f0-43bd-9e51-4a952c6ce573i︠
%md
giving us the quotient $q = 2x$ and remainder $r = 1$. A shortcut is to use the built-in method `quo_rem()`
︡3fb4c2e5-fa10-4006-b6ee-399d2ed20a8b︡{"done":true,"md":"giving us the quotient $q = 2x$ and remainder $r = 1$. A shortcut is to use the built-in method `quo_rem()`"}
︠b8e7115a-2be5-4d63-9f75-9106e9175964s︠
f.quo_rem(g)
︡84eb7105-fc85-4957-8de0-47db18e90c4f︡{"stdout":"(2*x - 1, -1)\n"}︡{"done":true}︡
︠641b89f6-9c89-4ccf-8023-1852d2de4af0i︠
%md
## Newton's method
We can find a root of a polynomial using Newton's method $$x_{k+1} = x_k - f(x_k)/f'(x_{k}),$$ for some given $x_0$. In SAGE, we can implement this as follows
︡0f8b5185-1cc4-4d1f-b69f-f805328e6b8a︡{"done":true,"md":"## Newton's method\nWe can find a root of a polynomial using Newton's method $$x_{k+1} = x_k - f(x_k)/f'(x_{k}),$$ for some given $x_0$."}
︠2ea2257e-e817-4796-84f9-2c2aed456870s︠
x = 2
dx = 1
while abs(dx) >= 1e-6:
    dx = f(x)/f.derivative()(x)
    x = x - dx
x
︡2ce135c2-a7c2-4d73-a063-614375c029b4︡{"stdout":"7761021455129703458091/7761021455127555974443\n"}︡{"done":true}︡
︠f922bd19-fac5-416f-910d-49e1207718d6i︠
%md
Note that, since are working in $\mathbb{Q}$, SAGE gives us a rational answer. We can express the answer as a *floating point number* using `float`
︡98c8eea1-1702-4b0a-a587-c2ff30fb2cb1︡{"done":true,"md":"Note that, since are working in $\\mathbb{Q}$, SAGE gives us a rational answer. We can express the answer as a *floating point number* using `float`"}
︠54ebc659-4a5d-4053-b007-cf933949046c︠
︡8256bb00-d9b8-4cb2-bb52-12045ccb564c︡
︠187ae59e-da32-42eb-bfff-756fe1629e9cs︠
float(x)
︡93117667-2902-4234-9178-db8b5ab07c0b︡{"stdout":"1.0000000000002767\n"}︡{"done":true}︡
︠5ff59079-e0fa-47a8-822f-80a99d7ee21di︠
%md
To find the second root, we need to find an $x_0$ for which Newtons method converges to that root. In some cases we can ask SAGE to give us all the roots immediately using `complex_roots()`
︡2b6da93c-a41d-4149-beab-54807b9f4c02︡{"done":true,"md":"To find the second root, we need to find an $x_0$ for which Newtons method converges to that root. In some cases we can ask SAGE to give us all the roots immediately using `complex_roots()`"}
︠f3950086-7924-4d19-bca3-9c03503b8f68s︠
f.complex_roots()
︡4a27e7cc-09f4-41e3-b6cf-a1eb2230cb5c︡{"stdout":"[-0.500000000000000, 1.00000000000000]\n"}︡{"done":true}︡
︠8837423d-9440-4e86-888e-9265e916ce8e︠









