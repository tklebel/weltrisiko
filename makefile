all: index.html handout_klebel.pdf

index.html: main.md style.css
	pandoc -t "revealjs"  $(<F) -o $(@F) --smart --standalone --toc --toc-depth=1 \
	-V revealjs-url:reveal.js \
	-V theme=beige \
	--css=style.css \
	-V transition=convex 


live:
	git push
	git checkout gh-pages
	git merge master
	git push
	git checkout master


handout_klebel.pdf: handout.md
	pandoc $(<F) -o $(@F) --smart --standalone --number-sections --filter pandoc-citeproc \
	--template=excerpt.tex --data-dir=/Users/thomask/Documents/LaTeX/pandoc 


