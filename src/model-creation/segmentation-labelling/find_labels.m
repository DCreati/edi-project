function out = find_labels(bw)
	
    % Si etichetta ogni componente connessa trovata con un numero
    lbl_mat = bwlabel(bw);

    % Si contano le componenti connesse e si crea un array per contenerle
    lbl_cnt = max(max(lbl_mat));
    lbl = cell(lbl_cnt, 1);
    
    % Si cicla per ogni componente connessa...
    for n = 1 : lbl_cnt
        
        %Si prende la parte di immagine con solo quella componente e la si salva
        lbl_elem = (lbl_mat == n);
        lbl{n} = lbl_elem;
        
    end
    
    out = lbl;
end