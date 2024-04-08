//SIDE BAR FUNCTION
const sideMenu = document.querySelector("aside");
const menuBtn = document.querySelector("#menu-btn");
const closeBtn = document.querySelector("#close-btn");
const themeToggle = document.querySelector(".theme-toggle");

//show sidebar
menuBtn.addEventListener("click", function(){
    sideMenu.style.display = "block";
});

//hide sidebar
closeBtn.addEventListener("click", function(){
    sideMenu.style.display = "none";
});

//change theme
themeToggle.addEventListener("click", () => {
    document.body.classList.toggle("dark-theme-variables");

    themeToggle.querySelector(".bx:nth-child(1)").classList.toggle("active");
    themeToggle.querySelector(".bx:nth-child(2)").classList.toggle("active");
});
