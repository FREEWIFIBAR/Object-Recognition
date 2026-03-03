function [Y_NBG, d] = funcion_aplica_NBG (X, medias, desviaciones, probabilidadPriori, valoresClases)

    [numInstancias, ~] = size(X);
    numClases = length(valoresClases);

    d = zeros(numInstancias, numClases);

    for k = 1:numClases
        media_k = medias(:, k);
        desv_k = desviaciones(:, k);
        desv_k(desv_k == 0) = eps;

        for i = 1:numInstancias
            x_i = X(i, :)';
            logVerosimilitud = -0.5 * sum(log(2*pi*desv_k.^2) + ((x_i - media_k).^2) ./ (desv_k.^2));
            d(i, k) = log(probabilidadPriori(k)) + logVerosimilitud;
        end
    end

    [~, indicesMax] = max(d, [], 2);
    Y_NBG = valoresClases(indicesMax);

end