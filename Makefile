VENV := .venv
PY := $(VENV)/bin/python
PIP := $(PY) -m pip

.PHONY: install format lint clean all kernel

$(VENV)/bin/activate:
	python -m venv $(VENV)

install: $(VENV)/bin/activate
	$(PIP) install --upgrade pip setuptools wheel
	$(PIP) install -r requirements.txt

kernel:
	$(PY) -m ipykernel install --user --name project-venv --display-name "Project (.venv)"

format:
	$(PY) -m black .

lint:
	$(PY) -m flake8 .

clean:
	rm -rf __pycache__ .pytest_cache .coverage .ipynb_checkpoints

all: install format lint

