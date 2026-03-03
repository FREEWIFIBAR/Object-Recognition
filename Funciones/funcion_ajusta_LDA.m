function [vectorMedias, matrizCovarianza, probabilidadPriori] = funcion_ajusta_LDA (X, Y)

    clases = unique(Y);
    numClases = length(clases);
    [numInstancias, numVariables] = size(X);

    vectorMedias = zeros(numVariables, numClases);
    matrizCovarianza = zeros(numVariables);
    probabilidadPriori = zeros(1, numClases);
    
    for i = 1:numClases
        idxClase = Y == clases(i);
        X_clase = X(idxClase, :);

        vectorMedias(:, i) = mean(X_clase)';
        matrizCovarianza = matrizCovarianza + cov(X_clase) * (size(X_clase, 1) - 1);
        probabilidadPriori(i) = size(X_clase, 1) / numInstancias;
        
    end

    matrizCovarianza = matrizCovarianza / (numInstancias - numClases);

end