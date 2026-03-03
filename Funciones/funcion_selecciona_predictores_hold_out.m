function [espacioCCas, Acc] = funcion_selecciona_predictores_hold_out(XTrain, YTrain, XVal, YVal, dimIni, dim, clasificador)

    [espacioCCasIni, AccIni] = funcion_seleccion_vector_ccas_busqueda_exhaustiva_hold_out(XTrain, YTrain, XVal, YVal, dimIni, clasificador);

    [espacioCCas, Acc] = funcion_seleccion_vector_ccas_busqueda_hacia_delante_hold_out (XTrain, YTrain, XVal, YVal, dim, espacioCCasIni, AccIni, clasificador);

end