<%@ page import="com.syndic.dao.UserDAO" %>
<%@ page import="com.syndic.dao.UserDAOImpl" %>
<%@ page import="com.syndic.connection.Syndic_con" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.syndic.dao.TaskDAO" %>
<%@ page import="com.syndic.dao.TaskDAOImpl" %>
<%@ page import="com.syndic.dao.IncidentDAO" %>
<%@ page import="com.syndic.dao.IncidentDAOImpl" %>
<%@ page import="com.syndic.dao.SupplierDAO" %>
<%@ page import="com.syndic.dao.SupplierDAOImpl" %>
<%@ page import="com.syndic.dao.PaymentDAO" %>
<%@ page import="com.syndic.dao.PaymentDAOImpl" %>
<%@ page import="com.syndic.dao.MemberProfileDAO" %>
<%@ page import="com.syndic.dao.MemberProfileDAOImpl" %>
<%
    int userCount = 0;
    int taskCount=0;
    int incidentCount=0;
    int supplierCount=0;
    float sumpayment=0;
    int memberCount = 0;

    Connection connection = null;

    try {
        connection = Syndic_con.getConnection();
        UserDAO userDao = new UserDAOImpl(connection);
        userCount = userDao.getUserCount();
        TaskDAO taskDAO = new TaskDAOImpl(connection);
        taskCount=taskDAO.getTaskCount();
        IncidentDAO incidentDAO = new IncidentDAOImpl(connection);
        incidentCount=incidentDAO.getIncidentCount();
        SupplierDAO supplierDAO = new SupplierDAOImpl(connection);
        supplierCount=supplierDAO.getSupplierCount();
        PaymentDAO paymentDAO = new PaymentDAOImpl(connection);
        sumpayment=paymentDAO.getPaymentSum();
        MemberProfileDAO memberProfileDAO = new MemberProfileDAOImpl(connection);
        memberCount=memberProfileDAO.getMemberCount();

    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Tailwind Admin Starter Template : Tailwind Toolbox</title>
    <meta name="author" content="name">
    <meta name="description" content="description here">
    <meta name="keywords" content="keywords,here">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
    <link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/> <!--Replace with your tailwind.css once created-->
    <link href="https://afeld.github.io/emoji-css/emoji.css" rel="stylesheet"> <!--Totally optional :) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js" integrity="sha256-xKeoJ50pzbUGkpQxDYHD7o7hxe0LaOGeguUidbq6vis=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
</head>

<body >

<div class="flex">
    <!-- Side Nav -->
    <div class="w-1/7 m-4">
        <jsp:include page="templates/syndic_sidenav.jsp" />
    </div>
    <div class="w-6/7">
