
<?php

//aller sur le serveur MYSQL
mysql_connect('localhost', 'root', '');

//Selection de la base de données
mysql_select_db('cdnl_dimarco') ;

//Formuler la requete SQL
$sql =  "SELECT * FROM oeuvre" ;

//Exécution de la requete SQL
$resultats = mysql_query ( $sql ) ;

//Traitement des données récupérées

while (  $tab_ligne = mysql_fetch_row ($resultats)  ) 
{

	echo "id : ", $tab_ligne[0], "<br>" ; // id
	echo "nom : ", $tab_ligne[1], "<br>" ; // id
	echo "<img src='oeuvres/", $tab_ligne[2], "' width='400px'>" ; // id
	
} ;



//Fermeture de la connexion SERVEUR
mysql_close ();

?>