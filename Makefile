TEX_FILES = intro.tex why_text_params.tex integrate.tex gui.tex conclusion.tex references.tex remote_exec.tex timeings.tex
PYGMENTIZE_FILES = pygmentize_style.tex example_param.tex call_mqrun.tex

all : poster.pdf

example_param.tex : example_param.yaml
	pygmentize -o example_param.tex example_param.yaml

call_mqrun.tex : call_mqrun.py
	pygmentize -o call_mqrun.tex call_mqrun.py

pygmentize_style.tex :
	pygmentize -f latex -S trac > pygmentize_style.tex

poster.pdf : poster.tex ${PYGMENTIZE_FILES} ${TEX_FILES}
	pdflatex poster.tex
	pdflatex poster.tex
