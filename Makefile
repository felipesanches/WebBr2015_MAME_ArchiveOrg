INKSCAPE = inkscape
GHOSTSCRIPT = gs

SLIDES = 00_INTRO.pdf \
         01_Internet_Archive.pdf \
         02_WaybackMachine.pdf \
         08_Carrier_Air_Wing.pdf \
         10_MAME.pdf \
         11_gunsmoke_placa.pdf \
         16_MESS.pdf \
         23_Replicator_1.pdf \
         24_Uzebox.pdf \
         25_Minicom_IV.pdf \
         26_free_software.pdf \
         27_Datasheet.pdf \
         28_Reverse_Engeneering.pdf \
         29_Linux_Libre.pdf \
         30_paradox.pdf \
         39_thanks.pdf

PDF = WebBR2015_MAME_InternetArchive.pdf

all: $(PDF)

clean:
	rm -rf $(SLIDES)
	rm $(PDF)

%.pdf: %.svg
	$(INKSCAPE) -f $< --export-pdf=$@

$(PDF): $(SLIDES)
	$(GHOSTSCRIPT) -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$(PDF) $(SLIDES)
	evince $(PDF)
