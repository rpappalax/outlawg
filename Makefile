VENVDIR = ./venv
BINDIR = $(VENVDIR)/bin
PYTHON = $(BINDIR)/python
PIP = $(BINDIR)/pip
INSTALL = $(PIP) install

.PHONY: all 
all:	build

.PHONY: build
build: $(VENVDIR)/COMPLETE
$(VENVDIR)/COMPLETE: requirements.txt
	virtualenv --no-site-packages --python=`which python` \
	    --distribute $(VENVDIR)
	$(INSTALL) -r ./requirements.txt
	$(PYTHON) ./setup.py develop

.PHONY: clean
clean:
	rm -rf build
	rm -rf *egg*
	rm -rf dist
	rm -rf .tox
	rm -rf venv/
	rm -rf __pycache__/ 
	find . -name '*.pyc' -exec rm -f {} +

# for development branch only

.PHONY: pypi ## Create dist, egg dirs, upload package to pypi
pypi:
	$(PYTHON) setup.py sdist upload -r pypi
	$(PYTHON) setup.py bdist_egg upload -r pypi

.PHONY: testpypi ## Create dist, egg dirs, upload package to testpypi
testpypi:
	# Create dist, egg dirs, upload package to testpypi
	$(PYTHON) setup.py sdist upload -r testpypi
	# creating 'dist/dummy_project-0.0.3-py2.7.egg' and
	#  adding 'build/bdist.macosx-10.9-intel/egg' to it
	$(PYTHON) setup.py bdist_egg upload -r testpypi

.PHONY: pypi-register ## Register the project to Python package index
pypi-register:
	$(PYTHON) setup.py register -r pypi

.PHONY: testpypi-register ## Register this project to Test Python package index
testpypi-register:
	$(PYTHON) setup.py register -r testpypi
