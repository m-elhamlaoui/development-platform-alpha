<!DOCTYPE html>
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
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
<div class="container">
    <jsp:include page="templates/admin_sidenav.jsp" />

    <!------------MIDDLE ------------>
    <main>
        <!----------TOP -------->
        <h1>Dashboard</h1>
        <div class="date">
            <%=java.time.LocalDate.now()%>
        </div>

        <!---------INSIGHTS------->
        <div class="insights">
            <!----------SALES BOX---------->
            <div class="sales">
                <i class='bx bx-bar-chart-alt'></i>
                <div class="middle">
                    <div class="left">
                        <h3>Total Sales</h3>
                        <h1>$40,023</h1>
                    </div>
                    <div class="progress">
                        <svg>
                            <circle cx="38" cy="38" r="36"></circle>
                        </svg>
                        <div class="number">
                            <p>81%</p>
                        </div>
                    </div>
                </div>
                <small class="text-muted">Last 24 Hours</small>
            </div>
            <!-----------------END OF SALES---------->

            <!-----------INCOME BOX--------->
            <div class="income">
                <i class='bx bx-line-chart'></i>
                <div class="middle">
                    <div class="left">
                        <h3>Total Income</h3>
                        <h1>$25,023</h1>
                    </div>
                    <div class="progress">
                        <svg>
                            <circle cx="38" cy="38" r="36"></circle>
                        </svg>
                        <div class="number">
                            <p>45%</p>
                        </div>
                    </div>
                </div>
                <small class="text-muted">Last 24 Hours</small>
            </div>
            <!--------------END OF INCOME BOX----->

            <!-----------EXPENSE BOX---------->
            <div class="expense">
                <i class='bx bx-line-chart-down'></i>
                <div class="middle">
                    <div class="left">
                        <h3>Total Expense</h3>
                        <h1>$15,020</h1>
                    </div>
                    <div class="progress">
                        <svg>
                            <circle cx="38" cy="38" r="36"></circle>
                        </svg>
                        <div class="number">
                            <p>21%</p>
                        </div>
                    </div>
                </div>
                <small class="text-muted">Last 24 Hours</small>
            </div>
            <!------------END OF EXPENSE BOX------->
        </div>

        <!-------------ORDERS------------>
        <div class="recent-order">
            <h2>Recent Orders</h2>
            <table>
                <!-------TABLE HEADING------->
                <thead>
                <tr>
                    <!--------TABLE HEAD ROW---->
                    <th>Product Name</th>
                    <th>Product number</th>
                    <th>Payment</th>
                    <th>Status</th>
                    <th></th>
                </tr>
                </thead>
                <!-------TABLE BODY------->
                <tbody>
                <!--  <tr>
                  <td>Playstation PS5</td>
                  <td>84332</td>
                  <td>Due</td>
                  <td class="warning">Pending</td>
                  <td class="primary">Details</td>
                  </tr>
              -->
            </table>
            <a href="#">Show All</a>
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
            <h2>Recent Updates</h2>

            <!------UPDATE BOX----->
            <div class="updates">
                <div class="update">
                    <div class="profile-photo">
                        <img src="./Assets/images/ADii's Devs logo.png" alt="A.O.T">
                    </div>
                    <div class="message">
                        <p><b>A.O.T Brand</b> just received an order to work on a dashboard for SHAMA</p>
                        <small class="text-muted">3 Minutes ago</small>
                    </div>
                </div>

                <div class="update">
                    <div class="profile-photo">
                        <img src="./Assets/images/profile-1.jpg" alt="A.O.T">
                    </div>
                    <div class="message">
                        <p><b>Oluwadare Taye Ayo</b> just received an order to collaborate on a dashboard with AOT Brand</p>
                        <small class="text-muted">16 Minutes ago</small>
                    </div>
                </div>

                <div class="update">
                    <div class="profile-photo">
                        <img src="./Assets/images/pic-4.png">
                    </div>
                    <div class="message">
                        <p><b>Tyler</b> just received an order for Zephyron GPS, Drone</p>
                        <small class="text-muted">18 Minutes ago</small>
                    </div>
                </div>
            </div>
        </div>
        <!-------END OF RECENT UPDATES---->


        <!---------SALES ANAYTICS --------->
        <div class="sales-analytics">
            <h2>Sales Analytics</h2>

            <!-----ONLINE CUSTOMERS----->
            <div class="item online">
                <i class='bx bx-cart-alt'></i>
                <div class="right">
                    <div class="info">
                        <h3>ONLINE ORDERS</h3>
                        <small class="text-muted">Last 24 Hours</small>
                    </div>
                    <h5 class="success">+38%</h5>
                    <h3>2345</h3>
                </div>
            </div>

            <!-----OFFLINE CUSTOMERS----->
            <div class="item offline">
                <i class='bx bx-store' ></i>
                <div class="right">
                    <div class="info">
                        <h3>OFFLINE ORDERS</h3>
                        <small class="text-muted">Last 24 Hours</small>
                    </div>
                    <h5 class="danger">-17%</h5>
                    <h3>1100</h3>
                </div>
            </div>

            <!-----NEW CUSTOMERS----->
            <div class="item customers">
                <i class='bx bx-male-female'></i>
                <div class="right">
                    <div class="info">
                        <h3>NEW CUSTOMERS</h3>
                        <small class="text-muted">Last 24 Hours</small>
                    </div>
                    <h5 class="success">+25%</h5>
                    <h3>897</h3>
                </div>
            </div>
            <!----------ADD PRODUCTS------->
            <div class="item add-product">
                <div>
                    <i class="bx-add"></i>
                    <a href="#"><h3>Add Product</h3></a>
                </div>
            </div>

        </div>
        <!------END OF SALES ANALYTICS------->
    </div>
    <!---------END OF RIGHT------->

</div>
</body>

<script src="javascript/main.js"></script>
</html>