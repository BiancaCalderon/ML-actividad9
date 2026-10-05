PYTHON ?= python
CLI ?= transactions-pipeline
CSV ?= transactions.csv
DATA_DIR ?= data
MODEL ?= models/model.joblib
LOG ?= logs/training.log

.PHONY: help install extract clean train run
help:
	@echo 'make install | make run CSV=/ruta/transacciones.csv'
install:
	$(PYTHON) -m pip install -e .
extract:
	$(CLI) extract "$(CSV)" --out "$(DATA_DIR)/extracted.csv"
clean: extract
	$(CLI) clean --input "$(DATA_DIR)/extracted.csv" --out "$(DATA_DIR)/cleaned.csv" --features-out "$(DATA_DIR)/features.json"
train: clean
	$(CLI) train --input "$(DATA_DIR)/cleaned.csv" --features "$(DATA_DIR)/features.json" --model-out "$(MODEL)" --log-file "$(LOG)"
run:
	$(CLI) run "$(CSV)" --work-dir "$(DATA_DIR)" --model-out "$(MODEL)" --log-file "$(LOG)"
