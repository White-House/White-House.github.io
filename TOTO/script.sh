#!/bin/bash

# On remplace le chemin des fichiers en relative depuis la racine
sed -i '' -e 's/href="assets/href="\/assets/g' *.html
sed -i '' -e 's/src="assets/src="\/assets/g' *.html

# On remplace l'image de fond sur passage de la souris sur les images
sed -i '' -e 's/96b/927/g' ./assets/gallery/style.css

# On modifie la position de l'image SPECIFIQUE afin de centrer le sujet
# A modifier en cas de changement de l'image en background
sed -i '' -e 's/background-position: 50% 50%;/background-position: 85% 50%;/g' ./assets/theme/css/style.css 

# On modifie l'espacement des images
sed -i '' -e 's/p-1{padding:.25rem!important}/p-1{padding:.12rem!important}/g' ./assets/bootstrap/css/bootstrap-grid.min.css 

# On supprime des balises du bloc description auteur qui ne servent a rien
sed -i '' -e 's/<p class="mbr-author-name pt-4 mb-2 mbr-fonts-style display-7">&nbsp;<\/p>//g' ./index.html
sed -i '' -e 's/<p class="mbr-author-desc mbr-fonts-style display-7">&nbsp;<\/p>//g' ./index.html

# On supprime les commentaires inutiles
sed -i '' -e '/Site made with Mobirise Website Builder/d' ./index.html
sed -i '' -e '/Site made with Mobirise Website Builder/d' ./404.html
sed -i '' -e '/<meta name="generator"/d' ./index.html
sed -i '' -e '/<meta name="generator"/d' ./404.html
sed -i '' -e 's/<section class="engine".*<\/a><\/section>//g' ./index.html
sed -i '' -e 's/<section class="engine".*<\/a><\/section>//g' ./404.html
sed -i '' -e 's/if(!document.getElementById("top-1")).*)}//g' ./assets/theme/js/script.js

# On supprime les lignes vides
sed -i '' -e '/^ *$/d' ./index.html
sed -i '' -e '/^ *$/d' ./404.html

# Mise en forme du titre et ajoute d'un rectangle blanc sur la page index.html
sed -i '' -e 's/<div class="mbr-white col-md-10">/<div class="mbr-white col-md-4">/g' ./index.html
sed -i '' -e 's/<h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-5">/<h1 class="mbr-section-title mbr-bold pb-1 mbr-fonts-style display-5" style="height: auto; background-color:white;width: auto;margin: auto;border-style: solid; font-size: 1.6em;">/g' ./index.html
sed -i '' -e 's/<span style="font-weight: normal;">Aventure \ı Nature \ı Humain<\/span>/<span style="font-weight: 100; font-size: 0.8em !important;">Aventure \ı Nature \ı Humain<\/span>/g' ./index.html

# Insert source and code for easy loader
sed -i '' -e '/<body>/a\ 
<div id="loader-wrapper"><div id="loader"><\/div><div class="loader-section section-left"><\/div><div class="loader-section section-right"><\/div><\/div>' ./index.html
sed -i '' -e '/<title>White-House | Photographe & Explorateur<\/title>/a\ 
<link rel="stylesheet" href="\/loader\/css\/main.css">' ./index.html
sed -i '' -e '/<\/body>/i\
<script>function loadjsfile(filename)\{var fileref=document.createElement("script");fileref.setAttribute("type","text\/javascript");fileref.setAttribute("src", filename);document.getElementsByTagName("head")[0].appendChild(fileref);\}<\/script>' ./index.html
sed -i '' -e '/<\/body>/i\
<script>window.addEventListener("load",function(event){console.log("Toutes les ressources sont chargées !");loadjsfile("\/loader\/js\/main.js");});<\/script>' ./index.html
