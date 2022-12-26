void rezultati_draw()
{
    fill(boja_teksta);
    
    // veliki kvadrat u kojem će pisati najboljih 10 rezultata
    // na vrhu mu piše "Top 10 rezultata"
    rect(width/2 - 300, height/3, 600, 600);
    

    fill(pravokutnik_pozadina, 180);
    textAlign(CENTER);
    textFont(font);
    
    // pročitaj iz datoteke "rezultati.txt" i ispiši rezultate
    String[] lines = loadStrings("rezultati.txt");
    
    // napiši na vrhu leaderboarda "Top 10 rezultata" bijelom bojom
    fill(255);
    text("Top 10 rezultata", width/2, height/3 + 50);

    // ispiši rezultate u sivoj boji
    fill(150);
    textFont(font2);

    for (int i = 0; i < lines.length; i++) {
        String[] rez = lines[i].split(",");
        text(rez[0] + "   " + rez[1], width/2, height/3 + 120 + i*50);
    }
    
}

void azuriraj_rezultate(){
    // otvori rezultati.txt
    // ako se rezultat nalazi unutar 10 najboljih, stavi ga na odgovarajuće mjesto i spremi preostalih 10 najboljih

    String lines[] = loadStrings("rezultati.txt");
    String[] rezultati = new String[10];

    for (int i = 0; i < 10; i++)
        rezultati[i] = "NoName,0";


    if (lines[0] == "NoName,0")
    {
        rezultati[0] = ime + "," + bodovi;
        return;
    }

    for(int i = 0; i < 10; i++){
        // razdvoji lines[i] na ime i rezultat
        // ako je bodovi > rezultat, zamjena

        if (lines[i] == "NoName,0")
        {
        rezultati[i] = ime + "," + bodovi;
        break;
        }

        String[] d = lines[i].split(",");
        String ime_r = d[0];
        int bodovi_r = int(d[1]);

        if ( bodovi >= bodovi_r ) {
        cestitam = true;
        crtaj_vatromet = true;
        
        String temp = lines[i];
        rezultati[i] = ime + "," + bodovi;
        
        // mijenjamo do kraja (ako je bilo manje od 10 rezultata, spremamo i najgori)
        for (int j = i; j < 9; j++) {
            String temp2 = lines[j];
            rezultati[j + 1] = temp;
            temp = temp2;
        }
        break;
        }

        rezultati[i] = lines[i];

    }
    
    saveStrings("rezultati.txt", rezultati);
}
