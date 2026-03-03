load('../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');
load('../02_SeleccionDescriptores/DatosGenerados/espacioCCas_LDA.mat');

XTrain = X(:, espacioCCas);
YTrain = Y;

addpath('../Funciones');

[vectorMedias, matrizCovarianza, probabilidadPriori] = funcion_ajusta_LDA(XTrain, YTrain);

save('./DatosGenerados/entrenamiento_LDA.mat', 'espacioCCas', 'matrizCovarianza', 'nombresProblema', 'probabilidadPriori', 'vectorMedias');