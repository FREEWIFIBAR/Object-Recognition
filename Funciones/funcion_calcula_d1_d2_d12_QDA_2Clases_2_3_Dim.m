function [d1, d2, d12] = funcion_calcula_d1_d2_d12_QDA_2Clases_2_3_Dim (X, Y)

    valoresClases = unique(Y);
    numDatos = size(X, 1);
    dimension = size(X, 2);

    % Variables
    x1 = sym('x1', 'real');
    x2 = sym('x2', 'real');

    if dimension == 2
        Xs = [x1; x2];
    else
        x3 = sym('x3', 'real');
        Xs = [x1; x2; x3];
    end

    % Indices
    idx1 = Y == valoresClases(1);
    idx2 = Y == valoresClases(2);

    % Datos
    X1 = X(idx1, :);
    X2 = X(idx2, :);

    % Vectores de medias
    M1 = mean(X1)';
    M2 = mean(X2)';

    % Matrices de covarianza
    S1 = cov(X1);
    S2 = cov(X2);
    
    % Probabilidad a priori
    P1 = size(X1, 1) / numDatos;
    P2 = size(X2, 1) / numDatos;

    % Funciones de decision
    d1 = expand(-0.5 * (Xs - M1).' * pinv(S1) * (Xs - M1) - 0.5 * log(max(det(S1), eps)) + log(P1));
    d2 = expand(-0.5 * (Xs - M2).' * pinv(S2) * (Xs - M2) - 0.5 * log(max(det(S2), eps)) + log(P2));

    % Funcion discriminante
    d12 = expand(d1 - d2);

    if dimension == 2
        fimplicit(d12);
    else
        fimplicit3(d12);
    end
    
end