︠895bdec8-5127-4744-be84-fbc9431ed303s︠
import numpy
import matplotlib
︡678390a4-f140-468a-8eba-b23cc5f5047b︡{"done":true}︡
︠cddbb957-2f03-4dc0-8012-540438b3bcd6s︠
%python
def f(x):
    return numpy.array([x[0]**2 + x[1]**2 - 1, x[0] - x[1]])
def J(x):
    return numpy.matrix([[2*x[0], 2*x[1]],[1,-1]])

x1 = numpy.linspace(-2,2,100)
x2 = numpy.linspace(-2,2,100)
[xx1,xx2] = numpy.meshgrid(x1,x2)
fig = matplotlib.pyplot.figure()
matplotlib.pyplot.axis('equal')
ax = fig.gca()
ax.contour(xx1,xx2,xx1**2 + xx2**2 - 1,colors='k',levels=[0])
ax.contour(xx1,xx2,xx1 - xx2,colors='b',levels=[0])

x = numpy.array([1,0])
converged = False
iter = 0
tol = 1e-6
maxit = 2
while not converged:
    ax.plot(x[0],x[1],marker='o',color='red')
    p = numpy.linalg.solve(J(x),f(x))
    x = x - p
    iter = iter + 1
    converged = (numpy.linalg.norm(p)<tol) or (iter > maxit)
    print(iter,numpy.linalg.norm(p))
matplotlib.pyplot.show()

︡195c4731-4b4e-4ed2-ba99-bc7064ed8f6d︡{"stdout":"(-0.059999999999999998, 0.059999999999999998, -0.059999999999999998, 0.059999999999999998)\n"}︡{"stdout":"<matplotlib.contour.QuadContourSet object at 0x7fd1b38a3810>\n"}︡{"stdout":"<matplotlib.contour.QuadContourSet object at 0x7fd1b37ce650>\n"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7fd1b37ebcd0>]\n(1, 1.0)\n[<matplotlib.lines.Line2D object at 0x7fd1b37ce650>]\n(2, 0.35355339059327379)\n[<matplotlib.lines.Line2D object at 0x7fd1b37ce710>]\n(3, 0.05892556509887896)\n"}︡{"file":{"filename":"de011a34-2742-4b68-8a74-d6a13f1cba71.svg","show":true,"text":null,"uuid":"a7f148c5-e79b-4f24-9ea9-0015c1a6d093"},"once":false}︡{"done":true}︡
︠8cc76361-36aa-4782-902b-3c0e717a0117s︠
%python
def f(x):
    return numpy.array([x[0]**2 + x[1]**2 - 2, x[0] - x[1], x[0] + x[1] - 2])
def J(x):
    return numpy.matrix([[2*x[0], 2*x[1]],[1,-1],[1,1]])

x1 = linspace(-2,2,100)
x2 = linspace(-2,2,100)
s = linspace(-.1,.1,10)
[xx1,xx2] = numpy.meshgrid(x1,x2)
fig = matplotlib.pyplot.figure()
matplotlib.pyplot.axis('equal')
ax = fig.gca()
ax.contour(xx1,xx2,xx1**2 + xx2**2 - 2,colors='k',levels=[0])
ax.contour(xx1,xx2,xx1 - xx2,colors='b',levels=[0])
ax.contour(xx1,xx2,xx1 + xx2 - 2,colors='g',levels=[0])
x = numpy.array([1,0])
converged = False
iter = 0
tol = 1e-10
maxit = 10
while not converged:
    a = ax.plot(x[0],x[1],marker='o',color='red')
    p = linalg.lstsq(J(x),f(x))[0]
    x = x - p
    iter = iter + 1
    converged = (linalg.norm(p)<tol) or (iter > maxit)
    print(iter,linalg.norm(p))
matplotlib.pyplot.show()
︡47c1b735-d461-48b7-aa20-56158af95d32︡{"stdout":"(-0.059999999999999998, 0.059999999999999998, -0.059999999999999998, 0.059999999999999998)\n"}︡{"stdout":"<matplotlib.contour.QuadContourSet object at 0x7f9eb7c9b8d0>\n"}︡{"stdout":"<matplotlib.contour.QuadContourSet object at 0x7f9eb4a82ad0>\n"}︡{"stdout":"<matplotlib.contour.QuadContourSet object at 0x7f9eb777f250>\n"}︡{"stdout":"(1, 1.0540925533894594)\n(2, 0.31119636958012253)\n(3, 0.028027720048995688)\n(4, 0.000223025653887907)\n(5, 1.406916519038287e-08)\n(6, 0.0)\n"}︡{"file":{"filename":"4e79d102-399b-4232-8b32-f8b0b724bcb2.svg","show":true,"text":null,"uuid":"243a19e6-ded8-48ae-aef6-f25f73d752be"},"once":false}︡{"done":true}︡
︠45b3f5a9-9bdd-4efa-9175-2334311e4225s︠

