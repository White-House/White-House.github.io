#!/bin/bash

#USER_SIZE=$(echo $USER | wc -m)
#FULL_SIZE=$(($USER_SIZE+42))
#i="0"
#j="0"

#while [ $i -le $FULL_SIZE ]; do echo -ne "#"; ((i=i+1)); done
clear
echo "#########################################################"
echo "############### Bonjour $USER :-)         #############"
echo "############### Script de MaJ du Site Web ###############"
echo "#########################################################"
#while [ $j -le $FULL_SIZE ]; do echo -ne "#"; ((j=j+1)); done

# Fenetre de dialogue avant de commencer
#defaultImagePath=$(egrep -io "twitter:image:src.*content=.*>" index.html | awk -F'"' '{print $3}')
defaultImagePath="assets/images/xxxxx.jpg"
imagePath=$(zenity --entry --title="Chemin image thumbnail/miniature" --text="Veuillez indiquer le chemin de l'image à partager :" --entry-text="${defaultImagePath}")

# Si l'utilisateur annule l'action
if [[ $? -eq 1 ]]; then
	exit 1;
fi

if [ ! -f "$imagePath" ]; then
	echo "# Chemin non valide pour l'image"
	echo "##################### Fin du script #####################"
	echo "#########################################################"
	exit 1;
else
	imageInfo=$(file ${imagePath} | awk -F ',' '{print $15}')
	imageWidth=$(echo ${imageInfo} | awk -F 'x' '{print $1}')
	imageHeight=$(echo ${imageInfo} | awk -F 'x' '{print $2}')
	echo "# Chemin de l'image: ${imagePath}"
	echo "# Taille W : ${imageWidth} H : ${imageHeight}"
fi

# On remplace le chemin des fichiers en relative depuis la racine
sed -i '' -e 's/href="assets/href=".\/assets/g' *.html
sed -i '' -e 's/src="assets/src=".\/assets/g' *.html
sed -i '' -e 's/"assets/".\/assets/g' *.html

# On ajoute les effets a l'image principale (snow, bubble)
sed -i '' -e 's/href="\/assets\/gallery\/style.css">/href=".\/assets\/gallery\/style.css"><link rel="stylesheet" href=".\/assets\/snow\/snow.css"><link rel="stylesheet" href=".\/assets\/bubble\/bubble.css">/g' ./index.html
sed -i '' -e 's/mbr-fullscreen" id="header2-1">/mbr-fullscreen" id="header2-1"><iframe style="position: absolute; width: 100%; height: 100%; top: 0; border: none;" scrolling="no" id="animation-wallpaper" src=".\/assets\/snow\/snow.html"><\/iframe>/g' ./index.html

# On modifie le type de flèche sur la page principale
sed -i '' -e 's/<i class="mbri-down mbr-iconfont"><\/i>/<i class="mbri-arrow-down mbr-iconfont" style="top:-5px"><\/i><i class="mbri-arrow-down mbr-iconfont" style="top:5px"><\/i>/g' ./index.html

# On remplace l'image de fond sur passage de la souris sur les images
sed -i '' -e 's/96b/927/g' ./assets/gallery/style.css

# On modifie la position de l'image SPECIFIQUE afin de centrer le sujet
# A modifier en cas de changement de l'image en background
sed -i '' -e 's/background-position: 50% 50%;/background-position: 85% 50%;/g' ./assets/theme/css/style.css 

# On modifie l'espacement des images
sed -i '' -e 's/p-1{padding:.25rem!important}/p-1{padding:.12rem!important}/g' ./assets/bootstrap/css/bootstrap-grid.min.css 

# On justifie le texte de la description A PROPOS
sed -i '' -e 's/<p class="mbr-text testimonial-text mbr-fonts-style display-1">/<p class="mbr-text testimonial-text mbr-fonts-style display-1" id="textDescription" style="text-align:justify">/g' ./index.html

# On supprime des balises du bloc description auteur qui ne servent a rien
sed -i '' -e 's/<p class="mbr-author-name pt-4 mb-2 mbr-fonts-style display-7">&nbsp;<\/p>//g' ./index.html
sed -i '' -e 's/<p class="mbr-author-desc mbr-fonts-style display-7">&nbsp;<\/p>//g' ./index.html
sed -i '' -e 's/<section class="display-7.*section>//g' ./index.html
# sed -i '' -e 's/<section style=\"background-color:.*<\/section>//g' index.html

