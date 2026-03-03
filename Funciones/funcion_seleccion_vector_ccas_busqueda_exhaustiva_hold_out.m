function [espacioCCas, Acc] = funcion_seleccion_vector_ccas_busqueda_exhaustiva_hold_out (XTrain, YTrain, XVal, YVal, dim, clasificador)

    numDescriptores = 22;
    mejorAcc = -inf;
    espacioCCas = [];
    
    comb = combnk(1:numDescriptores, dim);

    for i = 1:size(comb, 1)
        idx = comb(i, :);
    
        switch clasificador
            case 'KNN'
                Y_KNN = funcion_knn(XVal(:, idx), XTrain(:, idx), YTrain, 7);
                acc = mean(Y_KNN == YVal);
            case 'NBG'
                [medias, desviaciones, probabilidadPriori] = funcion_ajusta_NBG(XTrain(:, idx), YTrain);
                [Y_NBG, ~] = funcion_aplica_NBG(XVal(:, idx), medias, desviaciones, probabilidadPriori, unique(YTrain));
                acc = mean(Y_NBG == YVal);
            case 'LDA'
                [vectorMedias, matrizCovarianza, probabilidadPriori] = funcion_ajusta_LDA(XTrain(:, idx), YTrain);
                [Y_LDA, ~] = funcion_aplica_LDA(XVal(:, idx), vectorMedias, matrizCovarianza, probabilidadPriori, unique(YTrain));
                acc = mean(Y_LDA == YVal);
            case 'QDA'
                [vectorMedias, matricesCovarianzas, probabilidadPriori] = funcion_ajusta_QDA(XTrain(:, idx), YTrain);
                [Y_QDA, ~] = funcion_aplica_QDA(XVal(:, idx), vectorMedias, matricesCovarianzas, probabilidadPriori, unique(YTrain));
                acc = mean(Y_QDA == YVal);
        end

        if acc > mejorAcc
            mejorAcc = acc;
            espacioCCas = idx;
        end
    end

    Acc = mejorAcc;
    
end