︠4d53b4d6-9f7b-409c-a566-fa045d39677ai︠
%md
# Plotting Affine Varieties
We can plot an affine variety, such as $\mathbf{V}(x^2 - y^2z^2 + z^3)$ as follows. First, we need to declare $x,y,z$ as symbolic variables and subsequently define the function $f(x,y,z) = x^2 - y^2z^2 + z^3$. Finally, we plot the implicitly defined surface $f(x,y,z)=0$ on the domain $[-1,1]^3$. Of course, we can also plot a two-dimensional slice, for example at $y=-1$.
︡beaea0dc-82c9-42c7-bbd2-3fe9e1617a3d︡{"done":true,"md":"# Plotting Affine Varieties\nWe can plot an affine variety, such as $\\mathbf{V}(x^2 - y^2z^2 + z^3)$ as follows. First, we need to declare $x,y,z$ as symbolic variables and subsequently define the function $f(x,y,z) = x^2 - y^2z^2 + z^3$. Finally, we plot the implicitly defined surface $f(x,y,z)=0$ on the domain $[-1,1]^3$. Of course, we can also plot a two-dimensional slice, for example at $y=-1$."}
︠f3a3747a-2659-40cf-a931-46853d939590s︠
# declare symbolic variables
var('x','y','z')
︡8ba8dd7f-33bc-48cd-8401-14c53093a199︡{"stdout":"(x, y, z)\n"}︡{"done":true}︡
︠0d18ff2c-8a17-4abb-b174-9bc2614a9352s︠
# define function
f(x,y,z)=x^2-y^2*z^2+z^3
︡7f78b78d-c707-4af3-991e-8744cb9ef25b︡{"done":true}︡
︠8303b4ab-493a-4e10-b0ac-2af2d3b20117s︠
# two-dimensional slice at y=-1
implicit_plot(f(x,-1,z)==0,(x,-1,1),(z,-1,1))

︡8b5f9213-a062-49ac-87e3-ca76b4c5229c︡{"file":{"filename":"/projects/77d85660-0be1-45e3-9b60-02095c4754f1/.sage/temp/compute1-us/21232/tmp_83vKUS.svg","show":true,"text":null,"uuid":"60bddc30-32a6-4c6a-9bc4-98f6580e6147"},"once":false}︡{"done":true}︡
︠20bb2206-653c-4717-a2a6-4723b0c50634s︠
# three-dimensional plot with 100 points per dimension
implicit_plot3d(f(x,y,z)==0,(x,-1,1),(y,-1,1),(z,-1,1),plot_points=100)
︡0cf5d486-6e5b-4faa-95fe-e5a4a3cbcdf0︡{"file":{"filename":"564f339d-a586-4461-9b08-7d46db4144e7.sage3d","uuid":"564f339d-a586-4461-9b08-7d46db4144e7"}}︡{"done":true}︡
︠469833e9-6d31-42d9-8861-fb5c04197eb9︠
# combine multiple plots by adding them together (literally!)
implicit_plot3d(x^2 + y^2 == .5,(x,-1,1),(y,-1,1),(z,-2,2),color='red')+implicit_plot3d(x==2*y - z,(x,-1,1),(y,-1,1),(z,-2,2),color='blue')
︡a12fbe3d-a271-456c-a333-cf8dd1b094f2︡{"file":{"filename":"9db63173-b7ab-4730-b235-6b1af4da6897.sage3d","uuid":"9db63173-b7ab-4730-b235-6b1af4da6897"}}︡{"done":true}︡
︠854c05d7-30b1-49bc-9b98-522f6fd007a1︠









