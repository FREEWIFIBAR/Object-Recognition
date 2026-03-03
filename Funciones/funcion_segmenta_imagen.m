function [Ietiq, N] = funcion_segmenta_imagen(I)

    % 1.- Binarizar
    Ibin = I > 255*graythresh(I);

    % 2.- Eliminar componentes ruidosas
    Ibin_sinRuido = bwareaopen(Ibin, 250);

    % 3.- Etiquetar
    [Ietiq, N] = bwlabel(Ibin_sinRuido);

end