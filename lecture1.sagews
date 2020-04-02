︠4ef0f7e4-d5a3-496e-aba7-0a930ad8c2e2︠
var('x','y')
f(x) = (x-1)^7
g(x) = x^7 - 7*x^6 + 21*x^5 - 35*x^4 + 35*x^3 - 21*x^2 + 7*x - 1
plot(f,[.99,1.01],color='blue') + plot(g,[.99,1.01],color='red')

︡084ecd35-78f2-4f89-a438-c021318cc289︡{"stdout":"(x, y)\n"}︡{"file":{"filename":"/projects/77d85660-0be1-45e3-9b60-02095c4754f1/.sage/temp/compute1-us/29480/tmp_2Q0Dyk.svg","show":true,"text":null,"uuid":"2e30cc75-4eb2-41ba-939c-6a5db820710e"},"once":false}︡{"done":true}︡
︠3a7b6b10-ebb6-428c-9e67-8c6ab6d9e4efs︠
g(x) = 0.5*x*(1-x)
root = 0
converged = False
iter = 0
tol = 1e-10
maxit = 10
xo = .1
while not converged:
    xt = g(xo)
    iter = iter + 1
    converged = (norm(xt - xo) <= tol) or (iter >= maxit)
    xo = xt
    print 'error = %1.2e'%abs(xt - root)
︡305bcb26-36c2-45a0-a7ca-08007f099703︡{"stdout":"error = 4.50e-02\nerror = 2.15e-02\nerror = 1.05e-02\nerror = 5.20e-03\nerror = 2.59e-03\nerror = 1.29e-03\nerror = 6.44e-04\nerror = 3.22e-04\nerror = 1.61e-04\nerror = 8.04e-05\n"}︡{"done":true}︡
︠c06d3678-7a4a-450c-bfd2-c6fd32b5e1d8s︠
f(x,y)=[x^2 + y^2 - 2, x - y]
J=f.diff()
root = vector([1,1])
converged = False
iter = 0
maxit = 10
tol = 1e-6
xo = vector([1.0,0.0])
points = [xo]
while not converged:
    p = -J(xo[0],xo[1]).inverse()*f(xo[0],xo[1])
    xt = xo + p
    iter = iter + 1
    converged = (norm(p) <= tol) or (iter >= maxit)
    xo = xt
    points.append(xt)
    print 'error = %1.2e'%norm(xo-root)
list_plot(points,color='red',plotjoined=True,marker='o') + implicit_plot(f[0],(x,-2,2),(y,-2,2)) + implicit_plot(f[1],(x,-2,2),(y,-2,2))
︡221cd6f8-1d0c-4101-807e-86cee8a8467f︡{"stdout":"error = 7.07e-01\nerror = 1.18e-01\nerror = 4.53e-03\nerror = 7.24e-06\nerror = 1.85e-11\nerror = 0.00e+00\n"}︡{"file":{"filename":"/projects/77d85660-0be1-45e3-9b60-02095c4754f1/.sage/temp/compute1-us/2798/tmp_v2POHJ.svg","show":true,"text":null,"uuid":"9e81441a-1d94-401b-80cf-25eda05626e7"},"once":false}︡{"done":true}︡
︠5d9380fc-55f3-43a4-b2df-acfcedc0e6c1s︠
f(x,y)=[x^2 + y^2 - 2, x + y - 2]
J=f.diff()
root = vector([1,1])
converged = False
iter = 0
maxit = 10
tol = 1e-6
xo = vector([1.0,0])
points = [xo]
while not converged:
    p = -J(xo[0],xo[1]).inverse()*f(xo[0],xo[1])
    xt = xo + p
    iter = iter + 1
    converged = (norm(p) <= tol) or (iter >= maxit)
    xo = xt
    points.append(xt)
    print 'error = %1.2e'%norm(xo-root)
