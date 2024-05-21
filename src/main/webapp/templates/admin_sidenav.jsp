
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
    <link rel="stylesheet" href="css/style2.css">
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
<!-----------ASIDE------------->
<aside>
    <div class="sidebar">
        <div class="logo">
            <h2>E-<span class="danger">Syndic</span></h2>
        </div>
        <div class="close" id="close-btn">
            <i class='bx bx-x'></i>
        </div>
        <!--Menu-->
        <div class="menu">
            <div class="item"><a href="#" id=""><i class='bx bxs-dashboard'></i>
                <h3>Dashboard</h3></a></div>
            <div class="item"><a href="addsyndic" id="addsyndic"><i class='bx bx-user'></i>
                <h3>Add Syndic</h3></a></div>
            <div class="item"><a href="addmember" id="addmember"><i class='bx bx-file'></i>
                <h3>Add Members</h3></a></div>
            <div class="item"><a href="#" id="analytics"><i class='bx bx-line-chart-down'></i>
                <h3>Analytics</h3></a></div>
            <div class="item"><a href="#" id="messages"><i class='bx bx-paper-plane bx-tada'></i>
                <h3>Messages</h3><span class="message-count">24</span></a></div>
            <div class="item"><a href="addpayment" id="addpayment"><i class='fas fa-money-bill-wave'></i>
                <h3>Payment</h3></a></div>
            <div class="item"><a href="addsupplier" id="addsupplier"><i class='bx bxs-group'></i>
                <h3>Suppliers</h3></a></div>
            <div class="item"><a href="addtask" id="addtask"><i class='bx bx-task'></i>
                <h3>Tasks</h3></a></div>
            <div class="item"><a href="#" id="reports"><i class='bx bxs-crown'></i>
                <h3>Reports</h3></a></div>
            <div class="item"><a href="#" id="settings"><i class='bx bx-cog bx-flashing'></i>
                <h3>Settings</h3></a></div>
            <div class="item"><a href="login" id="logout-link"><i class='bx bx-log-out-circle'></i>
                <h3>Log Out</h3></a></div>
        </div>
    </div>

</aside>
<!---------END OF ASIDE--------->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</body>
</html>
