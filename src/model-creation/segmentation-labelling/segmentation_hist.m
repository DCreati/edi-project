function out = segmentation_hist(h)

    % Poiché la "zona" (colonna) più alta nell'istogramma rappresenta la parte di sfondo (che la hue tende ad unificare),
    % si considerano allora i valori alla sua base per segmentare. Si calcola quindi l'istogramma, insieme al suo picco massimo
    hist = imhist(h);
    [m, mi] = max(hist);

    % Si stabilisce una soglia arbitraria sotto cui considerare un'intensità come fine o inizio della mode
    delta = 0.003;

    % Si trova il valore di inizio salita della mode
    lower_i = 0;
    for j = mi:-1:1
        current = hist(j);
        if current <= (m * delta)
            lower_i = j;
            break
        end
    end

    % Si trova il valore di fine discesa della mode
    upper_i = 0;
    for j = mi:255
        current = hist(j);
        if current <= (m * delta)
            upper_i = j;
            break
        end
    end
    
    % Si segmenta mettendo ad 1 tutto ciò che non fa parte della mode
    bw = (h > 0 & h < (lower_i / 256)) | (h > (upper_i / 256) & h < 256);

    out = bw;
end