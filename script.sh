#!/bin/bash

# On remplace l'image de fond sur passage de la souris sur les images
sed -i '' -e 's/96b/927/g' ./assets/gallery/style.css

# On supprime des balises du bloc description auteur qui ne servent a rien
sed -i '' -e 's/<p class="mbr-author-name pt-4 mb-2 mbr-fonts-style display-7">&nbsp;<\/p>//g' ./index.html
sed -i '' -e 's/<p class="mbr-author-desc mbr-fonts-style display-7">&nbsp;<\/p>//g' ./index.html

# Mise en forme du titre et ajoute d'un rectangle blanc sur la page index.html
sed -i '' -e 's/<div class="mbr-white col-md-10">/<div class="mbr-white col-md-4">/g' ./index.html
sed -i '' -e 's/<h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-5">/<h1 class="mbr-section-title mbr-bold pb-1 mbr-fonts-style display-5" style="height: auto; background-color:white;width: auto;margin: auto;border-style: solid; font-size: 1.6em;">/g' ./index.html
sed -i '' -e 's/<span style="font-weight: normal;">Aventure \ı Nature \ı Humain<\/span>/<span style="font-weight: 100; font-size: 0.8em !important;">Aventure \ı Nature \ı Humain<\/span>/g' ./index.html

# Insert source and code for easy loader
sed -i '' -e '/<body>/a\ 
<div id="loader-wrapper"><div id="loader"><\/div><div class="loader-section section-left"><\/div><div class="loader-section section-right"><\/div><\/div>' ./index.html
sed -i '' -e '/<title>White-House<\/title>/a\ 
<link rel="stylesheet" href="loader\/css\/main.css">' ./index.html
sed -i '' -e '/<\/body>/i\
<script>function loadjsfile(filename)\{var fileref=document.createElement("script");fileref.setAttribute("type","text\/javascript");fileref.setAttribute("src", filename);document.getElementsByTagName("head")[0].appendChild(fileref);\}<\/script>' ./index.html
sed -i '' -e '/<\/body>/i\
<script>window.addEventListener("load",function(event){console.log("Toutes les ressources sont chargées !");loadjsfile("loader\/js\/main.js");});<\/script>' ./index.html
