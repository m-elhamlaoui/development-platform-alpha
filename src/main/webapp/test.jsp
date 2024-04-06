<%@ page import="com.syndic.beans.User" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Home</title>

    <!-- inject:css -->
    <link rel="stylesheet" href="css/vertical-layout-light/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="images/plogo2.png" />
</head>
<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <a class="navbar-brand brand-logo mr-5" href="">
                <img src="images/plogo.jpeg" class="mr-2" alt="logo" style="width: 100px; height: auto;">
            </a>
            <a class="navbar-brand brand-logo-mini" href=""><img src="images/logo-mini.svg" alt="logo"/></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                <span class="icon-menu"></span>
            </button>
            <ul class="navbar-nav mr-lg-2">
                <li class="nav-item nav-search d-none d-lg-block">
                    <div class="input-group">
                        <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                <span class="input-group-text" id="search">
                  <i class="icon-search"></i>
                </span>
                        </div>
                        <input type="text" class="form-control" id="navbar-search-input" placeholder="Search now" aria-label="search" aria-describedby="search">
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav navbar-nav-right">

                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                        <img src="images/logo22.png" alt="profile"/>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="supprimerCompte.jsp">
                            <i class="ti-settings text-primary"></i>
                            Supprimer Compte
                        </a>
                        <a href="login.jsp" class="dropdown-item">
                            <i class="ti-power-off text-primary"></i>
                            Logout
                        </a>
                    </div>
                </li>
                <li class="nav-item nav-settings d-none d-lg-flex">
                    <a class="nav-link" href="#">
                        <i class="icon-ellipsis"></i>
                    </a>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                <span class="icon-menu"></span>
            </button>
        </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_settings-panel.html -->
        <div class="theme-setting-wrapper">
            <div id="settings-trigger"><i class="ti-settings"></i></div>
            <div id="theme-settings" class="settings-panel">
                <i class="settings-close ti-close"></i>
                <p class="settings-heading">SIDEBAR SKINS</p>
                <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Light</div>
                <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark</div>
                <p class="settings-heading mt-2">HEADER SKINS</p>
                <div class="color-tiles mx-0 px-4">
                    <div class="tiles success"></div>
                    <div class="tiles warning"></div>
                    <div class="tiles danger"></div>
                    <div class="tiles info"></div>
                    <div class="tiles dark"></div>
                    <div class="tiles default"></div>
                </div>
            </div>
        </div>
        <div id="right-sidebar" class="settings-panel">

            <div class="tab-content" id="setting-content">
                <div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
                    <div class="add-items d-flex px-3 mb-0">

                    </div>

                </div>

                <!-- chat tab ends -->
            </div>
        </div>
        <!-- partial -->
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" href="test.jsp" >
                        <i class="icon-grid menu-icon"></i>
                        <span class="menu-title">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="reclamer">
                        <i class="icon-columns menu-icon"></i>
                        <span class="menu-title">Réclamations</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">
                        <i class="icon-grid-2 menu-icon"></i>
                        <span class="menu-title">Calendrier </span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="">
                        <i class="icon-contract menu-icon"></i>
                        <span class="menu-title">Communauté</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="compte.jsp">
                        <i class="icon-head menu-icon"></i>
                        <span class="menu-title">Profile</span>
                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link" href="blogs.jsp">
                        <i class="icon-paper menu-icon"></i>
                        <span class="menu-title">Blogs </span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="assemblé.jsp">
                        <i class="icon-columns menu-icon"></i>
                        <span class="menu-title">Assemblés Générales </span>
                    </a>



                </li>
            </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-12 grid-margin">
                        <div class="row">
                            <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                                <h3 class="font-weight-bold">Welcome <%= ((User) session.getAttribute("user")).getName() %>!</h3>
                            </div>
                            <div class="col-12 col-xl-4">
                                <div class="justify-content-end d-flex">
                                    <div class="dropdown flex-md-grow-1 flex-xl-grow-0">

                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuDate2">
                                            <a class="dropdown-item" href="#">January - March</a>
                                            <a class="dropdown-item" href="#">March - June</a>
                                            <a class="dropdown-item" href="#">June - August</a>
                                            <a class="dropdown-item" href="#">August - November</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 grid-margin stretch-card">
                        <div class="card tale-bg">
                            <div class="d-flex">
                                <div class="ml-2">

                                    <h4 class="location font-weight-normal"></h4>
                                    <h6 class="font-weight-normal">
                                        <!-- Additional content if needed -->
                                    </h6>

                                    <!-- Add a canvas for the Chart.js graph -->
                                    <canvas id="myChart" width="400" height="200"></canvas>

                                    <script>
                                        // Données du graphique
                                        var data = {
                                            labels: ['1', '2', '3', '4', '5'],
                                            datasets: [
                                                {
                                                    label: 'Valeur 1',
                                                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                                    borderColor: 'rgba(255,99,132,1)',
                                                    borderWidth: 1,
                                                    data: [3, 5, 2, 6, 4]
                                                }
                                            ]
                                        };

                                        // Options du graphique
                                        var options = {
                                            scales: {
                                                x: {
                                                    type: 'linear',
                                                    position: 'bottom'
                                                },
                                                y: {
                                                    beginAtZero: true,
                                                    max: 10
                                                }
                                            }
                                        };

                                        // Récupérer le contexte du canvas
                                        var ctx = document.getElementById('myChart').getContext('2d');

                                        // Créer le graphique
                                        var myChart = new Chart(ctx, {
                                            type: 'line',
                                            data: data,
                                            options: options
                                        });
                                    </script>
                                </div>
                            </div>

                        </div>


                    </div>
                    <div class="col-md-6 grid-margin transparent">
                        <div class="row">
                            <div class="col-md-6 mb-4 stretch-card transparent">
                                <a href="" style="text-decoration: none; color: #87CEEB;">
                                    <div class="card card-tale">
                                        <div class="card-body">
                                            <img src="images/test.png" alt="Test Image" width="50" height="50" class="mb-4">
                                            <h4 class="mb-4"></h2>
                                                <h4 class="mb-4">Questions Frèquentes </h4>
                                                <p>Syndic</p>
                                        </div>

                                    </div>
                                </a>
                            </div>


                            <div class="col-md-6 mb-4 stretch-card transparent">
                                <a href="" style="text-decoration: none; color: #87CEEB;">
                                    <div class="card card-dark-blue">
                                        <div class="card-body">
                                            <img src="images/info.png" alt="Test Image" width="50" height="50" class="mb-4">
                                            <h4 class="mb-4"></h2>
                                                <h4 class="mb-4">Informations a propos de la résidence </h4>
                                                <p>Restez informé </p>
                                        </div>
                                    </div>
                                </a>
                            </div>


                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
                                <a href="" style="text-decoration: none; color: #87CEEB;">
                                    <div class="card card-light-blue">
                                        <div class="card-body">
                                            <img src="images/evolu.png" alt="Test Image" width="50" height="50" class="mb-4">
                                            <h4 class="mb-4">Pain Track</h4>
                                            <p>Découvrez vos charges payés et impayés </p>
                                        </div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-md-6 stretch-card transparent">
                                <a href="" style="text-decoration: none; color: #87CEEB;">
                                    <div class="card card-light-danger">
                                        <div class="card-body">
                                            <img src="images/commu.png" alt="Test Image" width="50" height="50" class="mb-4">
                                            <h4 class="mb-4">Community</h4>
                                            <p>Découvrez la communauté </p>
                                        </div>
                                    </div>

                            </a>
                        </div>
                    </div>
                </div>

</body>

</html>

