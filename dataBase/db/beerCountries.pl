:-module(beerCountries,[country/3]).
%country(name, consumption, [brewery(name, [beer(name, type)],year_opened)]).

country('Czech Republic', 158, [
	brewery('Pilsner Urquell', [beer('Pilsner Urquell', lager)],1842),
	brewery('Budweiser Budvar', [beer('ORIGINAL', lager),beer('DARK',dark-lager)],1895),
	brewery('Velkopopovicky Kozel',[beer('Pale',pale-lager),beer('Dark',dark-lager),beer('11° Medium', pale-lager),beer('Premium',pale-lager)],1874),
	brewery('Staropramen',[beer('Premium',lager),beer('Dark', dark-lager),beer('Garnet',red-lager),beer('Light', pale-lager)],1869)
]).

country('Germany', 110,[
	brewery('Augustiner',[beer('Helles',light-lager),beer('Edelstoff',lager),beer('Dunkles',dark-lager),beer('Pils',pilsner),beer('Weissbier',wheat),beer('Oktoberfestbier',special),beer('Maximator',doppelbock),beer('Heller Bock',bock)],1328),
	brewery('Pauleaner',[beer('Hefe-Weissbier Naturtrüb', wheat),beer('Hefe-Weissbier Dunkel',dark-wheat),beer('Hefe-Weissbier Alkoholfrei',non-alcohol),beer('Original Münchner Dunkel',dark-lager),beer('Original Münchner Urtyp',lager),beer('Premium Pils',pilsner),beer('Salvator',doppelbock)],1634),
	brewery('Löwenbräu',[beer('Münchner Dunkel',dark-lager),beer('Triumphator',doppelbock),beer('Alkoholfrei',non-alcohol),beer('Pils',pilsner),beer('Dunkle Weisse',dark-wheat),beer('Weisse Hell',wheat),beer('Oktoberfestbier',special)],1383)
]).

country('Australia',104,[
	brewery('Cascade Brewery',[beer('Premium Lager',lager),beer('Pale Ale',lager),beer('Blonde',lager),beer('Amber',ale),beer('Draught',lager),beer('Lager (Blue)',lager),beer('Bitter (Red)',lager),beer('Stout',stout)],1832),
	brewery('Coopers',[beer('Sparkling Ale',ale),beer('Pale Ale',ale),beer('Best Extra Stout',stout),beer('Dark Ale',ale),beer('Mild Ale',ale),beer('Premium Lager',lager),beer('62 Pilsner',pilsner),beer('Extra Strong Vintage Ale',ale),beer('Birell', non-alcohol),beer('Dr. Tims Traditional Ale',ale)],1862)
]).