%python
def f(x):
    return numpy.array([x[0]**2 + x[1]**2 - 2])
def J(x):
    return numpy.matrix([[2*x[0], 2*x[1]]])

x1 = linspace(-2,2,100)
x2 = linspace(-2,2,100)
[xx1,xx2] = numpy.meshgrid(x1,x2)
fig = matplotlib.pyplot.figure()
ax = fig.gca()
matplotlib.pyplot.axis('equal')
ax.contour(xx1,xx2,xx1**2 + xx2**2 - 2,colors='k',levels=[0])
x = numpy.array([1,0.5])
converged = False
iter = 0
tol = 1e-10
maxit = 10
while not converged:
    a = ax.plot(x[0],x[1],marker='o',color='red')
    p = linalg.lstsq(J(x),f(x))[0]
    x = x - p
    iter = iter + 1
    converged = (linalg.norm(p)<tol) or (iter > maxit)
    print(iter,linalg.norm(p))
matplotlib.pyplot.show()
︡9875cfa2-c10d-4a7e-b01b-b80988fc6f4c︡{"stdout":"(-0.059999999999999998, 0.059999999999999998, -0.059999999999999998, 0.059999999999999998)\n"}︡{"stdout":"<matplotlib.contour.QuadContourSet object at 0x7f9eb4a82ad0>\n"}︡{"stdout":"(1, 0.33541019662496846)\n(2, 0.038701176533650287)\n(3, 0.00052934739939640679)\n(4, 9.9068718271003633e-08)\n(5, 3.4542034091042956e-15)\n"}︡{"file":{"filename":"ac65247e-e40f-48bd-b11a-ccce02a3b20f.svg","show":true,"text":null,"uuid":"85219f45-1cea-4630-87f9-03cde343c25b"},"once":false}︡{"done":true}︡
︠8d3339a3-1fe2-4c10-bd79-c39268c7e98bs︠
%python
def f(x):
    return numpy.array([x[0]**2 + x[1]**2 - 2, x[0] - x[1], x[0] - 1.2])
def J(x):
    return numpy.matrix([[2*x[0], 2*x[1]],[1,-1],[1,0]])

x1 = linspace(-2,2,100)
x2 = linspace(-2,2,100)
s = linspace(-.1,.1,10)
[xx1,xx2] = numpy.meshgrid(x1,x2)
fig = matplotlib.pyplot.figure()
matplotlib.pyplot.axis('equal')
ax = fig.gca()
ax.contour(xx1,xx2,xx1**2 + xx2**2 - 2,colors='k',levels=[0])
ax.contour(xx1,xx2,xx1 - xx2,colors='b',levels=[0])
ax.contour(xx1,xx2,xx1 - 1.2,colors='g',levels=[0])
x = numpy.array([1,0])
converged = False
iter = 0
tol = 1e-10
maxit = 10
while not converged:
    a = ax.plot(x[0],x[1],marker='o',color='red')
    p = linalg.lstsq(J(x),f(x))[0]
    x = x - p
    iter = iter + 1
    converged = (linalg.norm(p)<tol) or (iter > maxit)
    print(iter,linalg.norm(p))
matplotlib.pyplot.show()
︡3f40d9fa-3beb-4fa9-8afe-730bcb83264b︡{"stdout":"(-0.059999999999999998, 0.059999999999999998, -0.059999999999999998, 0.059999999999999998)\n"}︡{"stdout":"<matplotlib.contour.QuadContourSet object at 0x7f9eb6144c50>\n"}︡{"stdout":"<matplotlib.contour.QuadContourSet object at 0x7f9eb758fed0>\n"}︡{"stdout":"<matplotlib.contour.QuadContourSet object at 0x7f9eb70eb790>\n"}︡{"stdout":"(1, 1.5057224179774977)\n(2, 0.52405083388102425)\n(3, 0.086759087166500354)\n(4, 0.001773477548524111)\n(5, 1.4448587341850866e-05)\n(6, 1.2640024582108905e-07)\n(7, 1.1207583193209142e-09)\n(8, 1.1556340073250288e-11)\n"}︡{"file":{"filename":"507233b4-6667-41ba-9738-3ed3a05e8dc6.svg","show":true,"text":null,"uuid":"ce5be150-819e-42c0-9cf2-49f619b909d2"},"once":false}︡{"done":true}︡
︠d6fd94dc-a803-4399-8c53-7e6ff31b2806︠