# On supprime les commentaires inutiles
sed -i '' -e '/Site made with Mobirise Website Builder/d' ./index.html
sed -i '' -e '/Site made with Mobirise Website Builder/d' ./404.html
sed -i '' -e '/<meta name="generator"/d' ./index.html
sed -i '' -e '/<meta name="generator"/d' ./404.html
sed -i '' -e '/<meta http-equiv="X-UA-Compatible" content="IE=edge">/d' ./index.html
sed -i '' -e 's/<section class="engine".*<\/a><\/section>//g' ./index.html
sed -i '' -e 's/<section class="engine".*<\/a><\/section>//g' ./404.html
sed -i '' -e 's/if(!document.getElementById("top-1")).*)}//g' ./assets/theme/js/script.js
sed -i '' -e '/Mobirise.*blank/,+2d' index.html
sed -i '' -e '/Mobirise.*blank/,+2d' index.html
sed -i '' -e '/mobirise.*blank/,+2d' index.html
sed -i '' -e '/mobirise.*blank/,+2d' index.html

# On supprime les scripts inutiles
sed -i '' -e 's/<script src=".\/assets\/sociallikes\/social-likes.js"><\/script>//g' ./index.html
sed -i '' -e 's/<script src=".\/assets\/vimeoplayer\/jquery.mb.vimeo_player.js"><\/script>//g' ./index.html

# On supprime l'appel youtube dans script.js pour gagner du temps de chargement
sed -i '' -e 's/tag.src = "https:\/\/www.youtube.com\/iframe_api";/\/*tag.src = "https:\/\/www.youtube.com\/iframe_api";*\//g' ./assets/gallery/script.js

# On supprime les lignes vides
sed -i '' -e '/^ *$/d' ./index.html
sed -i '' -e '/^ *$/d' ./404.html

# Mise en forme du titre et ajoute d'un rectangle blanc sur la page index.html
#sed -i '' -e 's/<div class="mbr-white col-md-10">/<div class="mbr-white col-md-4">/g' ./index.html
#sed -i '' -e 's/<h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-5">/<h1 class="mbr-section-title mbr-bold pb-1 mbr-fonts-style display-5" style="height: auto; background-color:white;width: auto;margin: auto;border-style: solid; font-size: 1.6em;">/g' ./index.html
#sed -i '' -e 's/<span style="font-weight: normal;">Aventure \ı Nature \ı Humain<\/span>/<span style="font-weight: 100; font-size: 0.8em !important;">Aventure \ı Nature \ı Humain<\/span>/g' ./index.html

# On supprime l'icone d'agrandissement de l'image lors du overlay
sed -i '' -e 's/<span class="icon-focus"><\/span>//g' ./index.html

# On modifie le cadre de légende des images
sed -i '' -e 's/<span class="mbr-gallery-title mbr-fonts-style display-7">/<\/div><span class="button-info-image image-info display-7"><i class="fa fa-info-circle" aria-hidden="true"><\/i>\&ensp;/g' ./index.html
sed -i '' -e 's/<\/span><\/div><\/div>/<\/span><\/div>/g' ./index.html

# On ajoute le code pour le easy loader de chargement de la page
sed -i '' -e '/<body>/a\ 
<div id="loader-wrapper"><div id="loader"><\/div><img src=".\/assets\/images\/favicon-1.ico" class="loader-logo" id="loader-logo"><div class="loader-section section-left"><\/div><div class="loader-section section-right"><\/div><\/div>' ./index.html
sed -i '' -e '/<\/title>/a\ 
<link rel="stylesheet" href=".\/loader\/css\/main.css">' ./index.html
sed -i '' -e '/<\/body>/i\
<script>function loadjsfile(filename)\{var fileref=document.createElement("script");fileref.setAttribute("type","text\/javascript");fileref.setAttribute("src", filename);document.getElementsByTagName("head")[0].appendChild(fileref);\}<\/script>' ./index.html
sed -i '' -e '/<\/body>/i\
<script>window.addEventListener("load",function(event){loadjsfile(".\/loader\/js\/main.js");});<\/script>' ./index.html

# On modifie l'index afin d'ajouter le mode jour/nuit
sed -i '' -e 's/<nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top collapsed bg-color transparent">/<nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top collapsed bg-color transparent" id="navbar">/g' ./index.html
sed -i '' -e 's/<div class="navbar-brand">/<div class="navbar-brand"><input class="input-night-button" type="checkbox" id="switch-button" onclick="dayOrNightSelector()"><label class="night-button" for="switch-button"><i class="fas fa-sun"><\/i><i class="fas fa-moon"><\/i><\/label>/g' ./index.html
sed -i '' -e '/<\/body>/i\
<script src="./assets/navbar-mode/navbar-mode.js"></script>' ./index.html
sed -i '' -e '/<\/title>/i\
<link rel="stylesheet" href="./assets/fa/css/all.css">' ./index.html
sed -i '' -e 's/text-black/text-white text-black/g' ./index.html

