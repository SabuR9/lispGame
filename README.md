TODO:
* samaisīt kārtis (+shuffleDeck)
* izvēlēties spēletāju skaitu(-)
* izvēlēties kurš spēlētājs cilvēks/dators(-)
* apstrādāt ievades kļūdas spēlētāju skaita/tipa ievadei(-)
* izdalīt kārtis 2-4 spēlētājiem(-)
* atrast pārus (+findPairs)
* izņemt pārus no rokas (-)
* ļaut cilvēkam izvēlēties kārti no iepriekšējās rokas(-)
* apstrādāt kārts izvēles ievades kļūdas(-)
* datoram izvēlēties kārti no iepriekšējā rokas(-)
* realizēt gājienus pēc kārtas(-)
* pārbaudīt vai rokās ir kārtis(-)
* realizēt spēlētāja iziešanu no spēles, kad beidzas kārtis rokā(-)
* pārbaudīt spēles beigu nosacījumu(-)
* izvadīt zaudētāju(-)
* 

# lispGame

Spele Witch
Karsu kopa 6-A bez kreiču  dāmas, spele piedalas 4 speletaji, ka min 1 human un 1 computer
35 kārtis
1)	Kārtis sadalītas vienmērīgi starp spēlētājiem
2)	Spēlētāji parbauda savas kārtis, ja uz rokām ir pāri vienā krāsā, izmet no speles
3)	Pulkstenradītāja virzienā, viens panem no iepriekseja nejauši vienu kārti un pievieno savai karsu kopas un pārbauda uz pāriem
4)	Ja beidzas kartis uz rokas speletajs beidz spelet
5)	Spele līdz vienam no speletajiem paliek vieniga karts piku dama

<b style="font-size:24px">Prasības</b><br>
Realizēt kāršu spēli ragana.<br>
Iespēja izvēlēties spēlētaju skaitu no 2-4.<br>
Spēles kāršu kopa sastāv no 35 kārtīm (6-A, izņemot kreiču dāmu).<br>
Spēlē piedalās viens cilvēks un 1-3 datora vadītie spēlētāji.<br>
Spēlētājs spēj izvēlēties karti kuru paņems no iepriekšejā spēlētāja, datora vadītais spēlētais izvēlās nejauši.<br>
Kārtis sadalās vienmērīgi starp spēlētājiem.<br>
Beidzoties kartīm uz rokas spēlētajs iziet no spēles.<br>
Paliekot pēdējam spēlētājam ar vienīgi vienu pīķa dāmu spēlētājs zaudē.<br>


Iekšējie spēles notikumi:
1)	Spēles kartis tiek sajauktas
2)	Tiek izdalīts vienmērīgi starp spēlētājiem
3)	Spēlētāji parbauda uz pāriem un izmet to no spēlētāja kāršu kopas
4)	Spēle iedod pirmajam spēlētājam gājienu
5)	Spēlētajs paņem iepriekšēja spēlētāja kārti
6)	Pārbauda uz pāriem
7)	Gājiens tiek nodots nākamajam spēlētājam, pāriet uz 5 soli
8)	Spēle beidzās kad paliek viens spēlētājs ar pīķa dāmu
