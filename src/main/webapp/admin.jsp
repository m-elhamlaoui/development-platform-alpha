<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DASHBOARD</title>
    <link rel="shortcut icon" href="/Assets/images/logo.png" type="image/x-icon">
    <!---BOX ICON CDN-->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <!----STYLESHEET---->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
<div class="container">
    <jsp:include page="templates/admin_sidenav.jsp" />

    <!------------MIDDLE ------------>
    <main>
        <!----------TOP -------->
        <h1>Dashboard</h1>
        <div class="date">
            <input type="date">
        </div>

        <!---------INSIGHTS------->
        <div class="insights">
                <h1>ADMIN</h1>
        </div>

    </main>
    <!-------------END OF MIDDLE --------->


    <!---------RIGHT--------->
    <div class="right">

        <!--------TOP-->
        <div class="top">
            <!---MENU ICON-->
            <button id="menu-btn">
                <i class='bx bx-menu'></i>
            </button>

            <!------LIGHT AND DARK THEME BUTTONS-->
            <div class="theme-toggle">
                <i class='bx bx-sun active'></i>
                <i class='bx bx-moon'></i>
            </div>
            <div class="profile">
                <div class="info">
                    <p>Hey, <b>Ayo</b></p>
                    <small class="text-muted">Admin</small>
                </div>
                <div class="profile-photo">
                    <img src="./Assets/images/profile-1.jpg" alt="Oluwadare Taye Ayo">
                </div>
            </div>
        </div>
        <!-------END OF TOP------>

        <!---------RECENT UPDATES------>
        <div class="recent-updates">

        </div>
        <!-------END OF RECENT UPDATES---->


    </div>
    <!---------END OF RIGHT------->

</div>
</body>
<script src="javascript/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $('.sub-btn').click(function () {
            $(this).next('.sub-menu').slideToggle();
            $(this).find('.dropdown').toggleClass('rotate');
        });
    });
</script>
</html>