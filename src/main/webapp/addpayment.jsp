<%@ page import="java.util.List" %>
<%@ page import="com.syndic.beans.Payment" %>
<%@ page import="java.text.SimpleDateFormat" %>


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
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
<div class="container">
    <jsp:include page="templates/admin_sidenav.jsp" />

    <!------------MIDDLE ------------>
    <main>
        <br><br><br><br><br><br>
        <div class="max-w-screen-xl mx-auto px-4 md:px-6">
            <div class="items-start justify-between md:flex">
                <div class="max-w-lg">
                    <h3 class="text-light-800 text-xl font-bold sm:text-2xl">
                        Members Payment
                    </h3>
                </div>
                <div class="mt-3 md:mt-0">
                    <button id="addPaymentBtn"
                            class="inline-block px-4 py-2 text-white duration-150 font-medium bg-indigo-600 rounded-lg hover:bg-indigo-500 active:bg-indigo-700 md:text-sm btn">
                        Add Payment
                    </button>
                </div>
            </div>
            <div class="mt-12 shadow-sm border rounded-lg overflow-x-auto">
                <table class="w-full table-auto text-sm text-left" id="tablehiden">
                    <!-- Table headers -->
                    <thead class="bg-gray-50 text-gray-600 font-medium border-b">
                    <tr>
                        <th class="py-3 px-6">code</th>
                        <th class="py-3 px-6">date</th>
                        <th class="py-3 px-6">amount</th>
                        <th class="py-3 px-6">method</th>
                        <th class="py-3 px-6">type</th>
                        <th class="py-3 px-6">account_id</th>
                        <th class="py-3 px-6">member_id</th>
                        <th class="py-3 px-6">status</th>
                        <th class="py-3 px-6">All Action</th>
                    </tr>
                    </thead>
                    <!-- Table body -->
                    <tbody class="text-gray-600 divide-y">
                    <!-- Use Java forEach loop to iterate over the list of payments -->
                    <% List<Payment> payments = (List<Payment>) request.getAttribute("payments"); %>
                    <% if (payments != null && !payments.isEmpty()) { %>
                    <% for (Payment payment : payments) { %>
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap"><%= payment.getCode() %>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= payment.getDate() %>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= payment.getAmount() %>
                        </td>
                        <td class="text-right px-6 whitespace-nowrap"><%= payment.getMethod() %>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= payment.getType() %>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= payment.getAccount_id() %>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= payment.getMember_id() %>
                        </td>
                        <td class="py-3 px-6 whitespace-nowrap"><%= payment.getStatus() %>
                        </td>
                        <td class="text-right px-4 whitespace-nowrap">
                            <button class="editPaymentBtn py-2 px-3 font-medium text-indigo-600 hover:text-indigo-500 duration-150 hover:bg-gray-50 rounded-lg">
                                Edit
                            </button>
                            <button class="deletePaymentBtn py-2 leading-none px-3 font-medium text-red-600 hover:text-red-500 duration-150 hover:bg-gray-50 rounded-lg">
                                Delete
                            </button>
                        </td>
                    </tr>
                    <% } %>
                    <% } else { %>
                    <tr>
                        <td colspan="9" class="px-6 py-4">No payments available at the moment.</td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

            <!-- Formulaire d'ajout -->
            <div id="PaymentForm" class="form hidden">
                <form id="transactionFormElement" class="grid grid-cols-2 gap-6" action="addpayment" method="post">
                    <div class="col-span-2 sm:col-span-1">
                        <label for="code" class="block text-sm font-medium text-light-700">Code:</label>
                        <input type="number" id="code" name="code" required
                               class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                    </div>
                    <div class="col-span-2 sm:col-span-1">
                        <label for="date" class="block text-sm font-medium text-light-700">Date:</label>
                        <input type="date" id="date" name="date" value="<%=java.time.LocalDate.now()%>"
                               class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-light-300 rounded-md">
                    </div>
                    <div class="col-span-2 sm:col-span-1">
                        <label for="amount" class="block text-sm font-medium text-light-700">Amount:</label>
                        <input type="number" id="amount" name="amount" required
                               class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                    </div>
                    <div class="col-span-2 sm:col-span-1">
                        <label for="method" class="block text-sm font-medium text-light-700">Method:</label>
                        <input type="text" id="method" name="method" required
                               class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                    </div>
                    <div class="col-span-2">
                        <label for="type" class="block text-sm font-medium text-light-700">Type:</label>
                        <input type="text" id="type" name="type" required
                               class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                    </div>
                    <div class="col-span-2 sm:col-span-1">
                        <label for="account_id" class="block text-sm font-medium text-light-700">Account ID:</label>
                        <input type="number" id="account_id" name="account_id" required
                               class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                    </div>
                    <div class="col-span-2 sm:col-span-1">
                        <label for="member_id" class="block text-sm font-medium text-light-700">Member ID:</label>
                        <input type="number" id="member_id" name="member_id" required
                               class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                    </div>
                    <div class="col-span-2">
                        <label for="status" class="block text-sm font-medium text-light-700">Status:</label>
                        <input type="text" id="status" name="status" required
                               class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                    </div>
                    <div class="col-span-2 flex justify-end">
                        <button type="submit"
                                class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            Add
                        </button>
                    </div>
                </form>
            </div>
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
<script>
    // Récupération des éléments boutons et formulaires
    var addPaymentBtn = document.getElementById('addPaymentBtn');
    var editPaymentBtn = document.getElementById('editPaymentBtn');
    var deletePaymentBtn = document.getElementById('deletePaymentBtn');
    var PaymentForm = document.getElementById('PaymentForm');
    var tablehiden = document.getElementById('tablehiden');

    // Gestionnaires d'événements pour les clics sur les boutons
    addPaymentBtn.addEventListener('click', function () {
        PaymentForm.classList.remove('hidden');
        tablehiden.classList.add('hidden');
    });
</script>
</html>