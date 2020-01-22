# Erlangopre

Erlangopre es un módulo con funciones para la resolución de problemas de teoría de decisión (Investigación de operaciones).

La intención es ir añadiendo otras funciones como las proyecciones de cadenas de markov, o teoría de colas.

## Instalación

Se puede copiar el repositorio, o simplemente descargar el archivo .erl correspondiente y compilarlo.

```bash

git clone https://github.com/jucatamo/erlangopre.git

```
## Uso
Este módulo esta configurado para ser utilizado con el modelo del actor, para lo cual, se utiliza a travez de la creación de un proceso de la siguiente forma:
```erlang

Pid = spawn(fun criteriosDecision:analizar/0).

Pid ! {[matriz de elementos], criterio}.
```
En donde matriz equivale a una lista con la estructura [[1,2,3], [4,5,6]] dependiendo de la tabla con la información
de las decisiones y los estados de la naturaleza pertinentes.

Para el parametro criterio, se debe utilizar uno de los siguientes atoms

- maximax
- minimin

## Contribuciones
El objetivo principal de estos modulos es el de aprender a utilizar el lenguaje, conforme mayores conocimientos sean adquiridos, se irá actualizando para reflejar mejores practicas y estructura de código. Teniendo en cuenta lo anterior, no se aceptarán contribuciones por el momento.
## Licencia 
GNU 3 - General Public License
