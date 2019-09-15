.PHONY : all clean

SRC = mental_poker

all : $(SRC).pdf $(SRC)_without_animation.pdf

clean:
	latexmk -C

%.pdf: %.tex main.tex vc.tex lib/*
	latexmk -pdf $<

vc.tex: .git/logs/HEAD
	echo "%%% This file is generated by Makefile." > vc.tex
	echo "%%% Do not edit this file!\n%%%" >> vc.tex
	git log -1 --format="format:\
		\\gdef\\GITAbrHash{%h}\
		\\gdef\\GITAuthorDate{%ad}\
		\\gdef\\GITAuthorName{%an}" >> vc.tex
