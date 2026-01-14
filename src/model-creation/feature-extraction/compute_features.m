function out = compute_features(lbl)

    % Tramite la misurazione di proprietà di una regione, si ottiene la solidità e l'eccentricità
    % oltre che alla proporzione fra gli assi e il centroide
    props = regionprops(lbl, 'all');
    feature.ratio = double(props(1).MajorAxisLength / props(1).MinorAxisLength);
    feature.solidity = props.Solidity;
    feature.eccentricity = props.Eccentricity;
    feature.centroid = compute_centroid(lbl);

    % Tramite il calcolo dei momenti di Hu, si ottengono i primi due momenti
    hu = compute_hu_moments(lbl);
    feature.hu_1 = hu(1);
    feature.hu_2 = hu(2);

    % Si calcolano infine le proiezioni orizzontali
    proj = compute_projection(lbl);
    feature.proj_mean_horizontal = double(mean(proj.h ./ max(proj.h)));
    feature.proj_std_horizontal = double(std(proj.h ./ max(proj.h)));

    out = feature;
    
end