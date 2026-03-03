function [espacioCCas, Acc] = funcion_seleccion_vector_ccas_busqueda_hacia_delante_hold_out (XTrain, YTrain, XVal, YVal, dim, espacioCcasIni, AccIni, clasificador)

    espacioCCas = espacioCcasIni;
    Acc = AccIni;

    descriptores = 1:22;

    while numel(espacioCCas) < dim
        candidatos = setdiff(descriptores, espacioCCas);
        mejorAcc = -inf;
        mejorDescriptor = 0;
    
        for des = candidatos
            idxActual = [espacioCCas, des];
    
            switch clasificador
                case 'KNN'
                    Y_KNN = funcion_knn(XVal(:, idxActual), XTrain(:, idxActual), YTrain, 7);
                    acc = mean(Y_KNN == YVal);
                case 'NBG'
                    [medias, desviaciones, probabilidadPriori] = funcion_ajusta_NBG(XTrain(:, idxActual), YTrain);
                    [Y_NBG, ~] = funcion_aplica_NBG(XVal(:, idxActual), medias, desviaciones, probabilidadPriori, unique(YTrain));
                    acc = mean(Y_NBG == YVal);
                case 'LDA'
                    [vectorMedias, matrizCovarianza, probabilidadPriori] = funcion_ajusta_LDA(XTrain(:, idxActual), YTrain);
                    [Y_LDA, ~] = funcion_aplica_LDA(XVal(:, idxActual), vectorMedias, matrizCovarianza, probabilidadPriori, unique(YTrain));
                    acc = mean(Y_LDA == YVal);
                case 'QDA'
                    [vectorMedias, matricesCovarianzas, probabilidadPriori] = funcion_ajusta_QDA(XTrain(:, idxActual), YTrain);
                    [Y_QDA, ~] = funcion_aplica_QDA(XVal(:, idxActual), vectorMedias, matricesCovarianzas, probabilidadPriori, unique(YTrain));
                    acc = mean(Y_QDA == YVal);
            end
    
            if acc > mejorAcc
                mejorAcc = acc;
                mejorDescriptor = des;
            end
        end
    
        espacioCCas(end + 1) = mejorDescriptor;
        Acc = mejorAcc;
    end

end