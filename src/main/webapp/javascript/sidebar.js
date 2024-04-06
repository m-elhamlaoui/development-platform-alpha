const toggle = document.querySelector(".toggle-nav");
const sidebar = document.querySelector("aside");

toggle.addEventListener("click", function(){
    sidebar.classList.toggle("show-sidebar");
});