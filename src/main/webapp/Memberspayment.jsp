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

</head>

<body>

<div class="container">
    <jsp:include page="templates/admin_sidenav.jsp"/>

    <!------------MIDDLE ------------>
    <main>

        <!----------TOP -------->
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
                        <th class="py-3 px-6"></th>
                    </tr>
                    </thead>
                    <tbody class="text-gray-600 divide-y">
                    <template>
                        <tr>
                            <td
                                    class="flex items-center gap-x-3 py-3 px-6 whitespace-nowrap"
                            >
                                <img :src="item.avatar" class="w-10 h-10 rounded-full"/>
                                <div>
                <span
                        class="block text-gray-700 text-sm font-medium"
                        x-text="item.name"
                ></span>
                                    <span
                                            class="block text-gray-700 text-xs"
                                            x-text="item.email"
                                    ></span>
                                </div>
                            </td>
                            <td
                                    class="px-6 py-4 whitespace-nowrap"
                                    x-text="item.phone_nimber"
                            ></td>
                            <td
                                    class="px-6 py-4 whitespace-nowrap"
                                    x-text="item.position"
                            ></td>
                            <td
                                    class="px-6 py-4 whitespace-nowrap"
                                    x-text="item.salary"
                            ></td>
                            <td class="text-right px-6 whitespace-nowrap">
                                <button id="editPaymentBtn"
                                        class="py-2 px-3 font-medium text-indigo-600 hover:text-indigo-500 duration-150 hover:bg-gray-50 rounded-lg btn">
                                    Edit
                                </button>
                                <button id="deletePaymentBtn"
                                        class="py-2 leading-none px-3 font-medium text-red-600 hover:text-red-500 duration-150 hover:bg-gray-50 rounded-lg">
                                    Delete
                                </button>
                            </td>
                        </tr>
                    </template>
                    </tbody>
                </table>
            </div>

            <!-- Formulaire de Paiement -->
            <div id="PaymentForm" class="form hidden">
                <form id="transactionFormElement" method="post" action="">
                    <label for="code">Code:</label>
                    <input type="text" id="code" name="code" required><br><br>

                    <label for="date">Date:</label>
                    <input type="date" id="date" name="date" required><br><br>

                    <label for="amount">Amount:</label>
                    <input type="number" id="amount" name="amount" required><br><br>

                    <label for="method">Method:</label>
                    <input type="text" id="method" name="method" required><br><br>

                    <label for="type">Type:</label>
                    <input type="text" id="type" name="type" required><br><br>

                    <label for="account_id">Account ID:</label>
                    <input type="number" id="account_id" name="account_id" required><br><br>

                    <label for="member_id">Member ID:</label>
                    <input type="number" id="member_id" name="member_id" required><br><br>

                    <label for="status">Status:</label>
                    <input type="text" id="status" name="status" required><br><br>

                    <button type="submit">Save</button>
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

    </div>
    <!---------END OF RIGHT------->

</div>
<script>
    // Récupération des éléments boutons et formulaires
    var addPaymentBtn = document.getElementById('addPaymentBtn');
    var editPaymentBtn = document.getElementById('editPaymentBtn');
    var deletePaymentBtn = document.getElementById('deletePaymentBtn');
    var PaymentForm = document.getElementById('PaymentForm');
    var editPaymentForm = document.getElementById('editPaymentForm');
    var tablehiden = document.getElementById('tablehiden');

    // Gestionnaires d'événements pour les clics sur les boutons
    addPaymentBtn.addEventListener('click', function () {
        PaymentForm.classList.remove('hidden');
        editPaymentForm.classList.add('hidden');
        tablehiden.classList.add('hidden');
    });

    editPaymentBtn.addEventListener('click', function () {
        editPaymentForm.classList.remove('hidden');
        PaymentForm.classList.add('hidden');
        tablehiden.classList.add('hidden');
    });

    deletePaymentBtn.addEventListener('click', function () {
        // Ajoutez votre logique de suppression ici
    });
</script>
</body>
<script src="https://cdn.tailwindcss.com"></script>
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
