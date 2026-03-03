%% DIVISIÓN DE SUBCONJUVaNTOS DE ENTRENAMIENTO Y VALIDACIÓN
% DE FORMA ESTRATIFICADA DE ACUERDO AL PORCENTAJE PASADO POR 
% PARÁMETRO DE ENTRADA

function [X1,Y1, X2, Y2] = ...
    funcion_genera_division_estratificada_conjunto_X_Y(X,Y,porcentajeX1)

    X1 = []; Y1 = [];
    X2 = []; Y2 = [];
    porcentajeX1 = 0.01*porcentajeX1;
    valoresCodifClases = unique(Y);
    numClases = numel(valoresCodifClases);
    for i=1:numClases
        foI = Y == valoresCodifClases(i);
        Xi = X(foI,1:22); % Quitamos NumEuler
        Yi = Y(foI);
        numDatos_i = size(Xi,1);
        numDatosX1_i = round(porcentajeX1*numDatos_i);
        numerosMuestrasX1_i = randsample(numDatos_i,numDatosX1_i);
        numerosMuestrasX2_i = find(not(ismember(1:numDatos_i,numerosMuestrasX1_i)));
        % Subvonjunto 1
        X1 = [X1; Xi(numerosMuestrasX1_i,:)];
        Y1 = [Y1; Yi(numerosMuestrasX1_i)];
        % Subvonjunto 2
        X2 = [X2; Xi(numerosMuestrasX2_i,:)];
        Y2 = [Y2; Yi(numerosMuestrasX2_i)];
    end
