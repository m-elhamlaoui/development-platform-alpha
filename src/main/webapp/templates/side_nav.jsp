<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sidebar Navigation</title>
    <!-- Favicon -->
    <!-- <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"> -->
    <!-- CSS -->
    <link rel="stylesheet" href="./css/style.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>

<aside>
    <div class="aside-container">
        <div class="logo">
            <i class="fas fa-building"></i>
            <h1>Syndic</h1>
        </div>
        <div class="dashboard">
            <span class="material-symbols-outlined">grid_view</span>

            <h3> <a href="register" > dashboard </a></h3>
        </div>
        <div class="user">
            <span class="material-symbols-outlined">person</span>
            <h3>  <a href="" > user </a> </h3>
        </div>
        <div class="message">
            <span class="material-symbols-outlined">chat</span>
            <h3> <a href="" > message </a></h3>
        </div>
        <div class="bookmark">
            <span class="material-symbols-outlined">bookmark</span>
            <h3> <a href="" > bookmark </a> </h3>
        </div>
        <div class="files">
            <span class="material-symbols-outlined">folder</span>
            <h3> <a href="" > files </a> </h3>
        </div>
        <div class="stats">
            <span class="material-symbols-outlined">trending_up</span>
            <h3> <a href="" > stats </a> </h3>
        </div>
    </div>
</aside>
<main>
    <header class="container">
        <div class="logo">
            <i class="fas fa-building"></i>
            <h1>Syndic</h1>
        </div>
        <div class="toggle-nav">
            <i class="fa-solid fa-bars"></i>
        </div>
    </header>
</main>

<script src="./javascript/sidebar.js"></script>
</body>
</html>