function out = compute_projection(bw)
    
    % Si calcolano le proiezioni orizzontali e verticali dell'immagine tramite istogramma
    props = regionprops(bw, 'Orientation');
    horizontal = imrotate(bw, 180 - (props.Orientation));
    
    min_box = regionprops(horizontal, 'BoundingBox');
    object_crop = imcrop(horizontal, min_box(1).BoundingBox);

    verticalProfile = sum(object_crop, 2);
    horizontalProfile = sum(object_crop, 1);

    out.h = horizontalProfile;
    out.v = verticalProfile;

end