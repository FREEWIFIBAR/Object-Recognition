load('../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');
load('../02_SeleccionDescriptores/DatosGenerados/espacioCCas_KNN.mat');

XTrain = X(:, espacioCCas);
YTrain = Y;

save('./DatosGenerados/entrenamiento_KNN.mat', 'espacioCCas', 'K', 'nombresProblema', 'XTrain', 'YTrain');