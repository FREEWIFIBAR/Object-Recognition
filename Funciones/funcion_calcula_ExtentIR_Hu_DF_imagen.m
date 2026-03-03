function X = funcion_calcula_ExtentIR_Hu_DF_imagen(Ietiq, N)

    X = zeros(N, 18);

    for i = 1:N
        Ib = Ietiq == i;

        % Extension_BBox(Invariante Rotacion): 5
        X(i, 1) = Funcion_Calcula_Extent_Inv_Rot(Ib);

        % Hu1-Hu7: 6-12
        X(i, 2:8) = Funcion_Calcula_Hu(Ib);

        % DF1-DF10: 13-22
        X(i, 9:18) = Funcion_Calcula_DF(Ib, 10);
    end

end