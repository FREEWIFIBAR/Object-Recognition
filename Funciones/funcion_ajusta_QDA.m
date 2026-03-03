function [vectorMedias, matricesCovarianzas, probabilidadPriori] = funcion_ajusta_QDA (X, Y)

    clases = unique(Y);
    numClases = length(clases);
    [numInstancias, numVariables] = size(X);
    
    vectorMedias = zeros(numVariables, numClases);
    matricesCovarianzas = zeros(numVariables, numVariables, numClases);
    probabilidadPriori = zeros(1, numClases);
    
    for i = 1:numClases
        idxClase = Y == clases(i);
        X_clase = X(idxClase, :);

        vectorMedias(:, i) = mean(X_clase)';
        matricesCovarianzas(:, :, i) = cov(X_clase);
        probabilidadPriori(i) = size(X_clase, 1) / numInstancias;
    end

end