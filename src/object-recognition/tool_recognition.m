% Progetto di Elaborazione delle Immagini di Creati Davide, Delli Fiori Andrea.
% Uso del modello KNN-Mahalanobis per il tool recognition.

close all;
clear;

% Si aprono gli elenchi di immagini e di label associate, stavolta quelle da riconoscere, insieme al modello creato
[images, labels] = readlists('images/test/images-tools.list', 'images/test/labels-tools.list');
load('models.mat');
lbl_list = [];

% Per ogni immagine si eseguirà l'operazione di segmentazione
for i=1 : numel(images)
    
    clc
    fprintf("Elaborazione dell'immagine n. %d su %d \n", i, numel(images));
    figure(i);
    imshow((imresize(imread(['images/test/' images{i}]), 0.3)));
    
    % SEGMENTAZIONE %
    lbl = segmentation(imread(['images/test/' images{i}]), 'multiple');
    lbl_res = "";
    
    % Per ogni componente connessa si predirà a quale categoria di attrezzo appartiene
    for j=1 : numel(lbl)
        
        fprintf("Elaborazione della componente connessa n. %d su %d \n", j, numel(lbl));

        % FEATURE EXTRACTION %
        fts = compute_features(lbl{j});
        fts = cell2mat(struct2cell(fts));
        features = [[]; fts'];
        
        % MODEL PREDICTION
        [lbl_model, score] = predict(knn_m_5, features);
        
        % Si costruisce la label partendo dai risultati trovati
        [max_score, max_index] = max(score);
        %[min_score, index_min] = min(score);
        if(max_score <= 0.2)
            lbl_curr = 'unknown';
        else
            lbl_curr = knn_m_5.ClassNames{max_index};
            lbl_curr = replace(lbl_curr, '_', ' ');
        end
        
        % Si costruisce la lista delle label risultato
        if(j == numel(lbl))
            lbl_res = lbl_res + lbl_curr;
        else
            lbl_res = lbl_res + lbl_curr + ',';
        end
        
        % Si aggiunge il livello di precisione con cui si fa la predizione
        lbl_curr = lbl_curr + " " + string(round(max_score*100)) + "%";
        
        % Si costruisce la regione evidenziata sull'immagine originale
        box = regionprops(lbl{j}, "BoundingBox");
        rectangle('Position', box.BoundingBox, 'EdgeColor', 'g', 'LineWidth', 2);
        text(box.BoundingBox(1), box.BoundingBox(2), lbl_curr, 'BackgroundColor', 'g', 'FontSize', 10, 'Color', 'w');

    end

    lbl_list = [lbl_list, lbl_res];

end

lbl_list = lbl_list';