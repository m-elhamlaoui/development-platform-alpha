<%@ page import="java.util.List" %>
<%@ page import="com.syndic.beans.Supplier" %>


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
        <br><br><br><br><br><br>
        <div class="max-w-screen-xl mx-auto px-4 md:px-6">
            <div class="items-start justify-between md:flex">
                <div class="max-w-lg">
                    <h3 class="text-light-800 text-xl font-bold sm:text-2xl">
                        Suppliers
                    </h3>
                </div>
                <div class="mt-3 md:mt-0">
                    <button id="addSupplierBtn"
                            class="inline-block px-4 py-2 text-white duration-150 font-medium bg-indigo-600 rounded-lg hover:bg-indigo-500 active:bg-indigo-700 md:text-sm btn">
                        Add Supplier
                    </button>
                </div>
            </div>
            <div class="mt-12 shadow-sm border rounded-lg overflow-x-auto">
                <table class="w-full table-auto text-sm text-left" id="tablehiden">
                    <!-- Table headers -->
                    <thead class="bg-gray-50 text-gray-600 font-medium border-b">
                    <tr>
                        <th class="py-3 px-6">Name</th>
                        <th class="py-3 px-6">Email</th>
                        <th class="py-3 px-6">Phone</th>
                        <th class="py-3 px-6">Type</th>
                        <th class="py-3 px-6">Active</th>
                        <th class="py-3 px-6">Rating</th>
                        <th class="py-3 px-6">Supplier_S_ID</th>
                        <th class="py-3 px-6">All Action</th>
                    </tr>
                    </thead>
                    <!-- Table body -->
                    <tbody class="text-gray-600 divide-y">
                    <!-- Use Java forEach loop to iterate over the list of payments -->
                    <% List<Supplier> suppliers = (List<Supplier>) request.getAttribute("suppliers"); %>
                    <% if (suppliers != null && !suppliers.isEmpty()) { %>
                    <% for (Supplier supplier : suppliers) { %>
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap"><%= supplier.getSupplier_name() %>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= supplier.getSupplier_email() %>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= supplier.getSupplier_phone() %>
                        </td>
                        <td class="text-right px-6 whitespace-nowrap"><%= supplier.getSupplier_type() %>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= supplier.isSupplier_active() %>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= supplier.getSupplier_rating()%>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= supplier.getSupplier_s_id()%>
                        </td>
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
            <div id="SupplierForm" class="form hidden">
                <form id="supplierFormElement" class="grid grid-cols-2 gap-6" action="addsupplier" method="post">
                    <div class="col-span-2">
                        <label for="supplier_name" class="block text-sm font-medium text-light-700">Name:</label>
                        <input type="text" id="supplier_name" name="supplier_name" required
                               class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                    </div>
                    <div class="col-span-2">
                        <label for="supplier_email" class="block text-sm font-medium text-light-700">Email:</label>
                        <input type="email" id="supplier_email" name="supplier_email" required
                               class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                    </div>
                    <div class="col-span-2">
                        <label for="supplier_phone" class="block text-sm font-medium text-light-700">Phone:</label>
                        <input type="String" id="supplier_phone" name="supplier_phone" required
                               class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                    </div>
                    <div class="col-span-2">
                        <label for="supplier_type" class="block text-sm font-medium text-light-700">Type:</label>
                        <select id="supplier_type" name="supplier_type" required
                                class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            <option value="service">Service</option>
                        </select>
                    </div>
                    <div class="col-span-2">
                        <label for="supplier_active" class="block text-sm font-medium text-light-700">Active:</label>
                        <select id="supplier_active" name="supplier_active" required
                                class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            <option value="true" selected>Yes</option>
                            <option value="false">No</option>
                        </select>
                    </div>
                    <div class="col-span-2">
                        <label for="supplier_rating" class="block text-sm font-medium text-light-700">Rating:</label>
                        <select id="supplier_rating" name="supplier_rating" required
                                class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            <option value="excellent">Excellent</option>
                            <option value="good">Good</option>
                            <option value="average">Average</option>
                            <option value="poor">Poor</option>
                        </select>
                    </div>
                    <div class="col-span-2">
                        <label for="supplier_s_id" class="block text-sm font-medium text-light-700">Supplier_S ID:</label>
                        <input type="number" id="supplier_s_id" name="supplier_s_id"
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


</div>
</body>
<script src="javascript/main.js"></script>
<script>

    var addSupplierBtn = document.getElementById('addSupplierBtn');
    var SupplierForm = document.getElementById('SupplierForm');
    var tablehiden = document.getElementById('tablehiden');


    addSupplierBtn.addEventListener('click', function () {
        SupplierForm.classList.remove('hidden');
        tablehiden.classList.add('hidden');
    });

</script>
</html>