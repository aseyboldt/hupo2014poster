TEX_FILES = intro.tex why_text_params.tex

all : poster.pdf

example_param.tex : example_param.yaml
	pygmentize -o example_param.tex -O linenos example_param.yaml

pygmentize_style.tex :
	pygmentize -f latex -S trac > pygmentize_style.tex

poster.pdf : poster.tex pygmentize_style.tex example_param.tex ${TEX_FILES}
	pdflatex poster.tex
	pdflatex poster.tex
