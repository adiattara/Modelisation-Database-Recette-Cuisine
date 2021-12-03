# Les fichiers attendus pour le rendu sur le devoir Moodle
RAPPORT = rapport/ModeleMFC
MOD = modelisation
REQ = requetes

DEVOIR = \
$(RAPPORT)/images\
$(REQ)\
$(MOD)\
$(RAPPORT)/Main.pdf

(RAPPORT)/Main.pdf:	$(RAPPORT)/Main.tex
	pdflatex (RAPPORT)/Main
	pdflatex (RAPPORT)/Main

# génère un fichier devoir.tgz contenant les fichiers à déposer sur Moodle
devoir.tgz: $(DEVOIR)
	tar czvf devoir.tgz $(DEVOIR)

clean:
	rm -f *.gc*
	rm -f *.log
	rm -f *.out
	rm -f *.fls
	rm -f *.fdb*
	rm -f *.toc
	rm -f *.aux *.pdf
	rm -f tags core moodle.tgz
	rm -f devoir.tgz