list_plot(points,color='red',plotjoined=True,marker='o') + implicit_plot(f[0],(x,-2,2),(y,-2,2)) + implicit_plot(f[1],(x,-2,2),(y,-2,2))
︡40735acb-9b8e-471c-83a6-33365fb7b0dc︡{"stdout":"error = 7.07e-01\nerror = 3.54e-01\nerror = 1.77e-01\nerror = 8.84e-02\nerror = 4.42e-02\nerror = 2.21e-02\nerror = 1.10e-02\nerror = 5.52e-03\nerror = 2.76e-03\nerror = 1.38e-03\n"}︡{"file":{"filename":"/projects/77d85660-0be1-45e3-9b60-02095c4754f1/.sage/temp/compute1-us/11946/tmp_d6BjJf.svg","show":true,"text":null,"uuid":"bf4311ac-86a0-488d-a3c3-78330f738231"},"once":false}︡{"done":true}︡
︠d81ebcfc-3276-4344-b98d-0fc65fbedd54s︠
f(x,y)=[x^2 + y^2 - 2, (x-3)^2 + (y-3)^2 - 8]
J=f.diff()
root = vector([1,1])
converged = False
iter = 0
maxit = 10
tol = 1e-6
xo = vector([1.0,-1])
points = [xo]
while not converged:
    p = -J(xo[0],xo[1]).inverse()*f(xo[0],xo[1])
    xt = xo + p
    iter = iter + 1
    converged = (norm(p) <= tol) or (iter >= maxit)
    xo = xt
    points.append(xt)
    print 'error = %1.2e'%norm(xo-root)
implicit_plot(f[0],(x,-2,2),(y,-2,2)) + implicit_plot(f[1],(x,-2,2),(y,-2,2))+list_plot(points,color='red',plotjoined=True,marker='o')
︡1e0e1f84-4e6c-40fe-a180-1f9b584c5af8︡{"stdout":"error = 1.41e+00\nerror = 7.07e-01\nerror = 3.54e-01\nerror = 1.77e-01\nerror = 8.84e-02\nerror = 4.42e-02\nerror = 2.21e-02\nerror = 1.10e-02\nerror = 5.52e-03\nerror = 2.76e-03\n"}︡{"file":{"filename":"/projects/77d85660-0be1-45e3-9b60-02095c4754f1/.sage/temp/compute1-us/2798/tmp_fVs0I4.svg","show":true,"text":null,"uuid":"7aee34cf-3c9c-42ec-a0d2-a96ea5e1dcb9"},"once":false}︡{"done":true}︡
︠a4409a59-d4fc-45e4-a90f-c799c912d16d︠
f(x,y,z)=[x^2 + y^2 + z^2 - 3, x + y + z - 2, x + y - z -1]
J=f.diff()
converged = False
iter = 0
maxit = 10
tol = 1e-6
xo = vector([0,2,0])
points = [xo]
while not converged:
    p = -J(xo[0],xo[1],xo[2]).inverse()*f(xo[0],xo[1],xo[2])
    xt = xo + p
    iter = iter + 1
    converged = (norm(p) <= tol) or (iter >= maxit)
    xo = xt
    points.append(xt)
    print '|p| = %1.2e'%norm(p)
implicit_plot3d(f[0],(x,-2,2),(y,-2,2),(z,-2,2),opacity=0.1) + implicit_plot3d(f[1],(x,-2,2),(y,-2,2),(z,-2,2),opacity=0.1) + implicit_plot3d(f[2],(x,-2,2),(y,-2,2),(z,-2,2),opacity=0.1)+list_plot(points,color='red',plotjoined=True,marker='d')
︡6731307c-c00c-4cf5-a526-0b54a45764fe︡{"stdout":"|p| = 6.12e-01\n|p| = 1.33e-01\n|p| = 6.86e-03\n|p| = 1.84e-05\n|p| = 1.33e-10\n"}︡{"file":{"filename":"72ca7545-6c47-42fa-af22-5352e2d5b7e0.sage3d","uuid":"72ca7545-6c47-42fa-af22-5352e2d5b7e0"}}︡{"done":true}︡
︠c60b9571-cea6-483f-931c-bcaa833df2a2︠










