function out = preprocessing(img, type)

    % Si usa una funzione di resize per avere una dimensione di un terzo dell'immagine
    img = imresize(img, 0.3);

    % Si è interessati ad un'immagine in diversi formati
    if strcmp(type,'bw')
        out = im2gray(img);
    end
    if strcmp(type,'hue')

        % Si usa un filtro mediano per migliorare l'immagine da segmentare
        n = 10;
        med(:,:,1) = medfilt2(img(:,:,1), [n, n]);
        med(:,:,2) = medfilt2(img(:,:,2), [n, n]);
        med(:,:,3) = medfilt2(img(:,:,3), [n, n]);

        out = rgb2hsv(med);
        out = out(:,:,1);
    end
    if strcmp(type,'sat')
        out = rgb2hsv(img);
        out = out(:,:,2);
    end
    if strcmp(type,'val')
        out = rgb2hsv(img);
        out = out(:,:,3);
    end
end