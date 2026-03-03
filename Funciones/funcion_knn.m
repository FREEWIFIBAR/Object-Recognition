function YTest = funcion_knn (XTest, XTrain, YTrain, k)

    numTest = size(XTest, 1);
    YTest = zeros(numTest, 1);

    for i = 1:numTest
        % 1.- Calcular distancias euclideas
        dif = XTrain - repmat(XTest(i, :), size(XTrain, 1), 1);
        distancias = sqrt(sum(dif.^2, 2));

        % 2.- Localizar las k instancias mas cercanas
        [~, indicesOrdenados] = sort(distancias);
        kIndices = indicesOrdenados(1:k);

        % 3.- Obtener clases de los k vecinos mas cercanos
        clasesVecinas = YTrain(kIndices);

        % 4.- Contar frecuencia de cada clase
        clasesUnicas = unique(clasesVecinas);
        cuentaClases = zeros(length(clasesUnicas), 1);
        for j = 1:length(clasesUnicas)
            cuentaClases(j) = sum(clasesVecinas == clasesUnicas(j));
        end

        % 5.- Determinar la clase con mayor frecuencia
        maxFrecuencia = max(cuentaClases);
        clasesMasFrecuentes = clasesUnicas(cuentaClases == maxFrecuencia);

        if isscalar(clasesMasFrecuentes)
            YTest(i) = clasesMasFrecuentes;
        else
            for j = 1:k
                if ismember(YTrain(kIndices(j)), clasesMasFrecuentes)
                    YTest(i) = YTrain(kIndices(j));
                    break;
                end
            end
        end
    end

end