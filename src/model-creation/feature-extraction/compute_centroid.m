function out = compute_centroid(bw)

    % Si calcolo il centroide solo se fa parte della componente connessa
    area = sum(sum(bw(:,:)));

    if area > 0
        props = regionprops(im2double(bw), 'centroid');

        x = floor(props.Centroid(1));
        y = floor(props.Centroid(2));

        if bw(y,x) > 0
            out = 1;
        else
            out = 0;
        end
    else
        out = 0;
    end

end