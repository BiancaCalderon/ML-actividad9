# transactions-pipeline

Pipeline de scikit-learn expuesto mediante el entrypoint `transactions-pipeline`.

## Instalar

Requiere Python 3.10 o superior. Desde esta carpeta, en un entorno virtual:

```bash
python -m pip install -e .
transactions-pipeline --help
```

## Ejecutar

```bash
transactions-pipeline run /ruta/transacciones.csv --log-file logs/training.log
# Alternativa:
python -m transactions_pipeline run /ruta/transacciones.csv
# Automatización (requiere Make):
make run CSV=/ruta/transacciones.csv
```

Se conservan los subcomandos `extract`, `clean` y `train`.

Consulta [ENTRYPOINTS.md](ENTRYPOINTS.md) para la investigación, respuestas a la consigna, comandos por gestor y explicación de la adaptación. Consulta [VALIDACION.md](VALIDACION.md) para las pruebas y sus límites. El dataset no está incluido.
