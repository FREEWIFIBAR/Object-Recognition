function [Y_LDA, d] = funcion_aplica_LDA (X, vectorMedias, matrizCovarianza, probabilidadPriori, valoresClases)

    [numInstancias, ~] = size(X);
    numClases = length(valoresClases);

    d = zeros(numInstancias, numClases);

    for k = 1:numClases
        mu_k = vectorMedias(:, k);

        for i = 1:numInstancias
            x = X(i, :)';
            d(i, k) = -0.5 * (x - mu_k)' * pinv(matrizCovarianza) * (x - mu_k) + log(probabilidadPriori(k));
        end
    end

    [~, indicesMax] = max(d, [], 2);
    Y_LDA = valoresClases(indicesMax);

end