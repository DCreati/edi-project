function out = compute_hu_moments(image)

    % Si calcola il momento centrale normalizzato
    n_02 = normalized_central_moment(image, 0, 2);
    n_03 = normalized_central_moment(image, 0, 3);
    n_12 = normalized_central_moment(image, 1, 2);
    n_11 = normalized_central_moment(image, 1, 1);
    n_20 = normalized_central_moment(image, 2, 0);
    n_21 = normalized_central_moment(image, 2, 1);    
    n_30 = normalized_central_moment(image, 3, 0);
    
    % I momenti di Hu sono invarianti rispetto alla traslazione, scala e rotazione che possono essere
    % costruiti per trarre informazioni da una regione. In particolare, il primo è analogo al momento
    % dell'inerzia attorno al centroide dell'immagine, dove l'intensità dei pixel è analoga alla
    % densità effettiva. I primi sei sono simmetrici rispetto alla riflessione, se ne useranno due
    hu(1) = n_20 + n_02; 
    hu(2) = (n_20 - n_02)^2 + (2 * n_11^2);
    hu(3) = ((n_30 - 3 * n_12)^2 + (3 * n_21 - n_03)^2);
    hu(4) = ((n_30 + n_12)^2 + (n_21 + n_03)^2);
    hu(5) = (n_30 - 3 * n_12) * (n_30 + n_12) * ((n_30 + n_12)^2 - 3 * (n_21 + n_03)^2) + (3 * n_21 - n_03) * (n_21 + n_03) * (3 * (n_30 + n_12)^2 - (n_21 + n_03)^2);
    hu(6) = ((n_20 - n_02) * ((n_30 + n_12)^2 - ((n_21 - n_03)^2)) + 4 * n_11 * (n_30 + n_12) * (n_21 + n_03));
    hu(7) = ((3 * n_21 - n_03) * (n_30 + n_12) * ((n_30 + n_12)^2 - 3 * (n_21 + n_03)^2) + (n_30 - 3 * n_12) * (n_21 + n_03) * (3 * (n_30 + n_12)^2 - (n_21 + n_03)^2));

    out = hu;
    
end

function out = normalized_central_moment(image, p, q)
    
    % Il calcolo prevede il rispettivo calcolo del momento centrale e di quello semplice
    u_pq = central_moment(image, p, q);
    u_00 = simple_moment(image, 0, 0);

    ncm = u_pq / (u_00^(1 + ((p + q) / 2)));
    out = ncm;

end

function out = central_moment(image, p, q)
    
    [rows, columns] = size(image);
    
    % Si calcola il momento centrale u_pq dell'immagine attraverso i seguenti momenti semplici
    u_00 = simple_moment(image, 0, 0);
    x_m = simple_moment(image, 1, 0) / u_00;
    y_m = simple_moment(image, 0, 1) / u_00;

    cm = 0;
    for x = 1 : rows
        for y = 1 : columns
            cm = cm + ((x - x_m)^p * (y - y_m)^q * image(x, y));
        end
    end

    out = cm;

end

function out = simple_moment(image, i, j)
    
    [rows, columns] = size(image);

    % Si ritorna il momento semplice Mij dell'immagine
    sm = 0;
    for x = 1 : rows
        for y = 1 : columns
            sm = sm + (x^i * y^j * image(x, y));
        end
    end

    out = sm;

end