load('../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');
load('../02_SeleccionDescriptores/DatosGenerados/espacioCCas_NBG.mat');

XTrain = X(:, espacioCCas);
YTrain = Y;

addpath('../Funciones');

[medias, desviaciones, probabilidadPriori] = funcion_ajusta_NBG(XTrain, YTrain);

save('./DatosGenerados/entrenamiento_NBG.mat', 'desviaciones', 'espacioCCas', 'medias', 'nombresProblema', 'probabilidadPriori');