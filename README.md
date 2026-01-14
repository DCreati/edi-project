# object-recognition-for-tool
Progetto del corso triennale di "Elaborazione delle immagini"

Progetto sviluppato in MatLab per identificare degli utensili all'interno di alcune immagini.

## Considerazioni per lo sviluppo
- Diversi utensili possono appartenere alla stessa categoria (es. chiavi inglesi di diversa dimensione)
- Vogliamo riconoscere le categorie (es. cacciaviti vs. pinze)
- Utensili della stessa categoria possono avere apparenza diversa (es. colore, misura, aperto/chiuso, ecc..)
- Gli utensili possono essere posizionati in vario modo sul piano
- Effettuate una ripresa della scena il più possible costante: stessa distanza della camera dal piano e stessa angolazione
- Assumete che gli utensili siano posizionati randomicamente sul piano e che NON si sovrappongano
- Possono esistere elementi estranei sul piano di acquisizione

## Le funzionalità minime richieste
- Considerare almeno 10 diverse categorie di utensili (es. cacciaviti, pinze, tenaglie, chiavi inglesi, spatole, …)
- Gli utensili non devono essere “facilmente” distinguibili (es. solo per forma o colore)
- Devono esistere stessi utensili (stessa categoria) ma con caratteristiche diverse (es. pinze con manici di colore diverso)
- Dovete considerare almeno 4 diversi sfondi del piano dove mettere gli utensili
- 3 sfondi non devono essere di colore uniforme ma contenere delle varibilità (es. Tavolo di legno, tovaglia, ecc…)
- Bisogna gestire elementi estranei nella scena: localizzarli ed etichettarli come unknown

## Requisiti
- Dovete crearvi il vostro dataset di training e di test da usare nell’applicazione. Il numero e tipologia di immagini di training e di test da usare è a vostra scelta.
- Nel farlo, dovete tenere conto e gestire diverse situazioni e condizioni:
  - Ci possono essere delle ombre
  - Ci possono essere dei cambiamenti di illuminazione
  - Ci può essere del rumore dovuto al processo di acquisizione o al formato delle immagini
- L’applicazione deve essere valutata almeno in termini di:
  - Accuratezza (matrice di confusione) nella identificazione delle tipologie di utensili. Sarà quindi necessario definire una ground truth sull’intero dataset.
  - Definite e riportate nella presentazione le misure che usate per le valutazioni
- Riportate e commentate nella presentazione gli errori
- Parte integrante del lavoro è l’analisi del dataset e la definizione delle assunzioni operative che hanno portato alla progettazione   della pipeline di elaborazione.
- Le decisioni che prendete sono parte integrante della presentazione. Dovete descrivere tutte le specifiche che caratterizzano la vostra soluzione nelle assunzioni.
- Riportate anche eventuali confronti con le diverse soluzioni provate
