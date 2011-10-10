:-module(beerCountries,[country/3]).
%country(name, consumption, [brewery(name, [beer(name, type)],year_opened)]).

country('Czech Republic', 158, [
	brewery('Pilsner Urquell', [beer('Pilsner Urquell', lager)],1842),
	brewery('Budweiser Budvar', [beer('ORIGINAL', lager),beer('DARK',dark_lager)],1895),
	brewery('Velkopopovicky Kozel',[beer('Pale',pale_lager),beer('Dark',dark_lager),beer('11° Medium', pale_lager),beer('Premium',pale_lager)],1874),
	brewery('Staropramen',[beer('Premium',lager),beer('Dark', dark_lager),beer('Garnet',red_lager),beer('Light', pale_lager)],1869)
]).

country('Germany', 110,[
	brewery('Augustiner',[beer('Helles',light_lager),beer('Edelstoff',lager),beer('Dunkles',dark_lager),beer('Pils',pilsner),beer('Weissbier',wheat),beer('Oktoberfestbier',special),beer('Maximator',doppelbock),beer('Heller Bock',bock)],1328),
	brewery('Pauleaner',[beer('Hefe_Weissbier Naturtrüb', wheat),beer('Hefe_Weissbier Dunkel',dark_wheat),beer('Hefe_Weissbier Alkoholfrei',non_alcohol),beer('Original Münchner Dunkel',dark_lager),beer('Original Münchner Urtyp',lager),beer('Premium Pils',pilsner),beer('Salvator',doppelbock)],1634),
	brewery('Löwenbräu',[beer('Münchner Dunkel',dark_lager),beer('Triumphator',doppelbock),beer('Alkoholfrei',non_alcohol),beer('Pils',pilsner),beer('Dunkle Weisse',dark_wheat),beer('Weisse Hell',wheat),beer('Oktoberfestbier',special)],1383)
]).

country('Australia',104,[
	brewery('Cascade Brewery',[beer('Premium Lager',lager),beer('Pale Ale',lager),beer('Blonde',lager),beer('Amber',ale),beer('Draught',lager),beer('Lager (Blue)',lager),beer('Bitter (Red)',lager),beer('Stout',stout)],1832),
	brewery('Coopers',[beer('Sparkling Ale',ale),beer('Pale Ale',ale),beer('Best Extra Stout',stout),beer('Dark Ale',ale),beer('Mild Ale',ale),beer('Premium Lager',lager),beer('62 Pilsner',pilsner),beer('Extra Strong Vintage Ale',ale),beer('Birell', non_alcohol),beer('Dr. Tims Traditional Ale',ale)],1862)
]).

country('Ukraine',56,[
	brewery('Lvivske',[beer('Premium',pilsner), beer('1715',pilsner), beer('Svitle',pilsner), beer('Mitsne', pilsner), beer('Porter',stout), beer('Zhive', lager), beer('White Lion',wheet)],1715),
	brewery('Chernihivske',[beer('Light',lager), beer('Premium',lager), beer('Strong',lager), beer('Dark',dark_lager), beer('White',wheat), beer('White Night',dark_wheat), beer('Fitness+',non_alcohol), beer('Pub Lager',lager)],1995),
	brewery('Obolon',[beer('Carling',lager), beer('Hike',lager), beer('Premiun',lager), beer('Zibert Bavarian',lager)], 1974),
	brewery('First Private Brewery',[beer('Stare misto',lager),beer('Medove',lager),beer('Bochkove',lager)], 2004)
]).

country('Ireland',131,[
	brewery('Biddy Early',[beer('Black',stout), beer('Blonde',pale_lager), beer('Red',red_ale), beer('Real', red_ale)],1995),
	brewery('Carlow Brewing Company',[beer('O’hara’s Celtic Stout',stout), beer('Curum Gold Celtic Wheat Beer',wheat), beer('Molings Traditional',ale), beer('Beerkeeper Gold',  wheat)],1998)
]).