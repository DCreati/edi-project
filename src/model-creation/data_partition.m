function out = data_partition(images, labels, features)
    
    % Si effettua un partizionamento casuale sul dataset fornito in modo da definire un training ed un test set, ovvero
    % si partiziona randomicamente un quarto (0.25) delle labels (ovvero le osservazioni), in un training set ed un testing set
    cv = cvpartition(labels, "HoldOut", 0.25);
    
    % Si ottiene il numero di osservazioni per il training e il testing set nella prima ripetizione
    tr = cv.training(1);
    ts = cv.test(1);
    
    % Si estraggono tr immagini, labels e features tra tutte le possibili
    train.img = images(tr);
    train.lbl = labels(tr);
    train.fts = features(tr, :);
    
    % Si estraggono ts immagini, labels e features tra tutte le possibili
    test.img = images(ts);
    test.lbl = labels(ts);
    test.fts = features(ts, :);
    
    out.train = train;
    out.test = test;

end