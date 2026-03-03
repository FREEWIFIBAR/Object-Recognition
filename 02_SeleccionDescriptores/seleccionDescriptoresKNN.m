load('../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');

addpath("../Funciones");

[X1, Y1, X2, Y2] = funcion_genera_division_estratificada_conjunto_X_Y(X, Y, 70);

[espacioCCas, Acc] = funcion_selecciona_predictores_hold_out(X1, Y1, X2, Y2, 3, 6, 'KNN');

numeroInstancias = size(X, 1);
Y_LOO = zeros(numeroInstancias, 1);

kmax = 15;
tasas_acierto = zeros(kmax, 1);

for k = 1:kmax
    aciertos = 0;
    for i = 1:numeroInstancias
        Xi = X([1:i-1, i+1:end], :);
        Yi = Y([1:i-1, i+1:end], :);
        XTest = X(i, :);
        YReal = Y(i);

        YPred = funcion_knn(XTest, Xi, Yi, k);

        if YPred == YReal
            aciertos = aciertos + 1;
        end
    end

    tasas_acierto(k) = aciertos / numeroInstancias;
end

[~, k_optimo] = max(tasas_acierto);

for i = 1:numeroInstancias
    Xi = X([1:i-1, i+1:end], :);
    Yi = Y([1:i-1, i+1:end], :);
    XTest = X(i, :);

    Y_LOO(i) = funcion_knn(XTest, Xi, Yi, k_optimo);
end

AccLOO = mean(Y_LOO == Y);

K = k_optimo;

save('./DatosGenerados/datosEntrenamientoValidacion.mat', 'X1', 'Y1', 'X2', 'Y2');
save('./DatosGenerados/espacioCCas_KNN.mat', 'espacioCCas', 'AccLOO', 'K');