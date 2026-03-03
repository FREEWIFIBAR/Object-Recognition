load('./05_Aplicacion_EvaluacionCuantitativa/DatosGenerados/salidasReales_salidasPredichas.mat', 'YR', 'YP', 'tecnicasClasificacion');
AccTrainLOO = zeros(1, length(tecnicasClasificacion));

load('./02_SeleccionDescriptores/DatosGenerados/espacioCCas_KNN.mat', 'AccLOO');
AccTrainLOO(1) = AccLOO;

load('./02_SeleccionDescriptores/DatosGenerados/espacioCCas_NBG.mat', 'AccLOO');
AccTrainLOO(2) = AccLOO;

load('./02_SeleccionDescriptores/DatosGenerados/espacioCCas_LDA.mat', 'AccLOO');
AccTrainLOO(3) = AccLOO;

load('./02_SeleccionDescriptores/DatosGenerados/espacioCCas_QDA.mat', 'AccLOO');
AccTrainLOO(4) = AccLOO;

for i = 1:length(tecnicasClasificacion)
    AccTest(i) = mean(YP(:, i) == YR);
end

% Tabla de resultados Tasa de Acierto:Train mediante LOO y Test
datosAcc = [AccTrainLOO; AccTest];
T = array2table(datosAcc);
T.Properties.RowNames = {'Train LOO', 'Test'};
T.Properties.VariableNames = tecnicasClasificacion;
clc
disp("Datos de rendimiento - Acc");
disp(T);

load('./01_GeneracionDatos/DatosGenerados/conjunto_datos.mat', 'nombresProblema');
nombreClases = nombresProblema.clases;

for i=1:4
    YP_i = YP(:,i);
    cm = confusionmat(YR, YP_i);
    figure
    confChart = confusionchart(cm, nombreClases);
    confChart.XLabel = 'Clase Predicha';
    confChart.YLabel = 'Clase Real';
    confChart.Title = ['Matriz de Confusión - ' tecnicasClasificacion{i}];
    confChart.RowSummary = 'row-normalized';
    confChart.ColumnSummary = 'column-normalized';
end