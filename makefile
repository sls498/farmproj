FILES :=                              	  \
    .travis.yml                           \
    apiary.apib							  \
    IDB1.log                       	 	  \
    models.html                      	  \
    models.py                        	  \
    tests.py                        	  \
    UML.pdf

check:
	@not_found=0;                                 \
    for i in $(FILES);                            \
    do                                            \
        if [ -e $$i ];                            \
        then                                      \
            echo "$$i found";                     \
        else                                      \
            echo "$$i NOT FOUND";                 \
            not_found=`expr "$$not_found" + "1"`; \
        fi                                        \
    done;                                         \
    if [ $$not_found -ne 0 ];                     \
    then                                          \
        echo "$$not_found failures";              \
        exit 1;                                   \
    fi;                                           \
    echo "success";

clean:
	rm -f  .coverage
	rm -f  *.pyc
	rm -rf __pycache__

config:
	git config -l

scrub:
	make clean
	rm -f  IDB1.html
	rm -f  IDB1.log

status:
	make clean
	@echo
	git branch
	git remote -v
	git status

test: TestIDB1.tmp

netflix-tests:
	git clone https://github.com/dark-ritual/cs373-idb.git

models.html: models.py
	pydoc3 -w models

models.log:
	git log > models.log

TestIDB1.tmp: tests.py
	coverage3 run    --branch tests.py >  tests.tmp 2>&1
	coverage3 report -m --omit='/lusr/lib/python3.4/*'  >> tests.tmp
	cat tests.tmp