# On ajoute le logo dans la barre de menu au milieu /!\ DEPEND DU MODE JOUR NUIT /!\
sed -i '' -e 's/<i class="fas fa-moon"><\/i><\/label>/<i class="fas fa-moon"><\/i><\/label><\/div><div class="navbar-logo logo-center"><a href="#top"><img src=".\/assets\/images\/benoit-maison-blanche_black.png" id="logo" alt="logo" title="logo" style="height: 3.8rem;"><\/a>/g' ./index.html

# Désactivation du clique droit souris (pour ne pas enregistrer les photos simplement) et ajout de la couleur du background
sed -i '' -e 's/<body>/<body id="body" class="body-background-white" onmousedown="return false" onselectstart="return false" oncontextmenu="return false">/g' ./index.html

# On ajoute un retour à la ligne pour meilleur lecture du texte (et ensuite )
sed -i '' -e $'s/<\/div>/\\\n<\/div>/g' ./index.html

# On ajoute un lady loader sur les images du caroulles mais pas sur la page index
sed -i '' -e 's/<div class="carousel-item"><img/<div class="carousel-item"><img loading="lazy"/g' ./index.html
sed -i '' -e 's/<div class="carousel-item active"><img/<div class="carousel-item active"><img loading="lazy"/g' ./index.html

# On modifie la balise Titre de toutes les images (principalement pour indexation google)
STR='alt="';
newTitle="";
lineNumber=1; 

cat ./index.html | while read line; do 
	# Si la ligne contient une balise alt 
	if [[ "$line" =~ .*"$STR".* ]]; then 
		# Si la balise alt est vide, on remplace la balise alt et title par des valeurs par défaut
		if [[ `echo $line | egrep -io 'alt=""'` ]]; then
			sed -i '' -e "${lineNumber}s/alt=\"\"/alt=\"Benoit Maison-Blanche | Photographe \& Explorateur\"/" ./index.html; 
			sed -i '' -e "${lineNumber}s/title=\"\">/title=\"Benoit Maison-Blanche | Photographe \& Explorateur\">/" ./index.html;
		else 
		# Sinon on récupére la balise alt et on l'ajoute a la balise title
			newTitle=$(echo $line | egrep -io "alt=\".*\" title" | egrep -io "\".*\"" | cut -d '"' -f 2);
			sed -i '' -e "${lineNumber}s!title=\"\"!title=\"${newTitle}\"!" ./index.html;
		fi;
	fi; 
	lineNumber=$((lineNumber+1));
done

# Au cas ou des images n'aient pas encore une description (localisation), on remplace le texte par défaut
sed -i '' -e 's/Tapez la légende ici/LOCALISATION EN COURS .../g' ./index.html
# Modification des données META pour un meilleur référencement
sed -i '' -e 's/shortcut icon/icon/g' ./index.html
sed -i '' -e '/<\/title>/a\
<meta property="og:type" content="website"\/>\
<meta property="og:title" content="Benoit Maison-Blanche | Photographe & Explorateur"\/>\
<meta property="og:description" content="Avec son époustouflant record d'"'"'apnée, Benoit Maison-Blanche réalise des photos à travers le monde afin de capturer l'"'"'incroyable beauté de notre planète bleue."\/>\
<meta property="og:url" content="https:\/\/white-house.github.io\/"\/>\
<meta property="og:nom_du_site" content="Benoit Maison-Blanche"\/>\
<meta property="og:image" content="https:\/\/white-house.github.io\/'${imagePath}'"\/>\
<meta property="og:image:width" content="'${imageWidth}'"\/>\
<meta property="og:image:height" content="'${imageHeight}'"\/>\
<meta name="twitter:card" content="summary_large_image"\/>\
<meta name="twitter:image:src" content="https:\/\/white-house.github.io\/'${imagePath}'"\/>\
<meta name="twitter:title" content="Benoit Maison-Blanche | Photographe & Explorateur"\/>\
<meta name="twitter:description" content="Avec son époustouflant record d'"'"'apnée, Benoit Maison-Blanche réalise des photos à travers le monde afin de capturer l'"'"'incroyable beauté de notre planète bleue."\/>\
<meta itemprop="name" content="Benoit Maison-Blanche | Photographe & Explorateur"\/>\
<meta itemprop="url" content="https:\/\/white-house.github.io"\/>\
<meta itemprop="description" content="Avec son époustouflant record d'"'"'apnée, Benoit Maison-Blanche réalise des photos à travers le monde afin de capturer l'"'"'incroyable beauté de notre planète bleue."\/>\
<meta itemprop="thumbnailUrl" content="https:\/\/white-house.github.io\/'${imagePath}'"\/>\
<link rel="canonical" href="https:\/\/white-house.github.io"\/>\
<meta name="robots" content="index, max-snippet:137, max-video-preview:-1, max-image-preview:large"\/>\
<meta name="googlebot" content="index, max-snippet:137, max-video-preview:-1, max-image-preview:large"\/>\
<meta name="bingbot" content="index, max-snippet:137, max-video-preview:-1, max-image-preview:large"\/>\
<meta name="Language" CONTENT="fr"\/>\
<meta name="copyright" content="© 2023 Benoit Maison-Blanche"\/>\
<meta name="author" content="Benoit Maison-Blanche"\/>' ./index.html

