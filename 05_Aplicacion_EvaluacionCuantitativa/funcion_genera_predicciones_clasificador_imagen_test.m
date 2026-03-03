function [salidasReales, predicciones] = funcion_genera_predicciones_clasificador_imagen_test (numeroImagenTest, clasificador)
    
    addpath('../Funciones');

    % 1.- LEER IMAGEN DE TEST Y PREDICCIONES REALES
    rutaImagenes = '../ImagenesPractica/Test/';

    nombreImagen = sprintf('Test%02d.bmp', numeroImagenTest);
    nombreYReal = sprintf('YTest%02d.mat', numeroImagenTest);

    I = imread([rutaImagenes nombreImagen]);
    load([rutaImagenes nombreYReal]);
    
    % 2.- GENERAR EL CONJUNTO DE LOS 23 DESCRIPTORES
    [Ietiq, N] = funcion_segmenta_imagen(I);
    X = funcion_calcula_descriptores_imagen(Ietiq, N);

    % 3.- ESTANDARIZAR DATOS
    load('../01_GeneracionDatos/DatosGenerados/datos_estandarizacion.mat', 'medias', 'desviaciones');
    X(:, 1:22) = (X(:, 1:22) - medias) ./ desviaciones;
    
    % 4 y 5.- CARGAR INFORMACION Y APLICAR CLASIFICADOR
    valoresClases = (1:6)';

    switch clasificador
        case 'KNN'
            load('../03_EntrenamientoClasificadores/DatosGenerados/Entrenamiento_KNN.mat', 'XTrain', 'YTrain', 'espacioCCas', 'K');
            predicciones = funcion_knn(X(:, espacioCCas), XTrain, YTrain, K);
        case 'NBG'
            load('../03_EntrenamientoClasificadores/DatosGenerados/Entrenamiento_NBG.mat', 'espacioCCas', 'medias', 'desviaciones', 'probabilidadPriori');
            [predicciones, ~] = funcion_aplica_NBG(X(:, espacioCCas), medias, desviaciones, probabilidadPriori, valoresClases);
        case 'LDA'
            load('../03_EntrenamientoClasificadores/DatosGenerados/Entrenamiento_LDA.mat', 'espacioCCas', 'vectorMedias', 'matrizCovarianza', 'probabilidadPriori');
            [predicciones, ~] = funcion_aplica_LDA(X(:, espacioCCas), vectorMedias, matrizCovarianza, probabilidadPriori, valoresClases);
        case 'QDA'
            load('../03_EntrenamientoClasificadores/DatosGenerados/Entrenamiento_QDA.mat', 'espacioCCas', 'vectorMedias', 'matricesCovarianzas', 'probabilidadPriori');
            [predicciones, ~] = funcion_aplica_QDA(X(:, espacioCCas), vectorMedias, matricesCovarianzas, probabilidadPriori, valoresClases);
    end
    
    salidasReales = YTest;

end