load('./DatosGenerados/conjunto_datos_estandarizados.mat');

numMuestras = size(X, 1);
numDescriptores = size(X, 2);

addpath('../Funciones');

for i = 1:2:numDescriptores - 1

    espacioCcas = [i i+1];
    funcion_representa_datos(X, Y, espacioCcas, nombresProblema);

end

codifClases = unique(Y);
numClases = length(codifClases);
nombreClases = nombresProblema.clases;
nombreDescriptores = nombresProblema.descriptores;

for j=1:numDescriptores

    % Valores máximo y mínimos para representar en la misma escala
    vMin = min(X(:,j));
    vMax = max(X(:,j));
 
    hFigure = figure; hold on
    bpFigure = figure; hold on
    
    for i=1:numClases
    
        Xij = X(Y==codifClases(i),j); % datos clase i del descriptor j
        
        figure(hFigure)
        subplot(numClases,1,i), hist(Xij),
        xlabel(nombreDescriptores{j})
        ylabel('Histograma')
        axis([ vMin vMax 0 numMuestras/4]) % inf escala automática eje y
        title(nombreClases{i})
        
        figure(bpFigure)
        subplot(1,numClases,i), boxplot(Xij)
        xlabel('Diagrama de Caja')
        ylabel(nombreDescriptores{j})
        axis([ 0 2 vMin vMax ])
        title(nombreClases{i})
    end
end