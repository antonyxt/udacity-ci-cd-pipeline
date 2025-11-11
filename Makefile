# Variables
VENV = ~/.udacity-devops
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip

# Create virtual environment
setup:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

# Install/upgrade dependencies (uses venv)
install:
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

# Run tests
test:
	$(PYTHON) -m pytest -vv --cov=.

# Lint Python and Docker code
lint:
	#$(VENV)/bin/hadolint Dockerfile
	$(VENV)/bin/pylint --disable=R,C,W1203,W0702 app.py

# Run all tasks in order
all: install lint test
