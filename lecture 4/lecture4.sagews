︠895bdec8-5127-4744-be84-fbc9431ed303s︠
import numpy as np
import matplotlib
︡9dadc00c-d306-4c0a-88f3-715c139772ee︡{"done":true}
︠b6829aa2-218b-4d4f-9746-02dc0798f08fi︠
%md
# Gaussian elimination

We apply Gaussian elimination to the system $Ax = b$ with $b = (2,1,0, -1, -2, \ldots, -n+2)$ and $$A = \left(\begin{matrix} 1 & 0 & \ldots & \ldots & 0 & 1 \\ -1 & 1 & 0 & \ldots & 0 & 1 \\ -1 & -1 & 1 & \ddots & \vdots & 1 \\ \vdots & \ddots & -1 & \ddots & 0 & \vdots \\ \vdots & \ddots & \ddots & \ddots & \ddots & 1 \\ -1 & \ldots & \ldots & \ldots & -1 & 1\end{matrix}\right).$$ The solution is given by $x = (1,1,\ldots, 1)$.
︡cf30c24a-93e8-4921-9173-84d3c9234133︡{"done":true,"md":"# Gaussian elimination\n\nWe apply Gaussian elimination to the system $Ax = b$ with $b = (2,1,0, -1, -2, \\ldots, -n+2)$ and $$A = \\left(\\begin{matrix} 1 & 0 & \\ldots & \\ldots & 0 & 1 \\\\ -1 & 1 & 0 & \\ldots & 0 & 1 \\\\ -1 & -1 & 1 & \\ddots & \\vdots & 1 \\\\ \\vdots & \\ddots & -1 & \\ddots & 0 & \\vdots \\\\ \\vdots & \\ddots & \\ddots & \\ddots & \\ddots & 1 \\\\ -1 & \\ldots & \\ldots & \\ldots & -1 & 1\\end{matrix}\\right).$$ The solution is given by $x = (1,1,\\ldots, 1)$."}
︠75d68d2b-342f-498a-8afd-e77ebd57bb74s︠
n = 400

A = np.eye(n) - np.tril(np.ones((n,n)),-1)
A[:,-1] = 1
x = np.ones(n)
b = A.dot(x)
xh = np.linalg.solve(A, b)
residual = np.linalg.norm(A.dot(xh) - b)/np.linalg.norm(b)
error = np.linalg.norm(x - xh)/np.linalg.norm(x)

print('n              : ', n)
print('residual       : ', residual)
print('relative error : ', error)
︡25bd95a9-318c-44e4-a5a2-00ff3f2b7d27︡{"stdout":"('n              : ', 400)\n"}︡{"stdout":"('residual       : ', 0.8103430273771809)\n"}︡{"stdout":"('relative error : ', 0.9300537618869138)\n"}︡{"done":true}
︠eaca6cb4-68ad-4f8b-a5c9-470024f6f443s︠
b[-1]
︡f123f30d-c3fe-44f4-aa6d-a82fd6a25723︡{"stdout":"-398.0\n"}︡{"done":true}
︠1bfab24d-dcde-4e0d-80bf-ca8e3d18d59e︠
%md 
We can see what the problem is by inspecting $LU$ decomposition:
︡4d7d77fb-a2bb-43fb-a513-88057a1895f3︡{"done":true,"md":"We can see what the problem is by inspecting $LU$ decomposition:"}
︠fa5e57b7-53d5-417e-a254-23bfb1bf23c9s︠
n = 10
A = np.eye(n) - np.tril(np.ones((n,n)),-1)
A[:,-1] = 1
P, L, U = matrix(A).LU()
print(U)
︡13880c07-bdc6-4702-87fd-0cb0b0041975︡{"stdout":"[  1.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   1.0]\n[  0.0   1.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   2.0]\n[  0.0   0.0   1.0   0.0   0.0   0.0   0.0   0.0   0.0   4.0]\n[  0.0   0.0   0.0   1.0   0.0   0.0   0.0   0.0   0.0   8.0]\n[  0.0   0.0   0.0   0.0   1.0   0.0   0.0   0.0   0.0  16.0]\n[  0.0   0.0   0.0   0.0   0.0   1.0   0.0   0.0   0.0  32.0]\n[  0.0   0.0   0.0   0.0   0.0   0.0   1.0   0.0   0.0  64.0]\n[  0.0   0.0   0.0   0.0   0.0   0.0   0.0   1.0   0.0 128.0]\n[  0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   1.0 256.0]\n[  0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0 512.0]\n"}︡{"done":true}
︠0e182660-2200-4462-8120-8ed1e201122di︠
%md
# Richardson iteration

