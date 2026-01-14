% Progetto di Elaborazione delle Immagini di Creati Davide, Delli Fiori Andrea.
% Creazione del modello KNN-Mahalanobis per il tool recognition.

close all;
clear;

% Si aprono gli elenchi di immagini e di label associate
[images, labels] = readlists('images/train/images.list', 'images/train/labels.list');
features = [];

% Per ogni immagine, si eseguiranno le operazioni di segmentazione ed estrazione delle features
for i=1 : numel(images)
    
    clc
    fprintf("Elaborazione dell'immagine n. %d su %d", i, numel(images));

    % SEGMENTAZIONE %
    lbl = segmentation(imread(['images/train/' images{i}]), 'single');

    % FEATURE EXTRACTION %
    fts = compute_features(lbl{1});
    fts = cell2mat(struct2cell(fts));
    features = [features; fts'];

end

% PARTIZIONAMENTO
%part = data_partition(images, labels, features);
%train_set = part.train;
%test_set = part.test;

% Si crea il modello KNN-Mahalanobis a partire dal training set e lo si salva
knnModel = fitcknn(features, labels, 'NumNeighbors', 5, 'Distance', 'mahalanobis');
save("knn_model.mat", "knnModel");

% Si controlla l'accuratezza del modello tramite le matrici di confusione
%train_predicted = predict(knnModel, train.features);
%cm_train = confmat(train.labels, train_predicted);
%test_predicted = predict(knnModel, test.features);
%cm_test = confmat(test.labels, test_predicted);