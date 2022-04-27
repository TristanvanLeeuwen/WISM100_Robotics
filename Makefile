html: index lecture1 lecture2
	cp lectures/lecture1.slides.html html/lecture1.html
	cp lectures/lecture2.slides.html html/lecture2.html

	cp -r lectures/figures ./html

lecture1: lectures/lecture1.ipynb
	jupyter nbconvert --to slides lectures/lecture1.ipynb --template=cwi

lecture2: lectures/lecture2.ipynb
	jupyter nbconvert --to slides lectures/lecture2.ipynb --template=cwi

index: index.md
	pandoc --standalone index.md --template=html/uikit.html -o html/index.html --toc --metadata title="WISM103, part 2"

website: html
	ghp-import -n -p -f html
	open https://tristanvanleeuwen.github.io/WISM100_Robotics/index.html
	
