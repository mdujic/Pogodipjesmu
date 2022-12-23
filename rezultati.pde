void rezultati_draw()
{
    fill(boja_teksta);
    
    // veliki kvadrat u kojem će pisati najboljih 10 rezultata
    rect(width/2 - 300, height/3, 600, 600);

    fill(pravokutnik_pozadina, 180);
    textAlign(CENTER);
    textFont(font2);
    
    // pročitaj iz datoteke "rezultati.txt" i ispiši rezultate
    String[] lines = loadStrings("rezultati.txt");
    
    // ispiši rezultate
    for (int i = 0; i < lines.length; i++) {
        text(lines[i], width/2, height/3 + 50 + i*50);
    }
    
}
