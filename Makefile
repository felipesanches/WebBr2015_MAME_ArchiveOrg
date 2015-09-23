INKSCAPE = inkscape
GHOSTSCRIPT = gs

SLIDES = 00_INTRO.pdf \
         01_Internet_Archive.pdf \
         02_WaybackMachine.pdf \
         03_Archive_Textos.pdf \
         04_Archive_Videos.pdf \
         05_Archive_Audio.pdf \
         06_Archive_Imagens.pdf \
         07_Archive_Software.pdf \
         08_Archive_Software_Demo_MegaMan.pdf \
         10_MAME.pdf \
         11_gunsmoke_placa.pdf \
         12_gunsmoke.pdf \
         14_Carrier_Air_Wing.pdf \
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
