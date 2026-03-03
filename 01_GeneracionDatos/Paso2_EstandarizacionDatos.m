load('./DatosGenerados/conjunto_datos.mat');

medias = mean(X(:, 1:22));
desviaciones = std(X(:, 1:22));

Z = X;

Z(:, 1:22) = (X(:, 1:22) - medias) ./ desviaciones;

X = Z;

save('./DatosGenerados/conjunto_datos_estandarizados.mat', 'X', 'Y', 'nombresProblema');
save('./DatosGenerados/datos_estandarizacion.mat', 'medias', 'desviaciones');