<main>

    <div class="flex flex-col md:flex-row">

        <section>
            <div id="main" class="main-content flex-1  mt-12 md:mt-2 pb-24 md:pb-5">

                <h1 class=" m-4">Dashboard</h1>
                <div class="date m-4">
                    <%=java.time.LocalDate.now()%>
                </div>

                <div class="flex flex-wrap">
                    <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                        <!--Metric Card-->
                        <div class="bg-gradient-to-b from-green-200 to-green-100 border-b-4 border-green-600 rounded-lg shadow-xl p-5">
                            <div class="flex flex-row items-center">
                                <div class="flex-shrink pr-4">
                                    <div class="rounded-full p-5 bg-green-600"><i class="fa fa-wallet fa-2x fa-inverse"></i></div>
                                </div>
                                <div class="flex-1 text-right md:text-center">
                                    <h2 class="font-bold uppercase text-gray-600">Total Revenue</h2>
                                    <p class="font-bold text-3xl"><%=sumpayment%> <span class="text-green-500"><i class="fas fa-caret-up"></i></span></p>
                                </div>
                            </div>
                        </div>
                        <!--/Metric Card-->
                    </div>
                    <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                        <!--Metric Card-->
                        <div class="bg-gradient-to-b from-pink-200 to-pink-100 border-b-4 border-pink-500 rounded-lg shadow-xl p-5">
                            <div class="flex flex-row items-center">
                                <div class="flex-shrink pr-4">
                                    <div class="rounded-full p-5 bg-pink-600"><i class="fas fa-users fa-2x fa-inverse"></i></div>
                                </div>
                                <div class="flex-1 text-right md:text-center">
                                    <h2 class="font-bold uppercase text-gray-600">Total Users</h2>
                                    <p class="font-bold text-3xl"><%= userCount %> <span class="text-pink-500"><i class="fas fa-exchange-alt"></i></span></p>
                                </div>
                            </div>
                        </div>
                        <!--/Metric Card-->
                    </div>
                    <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                        <!--Metric Card-->
                        <div class="bg-gradient-to-b from-yellow-200 to-yellow-100 border-b-4 border-yellow-600 rounded-lg shadow-xl p-5">
                            <div class="flex flex-row items-center">
                                <div class="flex-shrink pr-4">
                                    <div class="rounded-full p-5 bg-yellow-600"><i class="fas fa-exclamation-triangle fa-2x fa-inverse"></i></div>
                                </div>
                                <div class="flex-1 text-right md:text-center">
                                    <h2 class="font-bold uppercase text-gray-600">Total Incidents</h2>
                                    <p class="font-bold text-3xl"><%= incidentCount %> <span class="text-yellow-600"><i class="fas fa-caret-up"></i></span></p>
                                </div>
                            </div>
                        </div>
                        <!--/Metric Card-->
                    </div>
                    <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                        <!--Metric Card-->
                        <div class="bg-gradient-to-b from-blue-200 to-pink-100 border-b-4 border-blue-500 rounded-lg shadow-xl p-5">
                            <div class="flex flex-row items-center">
                                <div class="flex-shrink pr-4">
                                    <div class="rounded-full p-5 bg-red-600"><i class="fas fa-users fa-2x fa-inverse"></i></div>
                                </div>
                                <div class="flex-1 text-right md:text-center">
                                    <h2 class="font-bold uppercase text-gray-600">Total Members</h2>
                                    <p class="font-bold text-3xl"><%= memberCount %></p>
                                </div>
                            </div>
                        </div>
                        <!--/Metric Card-->
                    </div>
                    <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                        <!--Metric Card-->
                        <div class="bg-gradient-to-b from-indigo-200 to-indigo-100 border-b-4 border-indigo-500 rounded-lg shadow-xl p-5">
                            <div class="flex flex-row items-center">
                                <div class="flex-shrink pr-4">
                                    <div class="rounded-full p-5 bg-indigo-600"><i class="fas fa-tasks fa-2x fa-inverse"></i></div>
                                </div>
                                <div class="flex-1 text-right md:text-center">
                                    <h2 class="font-bold uppercase text-gray-600">To Do List</h2>
                                    <p class="font-bold text-3xl"><%= taskCount %> tasks</p>
                                </div>
                            </div>
                        </div>
                        <!--/Metric Card-->
                    </div>
                    <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                        <!--Metric Card-->
                        <div class="bg-gradient-to-b from-yellow-200 to-blue-100 border-b-4 border-blue-600 rounded-lg shadow-xl p-5">
                            <div class="flex flex-row items-center">
                                <div class="flex-shrink pr-4">
                                    <div class="rounded-full p-5 bg-blue-600"><i class="fas fa-user-plus fa-2x fa-inverse"></i></div>
                                </div>
                                <div class="flex-1 text-right md:text-center">
                                    <h2 class="font-bold uppercase text-gray-600">Total Suppliers</h2>
                                    <p class="font-bold text-3xl"><%= supplierCount %> <span class="text-yellow-600"><i class="fas fa-caret-up"></i></span></p>
                                </div>
                            </div>
                        </div>
                        <!--/Metric Card-->
                    </div>
                </div>


                <div class="flex flex-row flex-wrap flex-grow mt-2">

                    <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                        <!--Graph Card-->
                        <div class="bg-white border-transparent rounded-lg shadow-xl">
                            <div class="bg-gradient-to-b from-gray-300 to-gray-100 uppercase text-gray-800 border-b-2 border-gray-300 rounded-tl-lg rounded-tr-lg p-2">
                                <h class="font-bold uppercase text-gray-600">Graph</h>
                            </div>
                            <div class="p-5">
                                <canvas id="chartjs-7" class="chartjs" width="undefined" height="undefined"></canvas>
                                <script>
                                    new Chart(document.getElementById("chartjs-7"), {
                                        "type": "bar",
                                        "data": {
                                            "labels": ["January", "February", "March", "April"],
                                            "datasets": [{
                                                "label": "Page Impressions",
                                                "data": [10, 20, 30, 40],
                                                "borderColor": "rgb(255, 99, 132)",
                                                "backgroundColor": "rgba(255, 99, 132, 0.2)"
                                            }, {
                                                "label": "Adsense Clicks",
                                                "data": [5, 15, 10, 30],
                                                "type": "line",
                                                "fill": false,
                                                "borderColor": "rgb(54, 162, 235)"
                                            }]
                                        },
                                        "options": {
                                            "scales": {
                                                "yAxes": [{
                                                    "ticks": {
                                                        "beginAtZero": true
                                                    }
                                                }]
                                            }
                                        }
                                    });
                                </script>
                            </div>
                        </div>
                        <!--/Graph Card-->
                    </div>

                    <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                        <!--Graph Card-->
                        <div class="bg-white border-transparent rounded-lg shadow-xl">
                            <div class="bg-gradient-to-b from-gray-300 to-gray-100 uppercase text-gray-800 border-b-2 border-gray-300 rounded-tl-lg rounded-tr-lg p-2">
                                <h2 class="font-bold uppercase text-gray-600">Graph</h2>
                            </div>
                            <div class="p-5">
                                <canvas id="chartjs-0" class="chartjs" width="undefined" height="undefined"></canvas>
                                <script>
                                    new Chart(document.getElementById("chartjs-0"), {
                                        "type": "line",
                                        "data": {
                                            "labels": ["January", "February", "March", "April", "May", "June", "July"],
                                            "datasets": [{
                                                "label": "Views",
                                                "data": [65, 59, 80, 81, 56, 55, 40],
                                                "fill": false,
                                                "borderColor": "rgb(75, 192, 192)",
                                                "lineTension": 0.1
                                            }]
                                        },
                                        "options": {}
                                    });
                                </script>
                            </div>
                        </div>
                        <!--/Graph Card-->
                    </div>

                    <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                        <!--Graph Card-->
                        <div class="bg-white border-transparent rounded-lg shadow-xl">
                            <div class="bg-gradient-to-b from-gray-300 to-gray-100 uppercase text-gray-800 border-b-2 border-gray-300 rounded-tl-lg rounded-tr-lg p-2">
                                <h2 class="font-bold uppercase text-gray-600">Graph</h2>
                            </div>
                            <div class="p-5">
                                <canvas id="chartjs-1" class="chartjs" width="undefined" height="undefined"></canvas>
                                <script>
                                    new Chart(document.getElementById("chartjs-1"), {
                                        "type": "bar",
                                        "data": {
                                            "labels": ["January", "February", "March", "April", "May", "June", "July"],
                                            "datasets": [{
                                                "label": "Likes",
                                                "data": [65, 59, 80, 81, 56, 55, 40],
                                                "fill": false,
                                                "backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)", "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)", "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)"],
                                                "borderColor": ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)", "rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)", "rgb(201, 203, 207)"],
                                                "borderWidth": 1
                                            }]
                                        },
                                        "options": {
                                            "scales": {
                                                "yAxes": [{
                                                    "ticks": {
                                                        "beginAtZero": true
                                                    }
                                                }]
                                            }
                                        }
                                    });
                                </script>
                            </div>
                        </div>
                        <!--/Graph Card-->
                    </div>



                    <div class="w-full md:w-1/2 xl:w-1/3 p-6">
                        <!--Table Card-->
                        <div class="bg-white border-transparent rounded-lg shadow-xl">

                        </div>
                        <!--/table Card-->
                    </div>

                </div>
            </div>
        </section>
    </div>
</main>
    </div>
</div>


<script>
    document.getElementById("dashboard").classList.add("active");
</script>


<script>
    /*Toggle dropdown list*/
    function toggleDD(myDropMenu) {
        document.getElementById(myDropMenu).classList.toggle("invisible");
    }
    /*Filter dropdown options*/
    function filterDD(myDropMenu, myDropMenuSearch) {
        var input, filter, ul, li, a, i;
        input = document.getElementById(myDropMenuSearch);
        filter = input.value.toUpperCase();
        div = document.getElementById(myDropMenu);
        a = div.getElementsByTagName("a");
        for (i = 0; i < a.length; i++) {
            if (a[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
                a[i].style.display = "";
            } else {
                a[i].style.display = "none";
            }
        }
    }
    // Close the dropdown menu if the user clicks outside of it
    window.onclick = function(event) {
        if (!event.target.matches('.drop-button') && !event.target.matches('.drop-search')) {
            var dropdowns = document.getElementsByClassName("dropdownlist");
            for (var i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (!openDropdown.classList.contains('invisible')) {
                    openDropdown.classList.add('invisible');
                }
            }
        }
    }
</script>
<script>
    document.getElementById("s_dashboard").classList.add("active");
</script>

</body>

</html>