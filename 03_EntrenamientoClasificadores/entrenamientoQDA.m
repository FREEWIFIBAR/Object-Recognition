load('../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');
load('../02_SeleccionDescriptores/DatosGenerados/espacioCCas_QDA.mat');

XTrain = X(:, espacioCCas);
YTrain = Y;

addpath('../Funciones');

[vectorMedias, matricesCovarianzas, probabilidadPriori] = funcion_ajusta_QDA(XTrain, YTrain);

save('./DatosGenerados/entrenamiento_QDA.mat', 'espacioCCas', 'matricesCovarianzas', 'nombresProblema', 'probabilidadPriori', 'vectorMedias');