function out = confmat(gt, predicted)

    % Si calcola la matrice di confusione sulla base delle label originali e quelle predette
    [cm_raw, order] = confusionmat(gt(:), predicted(:));

    out.cm_raw = cm_raw;
    out.cm = cm_raw ./ repmat(sum(cm_raw, 2), 1, size(cm_raw, 2));
    out.labels = order;
    out.accuracy = sum(diag(cm_raw)) / numel(gt);
    
end