An alternative is to solve the system using an iterative method

$$x_{k+1} = (I - \alpha A)x_k + \alpha b$$
︡f903826c-ffd0-4621-acb3-d4336e5af3fa︡{"done":true,"md":"# Richardson iteration\n\nAn alternative is to solve the system using an iterative method\n\n$$x_{k+1} = (I - \\alpha A)x_k + \\alpha b$$"}
︠ef08a791-9f71-48dd-ac02-9084d7f73f97s︠
n = 80
A = np.eye(n) - np.tril(np.ones((n,n)),-1)
A[:,-1] = 1

x = np.ones(n)
b = A.dot(x)

B = A.T.dot(A)
y = A.T.dot(b)

alpha = 1/np.linalg.norm(B,ord=2)

xh = np.zeros(n)
for k in range(100000):
    xh = xh - alpha*B.dot(xh) + alpha*y

residual = np.linalg.norm(A.dot(xh) - b)/np.linalg.norm(b)
error = np.linalg.norm(x - xh)/np.linalg.norm(x)

print('n              : ', n)
print('residual       : ', residual)
print('relative error : ', error)
︡a2b3b7d4-41b2-4c9b-8888-4e144b4377e4︡{"stdout":"('n              : ', 80)\n"}︡{"stdout":"('residual       : ', 2.7862172637324917e-15)\n"}︡{"stdout":"('relative error : ', 8.21439303345155e-14)\n"}︡{"done":true}
︠ec23de1f-92d0-4b66-85c1-4d79aecc2274i︠
%md
# Fixed point iterations

Express system of equations $F(x) = 0$ (with $F:\mathbb{R}^n \rightarrow \mathbb{R}^n$) as $G(x) = x$ and iterate
$$x^{(k+1)}  = G(x^{(k)}).$$
︡98a8891e-f6b3-4518-946e-a1285a1f2850︡{"done":true,"md":"# Fixed point iterations\n\nExpress system of equations $F(x) = 0$ (with $F:\\mathbb{R}^n \\rightarrow \\mathbb{R}^n$) as $G(x) = x$ and iterate\n$$x^{(k+1)}  = G(x^{(k)}).$$"}
︠1f08512a-c94a-4eb5-bd25-9558632dc3d9s︠
def fixedpoint(G,x,tol=1e-6,maxit=10):
    converged = False
    iter = 0
    points = [x]
    while not converged:
        xp = G(x)
        iter = iter + 1
        converged = (norm(xp - x) <= tol) or (iter >= maxit)
        x = xp
        points.append(x)
    return points
︡78db6822-425a-43ff-85a1-44ec8905858d︡{"done":true}
︠3e6f9c28-6175-4c3a-b444-bbb36707c9c0s︠
F(x1,x2) = [x1^2 + x2^2 - 2, x1 - x2]
J = F.diff()
G = lambda x :  x - 1e-1*J(x[0],x[1]).transpose()*F(x[0],x[1])
x0 = vector([0.0,0.0])
xk = fixedpoint(G,x0,maxit=100)
list_plot(xk,color='red',plotjoined=True,marker='o') + implicit_plot(F[0],(x1,-2,2),(x2,-2,2)) + implicit_plot(F[1],(x1,-2,2),(x2,-2,2))
︡ef9337ad-634b-4c82-a96e-5f28528c0c3f︡{"file":{"filename":"/home/user/.sage/temp/project-1e6de7dc-adeb-4f47-ae0e-229406713b63/386/tmp_538GCY.svg","show":true,"text":null,"uuid":"421ef32a-8486-4485-b659-ad27770d6abd"},"once":false}︡{"done":true}
︠f77d41f8-22b6-4889-b42c-f4f1f1aaf454︠

︡d927e545-2d86-4795-920e-2b8101f67a4d︡
︠99c785e1-a559-45d9-9a88-2c14c4ece70fi︠
%md
## Newton's method

