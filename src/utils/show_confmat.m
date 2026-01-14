function show_confmat(cm_raw, labels)

    % Si visualizza la matrice di confusione
    confusionchart(cm_raw, labels, 'normalization', 'row-normalized');
    set(gca, 'FontSize', 14);

end