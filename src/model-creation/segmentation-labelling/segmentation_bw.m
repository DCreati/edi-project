function out = segmentation_bw(sat, val)
    
    %Si crea una struttura morfologica a disco di dimensione 8px, la migliore per la scheletrizzazione
    dsk = strel("disk", 8);
    
    % Si binarizza l'immagine secondo un modello adattativo, ovvero che calcola un threshold adattativo in base all'intorno di ogni pixel.
    % Inoltre, si specifica che il foreground potrebbe contenere ombre e quindi risultare più scuro per il thresholding
    bw_sat = imbinarize(sat,'adaptive','ForegroundPolarity','dark');
    bw_sat = ~bw_sat;
    bw_val = imbinarize(val,'adaptive','ForegroundPolarity','dark');
    bw_val = ~bw_val;
    
    % SATURAZIONE
    % Perfetta per oggetti con molte parti da riempire, anche più del necessario
    
    % La serie di operazioni prevede l'aggiunta di pixel ai bordi degli oggetti trovati per meglio definire la forma, si usa la struttura a
    % disco per connettere abbondantemente le parti e si riempiono i buchi rimasti
    bw_sat = bwmorph(bw_sat, 'thicken');
    bw_sat = imclose(bw_sat, dsk);
    bw_sat = imfill(bw_sat, 'holes');
    
    % VALUE
    % Perfetta per oggetti con parti non inizialmente unite
    
    % La serie di operazioni prevede l'aggiunta di pixel ai bordi degli oggetti trovati per meglio definire la forma, poi si connettono eventuali
    % parti sconnesse, riempiendo i buchi rimasti ed eliminando infine le imperfezioni sotto i 150px
    bw_val = bwmorph(bw_val, 'thicken');
    bw_val = bwmorph(bw_val, 'bridge');
    bw_val = imfill(bw_val, 'holes');
    bw_val = bwareaopen(bw_val, 150);
    
    % INTERSECAMENTO DEI DUE
    bw = bw_sat & bw_val;
    
    out = bw;
    
end