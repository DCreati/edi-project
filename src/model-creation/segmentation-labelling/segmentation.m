function out = segmentation(img, type)

    % PRE-PROCESSO
    sat = preprocessing(img, 'sat');
    val = preprocessing(img, 'val');
    hue = preprocessing(img, 'hue');

    % SEGMENTAZIONE TRAMITE BINARIZZAZIONE
    msk_bw = segmentation_bw(sat, val);

    % SEGMENTAZIONE TRAMITE ISTOGRAMMI
    msk_hist = segmentation_hist(hue);
    
    % UNIONE DELLE SEGMENTAZIONI E PULIZIA FINALE
    msk = msk_bw | msk_hist;
    msk = imclearborder(msk);
    msk = imfill(msk, 'holes');
    if strcmp(type,'single')
        msk = bwareafilt(msk, 1);
    end
    if strcmp(type,'multiple')
        msk = bwareaopen(msk, 200);
    end
    
    % LABELLING
    lbl = find_labels(msk);
    
    out = lbl;

end