function [images,labels] = readlists(path_im, path_lb)
  
    % Si apre la lista delle immagini
    f = fopen(path_im);
    z = textscan(f, '%s');
    fclose(f);
    images = z{:};

    % Si apre la lista delle label
    f = fopen(path_lb);
    l = textscan(f,'%s');
    labels = l{:};
    fclose(f);
    
end