% Cargar datos
rutaDatos = './Datos/datos2dim.mat';
load(rutaDatos);

addpath("./Funciones");

% NBG
[medias, desviaciones, probabilidadPriori] = funcion_ajusta_NBG(XTrain, YTrain);
[Y_NBG, d] = funcion_aplica_NBG(XTest, medias, desviaciones, probabilidadPriori, unique(YTrain));

aciertos_NBG = mean(Y_NBG == YTest);

% QDA
[vectorMedias, matricesCovarianzas, probabilidadPriori] = funcion_ajusta_QDA(XTrain, YTrain);
[Y_QDA, d] = funcion_aplica_QDA(XTest, vectorMedias, matricesCovarianzas, probabilidadPriori, unique(YTrain));
[d1, d2, d12] = funcion_calcula_d1_d2_d12_QDA_2Clases_2_3_Dim(XTrain, YTrain);

aciertos_QDA = mean(Y_QDA == YTest);

% LDA
[vectorMedias, matrizCovarianza, probabilidadPriori] = funcion_ajusta_LDA(XTrain, YTrain);
[Y_LDA, d] = funcion_aplica_LDA(XTest, vectorMedias, matrizCovarianza, probabilidadPriori, unique(YTrain));
[d1, d2, d12] = funcion_calcula_d1_d2_d12_LDA_2Clases_2_3_Dim(XTrain, YTrain);

aciertos_LDA = mean(Y_LDA == YTest);

% KNN
numDatos = size(XTrain, 1);
porcentajeTrain2 = 0.7;
numDatosTrain2 = round(porcentajeTrain2*numDatos);
numerosMuestrasTrain2 = randsample(numDatos, numDatosTrain2);
numerosMuestrasVal = find(not(ismember(1:numDatos, numerosMuestrasTrain2)));

% Conjunto de Train2
XTrain2 = XTrain(numerosMuestrasTrain2, :);
YTrain2 = YTrain(numerosMuestrasTrain2);

% Conjunto de Val
XVal = XTrain(numerosMuestrasVal, :);
YVal = YTrain(numerosMuestrasVal);

% Evaluar precision para k = 1 hasta kmax
kmax = 15;
tasas_acierto = zeros(kmax, 1);
for k = 1:kmax
    YPred = funcion_knn(XVal, XTrain2, YTrain2, k);
    tasa = sum(YPred == YVal) / length(YVal);
    tasas_acierto(k) = tasa;
end
    
% Obtener k que maximiza la tasa de acierto
[~, k_optimo] = max(tasas_acierto);

Y_KNN = funcion_knn(XTest, XTrain, YTrain, k_optimo);

aciertos_KNN = mean(Y_KNN == YTest);