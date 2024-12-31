document.getElementById("switch-button").checked = false;
const defaultSpanColor = document.querySelectorAll(".hamburger > span")[0].style.backgroundColor;
const hours = new Date().getHours()
const isDayTime = hours > 7 && hours < 19;
var isNightMode = document.getElementById("switch-button").checked;

var animationFrame = document.getElementById("animation-wallpaper");
animationFrame.src = "./assets/snow/snow.html";
		
addEventListener("scroll", (event) => {
	switchNavBarNightMode();
});

document.getElementsByClassName("navbar-toggler")[0].addEventListener("click", (event) => {
	switchNavBarNightMode();
});

function switchNavBarNightMode() {
	if (window.scrollY <= 0) {
		setTimeout(function() {
		if (document.getElementById("navbar").classList.toString().split(" ").includes("opened") && isNightMode == true) {
				setDarkModeOnNavBar();
			} else if (document.getElementById("navbar").classList.toString().split(" ").includes("opened") && isNightMode == false) {
				setWhiteModeOnNavBar();
			} else {
				setTransparentNavBar();
			}
		}, 1);
	} else {
		if (isNightMode) {
			setDarkModeOnNavBar();
		} else {
			setWhiteModeOnNavBar();
		}
	}
}

function setDarkModeOnNavBar() {
	document.getElementById("navbar").classList.remove("bg-color");
	document.getElementById("navbar").classList.remove("white-mode-bar");
	document.getElementById("navbar").classList.add("dark-mode-bar");
	document.getElementById("textDescription").classList.add("testimonial-text-dark-mode");
	document.getElementById("textDescription").classList.remove("testimonial-text");
	document.getElementById("textLivre").classList.add("testimonial-text-dark-mode");
	document.getElementById("textLivre").classList.remove("testimonial-text");

}

function setWhiteModeOnNavBar() {
	document.getElementById("navbar").classList.remove("dark-mode-bar");
	document.getElementById("navbar").classList.remove("bg-color");
	document.getElementById("navbar").classList.add("white-mode-bar");
	document.getElementById("textDescription").classList.add("testimonial-text");
	document.getElementById("textDescription").classList.remove("testimonial-text-dark-mode");
	document.getElementById("textLivre").classList.add("testimonial-text");
	document.getElementById("textLivre").classList.remove("testimonial-text-dark-mode");
}

function setTransparentNavBar() {
	document.getElementById("navbar").classList.add("bg-color");
	document.getElementById("navbar").classList.remove("dark-mode-bar");
	document.getElementById("navbar").classList.remove("white-mode-bar");
}

function dayOrNightSelector() {
	isNightMode = document.getElementById("switch-button").checked;
	document.getElementById("header2-1").classList.toggle("dark-mode-wallpaper");

	var textTitle = document.querySelectorAll(".nav-link");
	for (var i = 0; i < textTitle.length; i++) {
		textTitle[i].classList.toggle("text-black");
	}

	var spanList = document.querySelectorAll(".hamburger > span"); 
	for (var i = 0; i < spanList.length; i++) {
		if (spanList[i].style.backgroundColor === defaultSpanColor) {
			spanList[i].style.backgroundColor = "#f3f4f6";
		} else {
			spanList[i].style.backgroundColor = defaultSpanColor;
		}
	}
		
	var nightMode = document.querySelectorAll("#content4-8, #gallery4-1r, #gallery4-1p, #gallery4-1n, #gallery4-1j, #gallery4-1k, #gallery4-1i, #gallery4-1g, #gallery4-1b, #gallery4-1a, #gallery4-6, #gallery4-p, #gallery4-r, #gallery4-t, #gallery4-w, #gallery4-1c, #gallery4-1d, #gallery4-1e, #content4-d, #testimonials3-c, #social-buttons2-1l, #footer6-b, #content4-1u, #header3-1t");
	for(var i = 0; i < nightMode.length; ++i) {
		nightMode[i].classList.toggle("dark-mode");
	}
	
	if (isNightMode) {
		animationFrame.src = "./assets/bubble/bubble.html";
		document.getElementById("logo").src="./assets/images/benoit-maison-blanche_white.png";
		document.getElementById("body").classList.add("body-background-dark");
		document.getElementById("body").classList.remove("body-background-white");
	} else {
		animationFrame.src = "./assets/snow/snow.html";
		document.getElementById("logo").src="./assets/images/benoit-maison-blanche_black.png";
		document.getElementById("body").classList.add("body-background-white");
		document.getElementById("body").classList.remove("body-background-dark");
	}
	
	switchNavBarNightMode();
}

if(isDayTime !== true){
	document.getElementById("switch-button").checked = true;
	dayOrNightSelector();
}
