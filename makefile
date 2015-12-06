all: index.html handout_klebel.pdf speaker_notes.pdf

index.html: main.md style.css
	pandoc -t "revealjs"  $(<F) -o $(@F) --smart --standalone --toc --toc-depth=1 \
	-V revealjs-url:reveal.js \
	-V theme=beige \
	--css=style.css \
	-V transition=convex 


handout_klebel.pdf: handout.md
	pandoc $(<F) -o $(@F) --smart --standalone --number-sections --filter pandoc-citeproc \
	--template=excerpt.tex --data-dir=/Users/thomask/Documents/LaTeX/pandoc --variable urlcolor=blue 

speaker_notes.pdf: speaker_notes.md
	pandoc $(<F) -o $(@F) --smart --standalone --number-sections --filter pandoc-citeproc \
	--template=excerpt.tex --data-dir=/Users/thomask/Documents/LaTeX/pandoc --variable urlcolor=blue 

live:
	git push
	git checkout gh-pages
	git merge master
	git push
	git checkout master
