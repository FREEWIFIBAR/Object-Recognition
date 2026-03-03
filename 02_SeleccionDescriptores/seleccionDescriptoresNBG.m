load('../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');
load('./DatosGenerados/datosEntrenamientoValidacion.mat');

addpath("../Funciones");

[espacioCCas, Acc] = funcion_selecciona_predictores_hold_out(X1, Y1, X2, Y2, 3, 6, 'NBG');

numeroInstancias = size(X, 1);
Y_LOO = zeros(numeroInstancias, 1);

for i = 1:numeroInstancias
    Xi = X([1:i-1, i+1:end], :);
    Yi = Y([1:i-1, i+1:end], :);
    XTest = X(i, :);

    [medias, desviaciones, probabilidadPriori] = funcion_ajusta_NBG(Xi, Yi);
    [Y_LOO(i), ~] = funcion_aplica_NBG(XTest, medias, desviaciones, probabilidadPriori, unique(Yi));
end

AccLOO = mean(Y_LOO == Y);

save('./DatosGenerados/espacioCCas_NBG.mat', 'espacioCCas', 'AccLOO');