function funcion_representa_datos(X, Y, espacioCcas, nombresProblema)

    nombresDescriptores = nombresProblema.descriptores;
    nombresClases = nombresProblema.clases;
    simbolosClases = nombresProblema.simbolos;

    dim = length(espacioCcas);

    codClases = unique(Y);
    numClases = length(codClases);

    figure;
    hold on;

    for i = 1:numClases
        Xi = X(Y == codClases(i), espacioCcas);
        
        if dim == 2
            plot(Xi(:, 1), Xi(:, 2), simbolosClases{i});
        else
            plot3(Xi(:, 1), Xi(:, 2), Xi(:, 3), simbolosClases{i});
        end
    end

    xlabel(nombresDescriptores{espacioCcas(1)});
    ylabel(nombresDescriptores{espacioCcas(2)});

    if dim == 3
        zlabel(nombresDescriptores{espacioCcas(3)});
        view(3);
    end

    legend(nombresClases);
    grid on;
    title('Representación de datos');
    hold off;

end