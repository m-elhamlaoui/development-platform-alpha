<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DASHBOARD</title>
    <link rel="shortcut icon" href="/Assets/images/logo.png" type="image/x-icon">
    <!---BOX ICON CDN-->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <!----STYLESHEET---->
    <link rel="stylesheet" href="css/style2.css">
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
        <a href="dashboardSyndic.jsp" id="dashboardSyndic">
            <i class='bx bxs-dashboard' ></i>
            <h3>Dashboard</h3>
        </a>

        <a href="syndicprofile" id = "syndicprofile">
            <i class='bx bx-user' ></i>
            <h3>Profile</h3>
        </a>

        <a href="#">
            <i class='bx bx-paper-plane bx-tada' ></i>
            <h3>Messages</h3><span class="message-count">24</span>
        </a>


        <a href="incident" id="incident">
            <i class='bx bxs-crown'></i>
            <h3>Incidents</h3>
        </a>


        <a href="meeting" id="meeting">
            <i class='bx bx-cog bx-flashing' ></i>
            <h3>Meetings</h3>
        </a>


        <a  href="news" id="news" >
            <i class='bx bx-cog bx-flashing' ></i>
            <h3>News-comm</h3>
        </a>

        <a  href="charge" id="charge" >
            <i class='bx bx-cog bx-flashing' ></i>
            <h3>Charges</h3>
        </a>


        <a href="login" id="logout-link">
            <i class='bx bx-log-out-circle'></i>
            <h3>Log Out</h3>
        </a>

    </div>
</aside>
<!---------END OF ASIDE--------->
</body>
</html>
