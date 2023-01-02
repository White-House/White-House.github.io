document.getElementById("switch-button").checked = false;
const defaultSpanColor = document.querySelectorAll(".hamburger > span")[0].style.backgroundColor;
const hours = new Date().getHours()
const isDayTime = hours > 7 && hours < 19;
var isNightMode = document.getElementById("switch-button").checked;

addEventListener("scroll", (event) => {
	switchNavBarNightMode();
});

document.getElementsByClassName("navbar-toggler")[0].addEventListener("click", (event) => {
	switchNavBarNightMode();
});

function switchNavBarNightMode() {
	if (window.scrollY <= 0) {
		if (document.getElementById("navbar").classList.toString().split(" ").includes("opened") && isNightMode) {
				setDarkModeOnNavBar();
			} else if (document.getElementById("navbar").classList.toString().split(" ").includes("opened") && !isNightMode) {
				setWhiteModeOnNavBar();
			} else {
				setTransparentNavBar();
	} else {
		if (isNightMode) {
			setDarkModeOnNavBar();
		} else {
			setWhiteModeOnNavBar();
		}
	}
}

/*function switchNavBarNightMode() {
	if (window.scrollY <= 0) {
		setTransparentNavBar();
		setTimeout(function() {
			setTransparentNavBar();
			if (document.getElementById("navbar").classList.toString().split(" ").includes("opened") && isNightMode) {
				setDarkModeOnNavBar();
			}
		}, 1);
	} else {
		if (isNightMode) {
			setDarkModeOnNavBar();
		} else {
			setWhiteModeOnNavBar();
		}
	}
}*/

function setDarkModeOnNavBar() {
	document.getElementById("navbar").classList.remove("bg-color");
	document.getElementById("navbar").classList.remove("white-mode-bar");
	document.getElementById("navbar").classList.add("dark-mode-bar");
}

function setWhiteModeOnNavBar() {
	document.getElementById("navbar").classList.remove("dark-mode-bar");
	document.getElementById("navbar").classList.remove("bg-color");
	document.getElementById("navbar").classList.add("white-mode-bar");
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
		
	var nightMode = document.querySelectorAll("#content4-8, #gallery4-1j, #gallery4-1k, #gallery4-1i, #gallery4-1g, #gallery4-1b, #gallery4-1a, #gallery4-6, #gallery4-p, #gallery4-r, #gallery4-t, #gallery4-w, #gallery4-1c, #gallery4-1d, #gallery4-1e, #content4-d, #testimonials3-c, #social-buttons2-1l, #footer6-b");
	for(var i = 0; i < nightMode.length; ++i) {
		nightMode[i].classList.toggle("dark-mode");
	}
	
	switchNavBarNightMode();
}

if(isDayTime !== true){
	document.getElementById("switch-button").checked = true;
	dayOrNightSelector();
}
