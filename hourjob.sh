#!/bin/bash
# copy to public webserver
(cd /home/scape/working/bjarne-fits-tests/2011-output; ls | grep tgz | while read I; do if [ ! -f /home/scape/public/fits-web-2011/$I ]; then cp $I /home/scape/public/fits-web-2011/; fi; done)
#(cd /home/scape/working/bjarne-fits-tests/2005-output; ls | grep tgz | while read I; do if [ ! -f /home/scape/public/fits-web-2005/$I ]; then cp $I /home/scape/public/fits-web-2005/; fi; done)
(cd /home/scape/working/bjarne-fits-tests/2006-output; ls | grep tgz | while read I; do if [ ! -f /home/scape/public/fits-web-2006/$I ]; then cp $I /home/scape/public/fits-web-2006/; fi; done)
(cd /home/scape/working/bjarne-fits-tests/2007-output; ls | grep tgz | while read I; do if [ ! -f /home/scape/public/fits-web-2007/$I ]; then cp $I /home/scape/public/fits-web-2007/; fi; done)
(cd /home/scape/working/bjarne-fits-tests/2008-output; ls | grep tgz | while read I; do if [ ! -f /home/scape/public/fits-web-2008/$I ]; then cp $I /home/scape/public/fits-web-2008/; fi; done)
(cd /home/scape/working/bjarne-fits-tests/2009-output; ls | grep tgz | while read I; do if [ ! -f /home/scape/public/fits-web-2009/$I ]; then cp $I /home/scape/public/fits-web-2009/; fi; done)
(cd /home/scape/working/bjarne-fits-tests/2010-output; ls | grep tgz | while read I; do if [ ! -f /home/scape/public/fits-web-2010/$I ]; then cp $I /home/scape/public/fits-web-2010/; fi; done)
# generate filelists on webserver
(ls /home/scape/working/bjarne-fits-tests/2011-output |grep tgz > /home/scape/public/fits-web-2011/filenames)
#(ls /home/scape/working/bjarne-fits-tests/2005-output |grep tgz > /home/scape/public/fits-web-2005/filenames)
(ls /home/scape/working/bjarne-fits-tests/2006-output |grep tgz > /home/scape/public/fits-web-2006/filenames)
(ls /home/scape/working/bjarne-fits-tests/2007-output |grep tgz > /home/scape/public/fits-web-2007/filenames)
(ls /home/scape/working/bjarne-fits-tests/2008-output |grep tgz > /home/scape/public/fits-web-2008/filenames)
(ls /home/scape/working/bjarne-fits-tests/2009-output |grep tgz > /home/scape/public/fits-web-2009/filenames)
(ls /home/scape/working/bjarne-fits-tests/2010-output |grep tgz > /home/scape/public/fits-web-2010/filenames)
# sum up results
(cd /home/scape/working/bjarne-fits-tests/2011-output; ./processed.sh > /home/scape/public/fits-web-2011/README)
#(cd /home/scape/working/bjarne-fits-tests/2005-output; ./processed.sh > /home/scape/public/fits-web-2005/README)
(cd /home/scape/working/bjarne-fits-tests/2006-output; ./processed.sh > /home/scape/public/fits-web-2006/README)
(cd /home/scape/working/bjarne-fits-tests/2007-output; ./processed.sh > /home/scape/public/fits-web-2007/README)
(cd /home/scape/working/bjarne-fits-tests/2008-output; ./processed.sh > /home/scape/public/fits-web-2008/README)
(cd /home/scape/working/bjarne-fits-tests/2009-output; ./processed.sh > /home/scape/public/fits-web-2009/README)
(cd /home/scape/working/bjarne-fits-tests/2010-output; ./processed.sh > /home/scape/public/fits-web-2010/README)

