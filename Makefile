BUNDLE_DIR = roynard.cv
SUBDIRS = longcv shortcv
DEP = ./bibliography.bib

all : $(SUBDIRS) tarball

${BUNDLE_DIR}.tar.gz : $(SUBDIRS)
	mkdir -p ${BUNDLE_DIR}
	cp -f longcv/cv.compressed.pdf ${BUNDLE_DIR}/longcv.pdf
	cp -f longcv/cv.embedded.pdf ${BUNDLE_DIR}/longcv.embedded.pdf
	cp -f shortcv/cv.compressed.pdf ${BUNDLE_DIR}/shortcv.pdf
	cp -f shortcv/cv.embedded.pdf ${BUNDLE_DIR}/shortcv.embedded.pdf
	tar cvzf ${BUNDLE_DIR}.tar.gz ${BUNDLE_DIR}

tarball : ${BUNDLE_DIR}.tar.gz

$(SUBDIRS) :
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY : $(SUBDIRS)

clean : subdirclean
	rm -rf ${BUNDLE_DIR} ${BUNDLE_DIR}.tar.gz

subdirclean : $(SUBDIRS)
