function Extent = Funcion_Calcula_Extent_Inv_Rot(Matriz_Binaria)

    Ib_centrada = Funcion_Centra_Objeto(Matriz_Binaria);

    max_extent = 0;

    for angulo = 0:5:355
        Ib_rotada = imrotate(Ib_centrada, angulo);
        stats = regionprops(Ib_rotada, 'Area', 'BoundingBox');

        area_objeto = stats(1).Area;

        bbox = stats(1).BoundingBox;
        area_bbox = bbox(3) * bbox(4);

        extent_actual = area_objeto / area_bbox;

        if extent_actual > max_extent
            max_extent = extent_actual;
        end
    end

    Extent = max_extent;

end