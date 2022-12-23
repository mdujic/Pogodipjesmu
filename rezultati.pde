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