sed -i '' -e '/twitter:image:src/i\
<meta name="twitter:description" content="Avec son époustouflant record d'"'"'apnée, Benoit Maison-Blanche réalise des photos à travers le monde afin de capturer l'"'"'incroyable beauté de notre planète bleue."\/>\
<meta name="thumbnail" content="https:\/\/white-house.github.io\/'${imagePath}'"\/>' ./index.html

sed -i '' -e 's/content=".\/assets\/images/content="https:\/\/white-house.github.io\/assets\/images/g' ./index.html
sed -i '' -e 's/<noscript>/<!--<noscript>/g' ./index.html
sed -i '' -e 's/<\/noscript>/<\/noscript>-->/g' ./index.html

#sed -i '' -e '/<\/head>/i\
#<script type="application\/ld+json">{"@context": "http:\/\/schema.org\/","@type": "WebSite","name": "Benoit Maison-Blanche | Photographe & Explorateur","url": "https:\/\/white-house.github.io","image": "https:\/\/white-house.github.io\/'${imagePath}'","description": "Avec son époustouflant record d'"'"'apnée, Benoit Maison-Blanche réalise des photos à travers le monde afin de capturer l'"'"'incroyable beauté de notre planète bleue."}<\/script>' ./index.html

sed -i '' -e '/<\/head>/i\
	<script type="application/ld+json">{\
        "@context":"https://schema.org",\
        "@graph":[{\
            "@type":"WebSite",\
            "@id":"https://white-house.github.io/#website",\
            "url":"https://white-house.github.io/",\
            "name":"Benoit Maison-Blanche",\
            "description":"Photographe",\
            "potentialAction":[{\
                "@type":"SearchAction",\
                "target":"https://white-house.github.io/?s={search_term_string}",\
            "query-input":"required name=search_term_string"}],\
        "inLanguage":"fr-FR"},{\
            "@type":"ImageObject",\
            "@id":"https://white-house.github.io/'${imagePath}'",\
            "inLanguage":"fr-FR",\
            "url":"https://white-house.github.io/'${imagePath}'",\
            "width":"'${imageWidth}'",\
            "height":"'${imageHeight}'",\
        "caption":"Requin baleine"},{\
            "@type":"WebPage",\
            "@id":"https://white-house.github.io/#webpage",\
            "url":"https://white-house.github.io/",\
            "name":"Benoit Maison-Blanche",\
            "isPartOf":{\
            "@id":"https://white-house.github.io/#website"},\
            "primaryImageOfPage":{\
            "@id":"https://white-house.github.io/'${imagePath}'"},\
            "description":"Avec son époustouflant record d'"'"'apnée, Benoit Maison-Blanche réalise des photos à travers le monde afin de capturer l'"'"'incroyable beauté de notre planète bleue.",\
            "inLanguage":"fr-FR",\
            "potentialAction":[{\
                "@type":"ReadAction",\
            "target":["https://white-house.github.io/"]}]}]}\
    </script>' ./index.html

# Ajout dans le sitemap des images
# Pour toutes les images du site web on récupère le chemin
for file in `egrep -io 'loading="lazy" src=".*" alt' ./index.html | grep -io src=".*g" | cut -c 8-`; do 
	# Si le fichier existe deja dans le sitemap
	if grep -R $file ./sitemap.xml &>/dev/null; then
		# DO NOTHING, FILE ALREADY EXIST
		echo "DO NOTHING" > /dev/null 2>&1;
	else
		# On ajoute le fichier dans le sitemap
		sed -i '' -e '/changefreq/i\
		<image:image><image:loc>https://white-house.github.io/'$file'</image:loc></image:image>' ./sitemap.xml
	fi
# Dans tous les cas on modifie la dernière date de modification du site
today=$(date +%Y-%m-%d)
sed -i '' -e 's/<lastmod>.*<\/lastmod>/<lastmod>'$today'<\/lastmod>/g' ./sitemap.xml
done

echo "##################### Fin du script #####################"
echo "#########################################################"