$$x^{(k+1)} = x^{(k)} - J(x^{(k)})^{-1}F(x^{(k)}),$$
with $J$ the Jacobian with elements $\frac{\partial f_i}{\partial x_j}$.


︡b141dd3d-fb61-46e1-8403-bccbb1c8389f︡{"done":true,"md":"## Newton's method\n\n$$x^{(k+1)} = x^{(k)} - J(x^{(k)})^{-1}F(x^{(k)}),$$\nwith $J$ the Jacobian with elements $\\frac{\\partial f_i}{\\partial x_j}$."}
︠86164b2f-b1b8-4990-b07b-0f85c1bbcce3s︠

︡eba2c1e7-e6f6-4caf-91d5-0b5aad1cb7d5︡{"done":true}
︠e95b74a2-93ae-4f6d-933b-42bcf7be8269s︠
F(x1,x2) = [x1^2 + x2^2 - 2, x1 - x2]
J = F.diff()
G = lambda x :  x - J(x[0],x[1]).inverse()*F(x[0],x[1])
x0 = vector([0.0,0.0])
xk = fixedpoint(G,x0,maxit=100)
list_plot(xk,color='red',plotjoined=True,marker='o') + implicit_plot(F[0],(x1,-2,2),(x2,-2,2)) + implicit_plot(F[1],(x1,-2,2),(x2,-2,2))
︡73e7d27c-d388-4aca-9b64-3815e44e03af︡{"stderr":"Error in lines 5-5\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1234, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\n  File \"\", line 6, in fixedpoint\n  File \"\", line 1, in <lambda>\n  File \"sage/matrix/matrix2.pyx\", line 8927, in sage.matrix.matrix2.Matrix.inverse (build/cythonized/sage/matrix/matrix2.c:66883)\n    return ~self\n  File \"sage/matrix/matrix0.pyx\", line 5437, in sage.matrix.matrix0.Matrix.__invert__ (build/cythonized/sage/matrix/matrix0.c:36332)\n    raise ZeroDivisionError(\"input matrix must be nonsingular\")\nZeroDivisionError: input matrix must be nonsingular\n"}︡{"done":true}
︠3f873be5-6cd8-49db-b9ee-b6d648dd8d44s︠
(F(x0[0],x0[1]) + J(x0[0],x0[1])*vector([x1,x2])-x0)[1]
︡6bb0af9b-e20d-4f6c-b870-1b3441a08927︡{"stdout":"x1 - x2 - 3.00000000000000\n"}︡{"done":true}
︠b0bce979-3fa3-458a-a65f-2fe4af5626cfs︠
F(x1,x2)=[x1^2 + x2^2 - 2, x1 + x2 - 2]
J = F.diff()
G = lambda x :  x - J(x[0],x[1]).inverse()*F(x[0],x[1])
x0 = vector([1.0,2.0])
xk = fixedpoint(G,x0,maxit=100)
list_plot(xk,color='red',plotjoined=True,marker='o') + implicit_plot(F[0],(x1,-2,2),(x2,-2,2)) + implicit_plot(F[1],(x1,-2,2),(x2,-2,2))
︡f2ab9c57-e9da-4b18-91d2-be7bfe2d208e︡{"file":{"filename":"/home/user/.sage/temp/project-1e6de7dc-adeb-4f47-ae0e-229406713b63/386/tmp_tAbABF.svg","show":true,"text":null,"uuid":"d4ff6596-82c8-4f54-b6e0-f24c7ceb9e5e"},"once":false}︡{"done":true}
︠1ac4476c-517d-45af-95e4-d993790b91e5s︠
F(x1,x2)=[x1^2 + x2^2 - 2, (x1-3)^2 + (x2-3)^2 - 8]
J = F.diff()
G = lambda x :  x - J(x[0],x[1]).inverse()*F(x[0],x[1])
x0 = vector([-1.0,1.0])
xk = fixedpoint(G,x0,maxit=100)
list_plot(xk,color='red',plotjoined=True,marker='o') + implicit_plot(F[0],(x1,-2,2),(x2,-2,2)) + implicit_plot(F[1],(x1,-2,2),(x2,-2,2))
︡5aff5649-4183-42a5-908c-2b02422d0fdd︡{"file":{"filename":"/home/user/.sage/temp/project-1e6de7dc-adeb-4f47-ae0e-229406713b63/1143/tmp_yfff6L.svg","show":true,"text":null,"uuid":"d72eb0b8-e12a-4858-97db-eb9393c06c84"},"once":false}︡{"done":true}
︠a22e7941-6034-4380-9f7f-e4b22ecb3b37s︠
F(x1,x2,x3)=[x1^2 + x2^2 + x3^2 - 3, x1 + x2 + x3 - 2, x1 + x2 - x3 -1]
J = F.diff()
G = lambda x :  x - J(x[0],x[1],x[2]).inverse()*F(x[0],x[1],x[2])
x0 = vector([1.0,2.0,1.0])
xk = fixedpoint(G,x0,maxit=100)
implicit_plot3d(F[0],(x1,-2,2),(x2,-2,2),(x3,-2,2),opacity=0.1) + implicit_plot3d(F[1],(x1,-2,2),(x2,-2,2),(x3,-2,2),opacity=0.1) + implicit_plot3d(F[2],(x1,-2,2),(x2,-2,2),(x3,-2,2),opacity=0.1)+list_plot(xk,color='red',plotjoined=True,marker='d')
︡1a4ca31b-6ba7-4064-b35e-1f5a03b709c9︡{"file":{"filename":"e5881d5f-cb68-44fb-8154-90b2f459a038.sage3d","uuid":"e5881d5f-cb68-44fb-8154-90b2f459a038"}}︡{"done":true}
︠895de397-9f58-4481-9993-e6b114caf83fs︠
x0.dot_product(x0)
︡e6a4055e-3160-4f7d-94b9-3cbae07d60ae︡{"stdout":"6.00000000000000\n"}︡{"done":true}
︠d81b7206-f1c5-4da0-a968-1f465fae3a08︠
%md
## Steffensens method

