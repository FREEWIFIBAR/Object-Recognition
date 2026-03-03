function [Y_QDA, d] = funcion_aplica_QDA (X, vectorMedias, matricesCovarianzas, probabilidadPriori, valoresClases)

    [numInstancias, ~] = size(X);
    numClases = length(valoresClases);

    d = zeros(numInstancias, numClases);

    for k = 1:numClases
        mu_k = vectorMedias(:, k);
        sigma_k = matricesCovarianzas(:, :, k);

        for i = 1:numInstancias
            x = X(i, :)';
            d(i, k) = -0.5 * (x - mu_k)' * pinv(sigma_k) * (x - mu_k) - 0.5 * log(max(det(sigma_k), eps)) + log(probabilidadPriori(k));
        end
    end

    [~, indicesMax] = max(d, [], 2);
    Y_QDA = valoresClases(indicesMax);

end