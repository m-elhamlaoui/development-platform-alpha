
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DASHBOARD</title>
    <link rel="shortcut icon" href="/Assets/images/logo.png" type="image/x-icon">
    <!---BOX ICON CDN-->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <!----STYLESHEET---->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
<!-----------ASIDE------------->
<aside>
    <div class="top">

        <div class="logo">
            <h2>E-<span class="danger">Syndic</span></h2>
        </div>
        <div class="close" id="close-btn">
            <i class='bx bx-x'></i>
        </div>
    </div>

    <!----------SIDEBAR---------->
    <div class="sidebar">
        <a href="#" id="">
            <i class='bx bxs-dashboard' ></i>
            <h3>Dashboard</h3>
        </a>

        <a href="addsyndic"id="addsyndic">
            <i class='bx bx-user' ></i>
            <h3>Add Syndic</h3>
        </a>

        <a href="addmember" id="addmember">
            <i class='bx bx-file'></i>
            <h3>Add Members</h3>
        </a>

        <a href="#" id="analytics">
            <i class='bx bx-line-chart-down'></i>
            <h3>Analytics</h3>
        </a>

        <a href="#" id="messages">
            <i class='bx bx-paper-plane bx-tada' ></i>
            <h3>Messages</h3><span class="message-count">24</span>
        </a>

        <a href="#" id="acounting">
            <i class='bx bxs-crown'></i>
            <h3>Accounting</h3>
            <span id="toggleArrow" class="bx bx-caret-down"></span> <!-- Ajout de la flèche -->
        </a>
        <div id="additionalLinks" style="display: none;"> <!-- Div pour les liens supplémentaires -->
            <a href="#">Link 1</a>
            <a href="#">Link 2</a>
            <!-- Ajoutez autant de liens que nécessaire -->
        </div>

        <a href="#" id="reports">
            <i class='bx bxs-crown'></i>
            <h3>Reports</h3>
        </a>

        <a href="#" id="settings">
            <i class='bx bx-cog bx-flashing' ></i>
            <h3>Settings</h3>
        </a>

        <a href="#">
            <i class='bx bx-log-out-circle'></i>
            <h3>Log Out</h3>
        </a>

    </div>
</aside>
<!---------END OF ASIDE--------->

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var toggleArrow = document.getElementById("toggleArrow");
        var additionalLinks = document.getElementById("additionalLinks");

        toggleArrow.addEventListener("click", function() {
            if (additionalLinks.style.display === "none") {
                additionalLinks.style.display = "block";
                toggleArrow.classList.remove("bx-caret-right");
                toggleArrow.classList.add("bx-caret-down");
            } else {
                additionalLinks.style.display = "none";
                toggleArrow.classList.remove("bx-caret-down");
                toggleArrow.classList.add("bx-caret-right");
            }
        });
    });
</script>
</body>
</html>
