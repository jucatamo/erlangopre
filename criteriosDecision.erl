-module(criteriosDecision).
-export[analizar/0].


%MODULO PARA CALCULAR UN VALOR SEGÚN EL CRITERIO DE ANALISIS DE DECISIÓN A UTILIZAR


analizar() ->
    receive 
    {ListaDecisiones, maximax} -> 
        NFilas = length(ListaDecisiones),   
        calcularMaximax({ListaDecisiones, 1}, NFilas, ['']),
        analizar();
    {ListaDecisiones, minimin} ->
        NFilas = length(ListaDecisiones), 
        calcularMinimin({ListaDecisiones, 1}, NFilas, ['']),
        analizar();    
    {stop} ->
        io:format("Deteniendo proceso...~n");
    Other ->
        io:format("Parametro desconocido: ~p~n", [Other]),
        analizar()
    end.

%CALCULO SEGÚN CRITERIO MAXIMAX (LA MEJOR DECISIÓN ENTRE LOS ESTADOS DE LA NATURALEZA DISPONIBLES)

calcularMaximax({ListaDecisiones, NFila}, NMaxFilas, ColumnaResultado) ->
case (NFila =< NMaxFilas) of
    true ->         
        Fila = lists:nth(NFila, ListaDecisiones),         
        %io:format("Valor Maximo:  "++io_lib:format("~.1f",[float(lists:max(Fila))])++"\n"),
        Resultado = lists:append(ColumnaResultado, io_lib:format("~.1f",[float(lists:max(Fila))])),
        calcularMaximax({ListaDecisiones, NFila+1}, NMaxFilas, Resultado);
    false ->     
        Resultado = lists:max(lists:delete('',ColumnaResultado)),
        Resultado,
    io:format("\n")
end.

%CALCULO SEGÚN CRITERIO MINIMIN (LA MEJOR DECISIÓN ENTRE LOS ESTADOS DE LA NATURALEZA DISPONIBLES)

calcularMinimin({ListaDecisiones, NFila}, NMaxFilas, ColumnaResultado) ->
case (NFila =< NMaxFilas) of    
    true ->       
        Fila = lists:nth(NFila, ListaDecisiones),         
        %io:format("Valor Minimo:  "++io_lib:format("~.1f",[float(lists:min(Fila))])++"\n"),
        Resultado = lists:append(ColumnaResultado, io_lib:format("~.1f",[float(lists:min(Fila))])),
        calcularMinimin({ListaDecisiones, NFila+1}, NMaxFilas, Resultado);
    false ->     
        Resultado = lists:min(lists:delete('',ColumnaResultado)),
        Resultado,
        io:format("\n")
end.