$$x_{n+1} = x_n + \left(I - D(F(x_n),x_n)\right)^{-1}\left(F(x_n) - x_n\right),$$

with $$D(x,y) = \frac{1}{\|x - y\|^2}(F(x) - F(y))(x - y)^T.$$

We can readily compute the inverse using the Sherman-Morrison identity:

$$\left(I + uv^T\right)^{-1} = I - \frac{1}{1 + v^Tu}uv^T.$$
︡6564679b-8762-4c92-9ad7-1f14b2daa310︡{"done":true,"md":"## Steffensens method\n\n$$x_{n+1} = x_n + \\left(I - D(F(x_n),x_n)\\right)^{-1}\\left(F(x_n) - x_n\\right),$$\n\nwith $$D(x,y) = \\frac{1}{\\|x - y\\|^2}(F(x) - F(y))(x - y)^T.$$\n\nWe can readily compute the inverse using the Sherman-Morrison identity:\n\n$$\\left(I + uv^T\\right)^{-1} = I - \\frac{1}{1 + v^Tu}uv^T.$$"}
︠f85cbb60-11b2-4534-81ba-6c6167eaf610︠

︡9e31d32f-22b6-48a3-bc07-57ab8253658f︡
︠a57be175-f739-4b12-8e15-3d2f8076d79a︠
%md
## Broyden methods

Approximate the Jacobian so that it satisfies the *secant equation*

$$\widetilde{J}_n (x_n - x_{n-1}) = F(x_n) - F(x_{n-1})$$
︡96dce3ae-18ec-4fd4-acaf-24cdf1904e62︡{"done":true,"md":"## Broyden methods\n\nApproximate the Jacobian so that it satisfies the *secant equation*\n\n$$\\widetilde{J}_n (x_n - x_{n-1}) = F(x_n) - F(x_{n-1})$$"}
︠3143b6b6-9a7f-4735-bf64-ab789239605f︠

︡3f84f12e-caa3-4e4e-a09b-772d67b1d622︡
︠73d9cb11-2255-4147-9308-d2c77fae60f1︠

︡aa066418-3fac-43e8-b806-bf0f5eb76515︡
︠3ed2ca69-2970-4d8b-a2ee-f9287090605f︠
%md
## Over and under determined systems
︡ab0cd49f-8c40-4c1a-9282-285632177b90︡{"done":true,"md":"## Over and under determined systems"}
︠1a9defea-a107-46fb-8bf1-502ae3ec1a6d︠









