rutaImagenes = '../ImagenesPractica/Entrenamiento/';
extension = '.bmp';

nombreClases = {'Arandela', 'Tuerca', 'AlcayataLisa', 'AlcayataRosca', 'TornilloRosca', 'TornilloCabHex'};

X = [];
Y = [];

addpath('../Funciones');

for i = 1:length(nombreClases)
    for j = 1:5
        nombreImagen = [nombreClases{i} num2str(j, '%02d') extension];
        I = imread([rutaImagenes nombreImagen]);
        
        [Ietiq, N] = funcion_segmenta_imagen(I);

        Ximagen = funcion_calcula_descriptores_imagen(Ietiq, N);

        Yimagen = i*ones(N, 1);

        X = [X; Ximagen];
        Y = [Y; Yimagen];
        
    end
end

nombreDescriptores{1} = 'Circularidad';
nombreDescriptores{2} = 'Excentricidad';
nombreDescriptores{3} = 'Solidez_CHull';
nombreDescriptores{4} = 'Extension_BBox';
nombreDescriptores{5} = 'Extension_Inv_Rot';
nombreDescriptores{6} = 'Hu1';
nombreDescriptores{7} = 'Hu2';
nombreDescriptores{8} = 'Hu3';
nombreDescriptores{9} = 'Hu4';
nombreDescriptores{10} = 'Hu5';
nombreDescriptores{11} = 'Hu6';
nombreDescriptores{12} = 'Hu7';
nombreDescriptores{13} = 'DF1';
nombreDescriptores{14} = 'DF2';
nombreDescriptores{15} = 'DF3';
nombreDescriptores{16} = 'DF4';
nombreDescriptores{17} = 'DF5';
nombreDescriptores{18} = 'DF6';
nombreDescriptores{19} = 'DF7';
nombreDescriptores{20} = 'DF8';
nombreDescriptores{21} = 'DF9';
nombreDescriptores{22} = 'DF10';
nombreDescriptores{23} = 'Numero_Euler';

simbolosClases{1} = '*r';
simbolosClases{2} = '*g';
simbolosClases{3} = '*b';
simbolosClases{4} = '*c';
simbolosClases{5} = '*m';
simbolosClases{6} = '*y';

nombresProblema = [];
nombresProblema.descriptores = nombreDescriptores;
nombresProblema.clases = nombreClases;
nombresProblema.simbolos = simbolosClases;

save('./DatosGenerados/conjunto_datos.mat', 'X', 'Y', 'nombresProblema');