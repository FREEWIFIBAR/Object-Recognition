function [medias, desviaciones, probabilidadPriori] = funcion_ajusta_NBG (X, Y)

    clases = unique(Y);
    numClases = length(clases);
    [numInstancias, numVariables] = size(X);

    medias = zeros(numVariables, numClases);
    desviaciones = zeros(numVariables, numClases);
    probabilidadPriori = zeros(1, numClases);

    for i = 1:numClases
        idxClase = Y == clases(i);
        X_clase = X(idxClase, :);

        medias(:, i) = mean(X_clase)';
        desviaciones(:, i) = std(X_clase, 0, 1)';
        probabilidadPriori(i) = size(X_clase, 1) / numInstancias;
    end

end