# Validación realizada

- Instalación editable con setuptools en un entorno virtual: exitosa.
- Metadatos instalados: grupo `console_scripts`, nombre `transactions-pipeline`, referencia `transactions_pipeline.cli:main`; función cargable verificada con `importlib.metadata`.
- `transactions-pipeline --help`: muestra `extract`, `clean`, `train` y `run`.
- `python -m transactions_pipeline --help`: exitoso.
- Comando desconocido: salida 2 de argparse, como corresponde.
- `transactions-pipeline run` con un CSV sintético de 120 registros: extracción, limpieza y búsqueda completa de hiperparámetros ejecutadas; modelo y log generados; salida 0.
- Modelo joblib recargado: genera 120 predicciones para 120 registros.
- `make -n train`: verifica el orden de recetas extract → clean → train; esta comprobación es una simulación, no una segunda ejecución del entrenamiento mediante Make.

## Entorno y alcance

La instalación de prueba empleó `--no-deps --no-build-isolation` y reutilizó las librerías preinstaladas: Python 3.12, scikit-learn 1.8.0, pandas 2.2.3, NumPy 2.3.5, SciPy 1.17.0 y joblib 1.5.3. No se verificó la instalación de las versiones exactas declaradas en requirements.txt/pyproject.toml. Se conservaron las versiones del proyecto original.

Scikit-learn 1.8.0 emitió advertencias de deprecación para `penalty` de LogisticRegression durante la ejecución del código heredado. El entrenamiento terminó correctamente. La adaptación no cambia la grilla de modelos.

El CSV sintético solo comprueba la ejecución y persistencia del flujo: no mide utilidad ni precisión con transacciones reales. No se validaron ejecuciones con uv, Poetry o Conda; sus ejemplos se basan en documentación oficial. Los datos temporales, modelos de prueba y entornos virtuales no forman parte del ZIP entregado.
