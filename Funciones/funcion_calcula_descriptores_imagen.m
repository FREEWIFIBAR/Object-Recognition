function XImagen = funcion_calcula_descriptores_imagen(Ietiq, N)

    XImagen = zeros(N, 23);

    stats = regionprops(Ietiq, 'Circularity', 'Eccentricity', 'Solidity', 'Extent', 'EulerNumber');

    % Circularity: 1
    XImagen(:, 1) = cat(1, stats.Circularity);
    
    % Excentricidad: 2
    XImagen(:, 2) = cat(1, stats.Eccentricity);

    % Solidez_CHull(Solidity): 3
    XImagen(:, 3) = cat(1, stats.Solidity);

    % Extension_BBox(Extent): 4
    XImagen(:, 4) = cat(1, stats.Extent);

    XImagen(:, 5:22) = funcion_calcula_ExtentIR_Hu_DF_imagen(Ietiq, N);

    % NumEuler: 23
    XImagen(:, 23) = cat(1, stats.EulerNumber);

end