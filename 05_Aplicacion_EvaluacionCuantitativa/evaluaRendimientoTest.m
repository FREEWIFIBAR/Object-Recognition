tecnicasClasificacion = {'KNN', 'NBG', 'LDA', 'QDA'};
numClasificadores = length(tecnicasClasificacion);
numImagenesTest = 8;

YR = [];
YP = [];

for c = 1:numClasificadores
    clasificador = tecnicasClasificacion{c};
    salidasReales = [];
    predicciones = [];
    
    for i = 1:numImagenesTest
        [YR_imagen, YP_imagen] = funcion_genera_predicciones_clasificador_imagen_test(i, clasificador);
        
        if c == 1
            salidasReales = [salidasReales; YR_imagen];
        end

        predicciones = [predicciones; YP_imagen];
    end

    if c == 1
        YR = salidasReales;
    end

    YP(:, c) = predicciones;
end

save('./DatosGenerados/salidasReales_salidasPredichas.mat', 'YR', 'YP', 'tecnicasClasificacion');