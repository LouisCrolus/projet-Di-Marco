<?php

$nom = $_POST['champ1'] ;
$prenom = $_POST['champ2'] ;
$email = $_POST['champ3'] ;

//aller sur le serveur MYSQL
mysql_connect('localhost', 'root', '');

//Selection de la base de données
mysql_select_db('cdnl_dimarco') ;

//Formuler la requete SQL
$sql =  "SELECT * FROM utilisateur" ;

//Exécution de la requete SQL
$resultats = mysql_query ( $sql ) ;

//Traitement des données récupérées

while (  $tab_ligne = mysql_fetch_row ($resultats)  ) 
{
	echo "blop : " , $tab_ligne[0] , "<br>" ; // id
	echo "blop : " , $tab_ligne[1] , "<br>" ; // id
	echo "blop : " , $tab_ligne[2] , "<br>" ; // id
} ;

//Fermeture de la connexion SERVEUR
mysql_close ();

?>