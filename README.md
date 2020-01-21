Este módulo esta configurado para ser utilizado con el modelo del actor, para lo cual, se utiliza a travez de 
la creación de un proceso de la siguiente forma:

Pid = spawn(fun criteriosDecision:analizar/0).

Pid ! {[matriz de elementos], criterio}.

En donde matriz equivale a una lista con la estructura [[1,2,3], [4,5,6]] dependiendo de la tabla con la información
de las decisiones y los estados de la naturaleza pertinentes.

Para el parametro criterio, se debe utilizar uno de los siguientes atoms

-maximax
-minimin


