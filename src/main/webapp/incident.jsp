<%@ page import="com.syndic.beans.Syndic" %>
<%@ page import="com.syndic.beans.Meeting" %>
<%@ page import="java.util.List" %>
<%@ page import="com.syndic.beans.Incident" %>
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
    <jsp:include page="templates/syndic_sidenav.jsp" />

    <!------------MIDDLE ------------>
    <main>
        <!----------TOP -------->
        <h1>Dashboard</h1>
        <div class="date">
            <input type="date">
        </div>

        <!-- component -->
        <div class="flex items-center justify-center p-12">
            <h2 class="text-xl font-semibold mb-2">Incident Form</h2>
            <!-- Author: FormBold Team -->
            <!-- Learn More: https://formbold.com -->
            <div class="mx-auto w-full max-w-[550px]">
                <form action="incident" method="POST">
                    <input type="hidden" name="action" value="addIncident">
                    <div class="-mx-3 flex flex-wrap">
                        <div class="w-full px-3 sm:w-1/2">
                            <div class="mb-5">
                                <label
                                        for="incident_type"
                                        class="mb-2 block text-base font-medium "
                                >
                                    Incident Type
                                </label>
                                <input
                                        type="text"
                                        name="incident_type"
                                        id="incident_type"
                                        placeholder="Incident Type"
                                        class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
                                />
                            </div>
                        </div>
                        <div class="w-full px-3 sm:w-1/2">
                            <div class="mb-5">
                                <label
                                        for="incident_description"
                                        class="mb-3 block text-base font-medium "
                                >
                                    Incident Description
                                </label>
                                <input
                                        type="text"
                                        name="incident_description"
                                        id="incident_description"
                                        placeholder="Type"
                                        class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="mb-5">
                        <label
                                for="incident_status"
                                class="mb-3 block text-base font-medium "
                        >
                            incident_status
                        </label>
                        <input
                                type="text"
                                name="incident_status"
                                id="incident_status"
                                placeholder="What the meet is about"
                                class="w-full appearance-none rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
                        />
                    </div>
                    <div class="flex justify-end">
                        <button
                                class="hover:shadow-form rounded-md bg-[#6A64F1] py-3 px-8 text-center text-base font-semibold text-white outline-none"
                        >
                            Submit
                        </button>
                    </div>
                    <div>

                    </div>
                </form>
            </div>
        </div>
        <% String successMessage = (String) request.getSession().getAttribute("successMessage"); %>
        <% if (successMessage != null) {  %>
        <script> alert('<%= successMessage %>');</script>
        <% request.getSession().removeAttribute("successMessage");} %>

        <!---------INSIGHTS------->
        <div class="flex justify-between">
        <div class=" w-1/2 bg-white rounded-lg overflow-hidden shadow-lg">
            <div class="px-6 py-4">
                <h2 class="text-xl font-semibold mb-2">Meeting Form</h2>

            </div>
        </div>
            <!-- component -->
            <div class="w-1/2 flex items-center justify-center p-12">
                <!-- Author: FormBold Team -->
                <!-- Learn More: https://formbold.com -->
                <div class="mx-auto w-full max-w-[550px] bg-white">
                    <form
                            class="py-6 px-9"
                            action="https://formbold.com/s/FORM_ID"
                            method="POST"
                    >
                        <div class="mb-5">
                            <label
                                    for="email"
                                    class="mb-3 block text-base font-medium text-[#07074D]"
                            >
                                Send files to this email:
                            </label>
                            <input
                                    type="email"
                                    name="email"
                                    id="email"
                                    placeholder="example@domain.com"
                                    class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
                            />
                        </div>

                        <div class="mb-6 pt-4">
                            <label class="mb-5 block text-xl font-semibold text-[#07074D]">
                                Upload File
                            </label>

                            <div class="mb-8">
                                <input type="file" name="file" id="file" class="sr-only" />
                                <label
                                        for="file"
                                        class="relative flex min-h-[200px] items-center justify-center rounded-md border border-dashed border-[#e0e0e0] p-12 text-center"
                                >
                                    <div>
              <span class="mb-2 block text-xl font-semibold text-[#07074D]">
                Drop files here
              </span>
                                        <span class="mb-2 block text-base font-medium text-[#6B7280]">
                Or
              </span>
                                        <span
                                                class="inline-flex rounded border border-[#e0e0e0] py-2 px-7 text-base font-medium text-[#07074D]"
                                        >
                Browse
              </span>
                                    </div>
                                </label>
                            </div>

                            <div class="mb-5 rounded-md bg-[#F5F7FB] py-4 px-8">
                                <div class="flex items-center justify-between">
            <span class="truncate pr-3 text-base font-medium text-[#07074D]">
              banner-design.png
            </span>
                                    <button class="text-[#07074D]">
                                        <svg
                                                width="10"
                                                height="10"
                                                viewBox="0 0 10 10"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                    fill-rule="evenodd"
                                                    clip-rule="evenodd"
                                                    d="M0.279337 0.279338C0.651787 -0.0931121 1.25565 -0.0931121 1.6281 0.279338L9.72066 8.3719C10.0931 8.74435 10.0931 9.34821 9.72066 9.72066C9.34821 10.0931 8.74435 10.0931 8.3719 9.72066L0.279337 1.6281C-0.0931125 1.25565 -0.0931125 0.651788 0.279337 0.279338Z"
                                                    fill="currentColor"
                                            />
                                            <path
                                                    fill-rule="evenodd"
                                                    clip-rule="evenodd"
                                                    d="M0.279337 9.72066C-0.0931125 9.34821 -0.0931125 8.74435 0.279337 8.3719L8.3719 0.279338C8.74435 -0.0931127 9.34821 -0.0931123 9.72066 0.279338C10.0931 0.651787 10.0931 1.25565 9.72066 1.6281L1.6281 9.72066C1.25565 10.0931 0.651787 10.0931 0.279337 9.72066Z"
                                                    fill="currentColor"
                                            />
                                        </svg>
                                    </button>
                                </div>
                            </div>

                            <div class="rounded-md bg-[#F5F7FB] py-4 px-8">
                                <div class="flex items-center justify-between">
            <span class="truncate pr-3 text-base font-medium text-[#07074D]">
              banner-design.png
            </span>
                                    <button class="text-[#07074D]">
                                        <svg
                                                width="10"
                                                height="10"
                                                viewBox="0 0 10 10"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                    fill-rule="evenodd"
                                                    clip-rule="evenodd"
                                                    d="M0.279337 0.279338C0.651787 -0.0931121 1.25565 -0.0931121 1.6281 0.279338L9.72066 8.3719C10.0931 8.74435 10.0931 9.34821 9.72066 9.72066C9.34821 10.0931 8.74435 10.0931 8.3719 9.72066L0.279337 1.6281C-0.0931125 1.25565 -0.0931125 0.651788 0.279337 0.279338Z"
                                                    fill="currentColor"
                                            />
                                            <path
                                                    fill-rule="evenodd"
                                                    clip-rule="evenodd"
                                                    d="M0.279337 9.72066C-0.0931125 9.34821 -0.0931125 8.74435 0.279337 8.3719L8.3719 0.279338C8.74435 -0.0931127 9.34821 -0.0931123 9.72066 0.279338C10.0931 0.651787 10.0931 1.25565 9.72066 1.6281L1.6281 9.72066C1.25565 10.0931 0.651787 10.0931 0.279337 9.72066Z"
                                                    fill="currentColor"
                                            />
                                        </svg>
                                    </button>
                                </div>
                                <div class="relative mt-5 h-[6px] w-full rounded-lg bg-[#E2E5EF]">
                                    <div
                                            class="absolute left-0 right-0 h-full w-[75%] rounded-lg bg-[#6A64F1]"
                                    ></div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <button
                                    class="hover:shadow-form w-full rounded-md bg-[#6A64F1] py-3 px-8 text-center text-base font-semibold text-white outline-none"
                            >
                                Send File
                            </button>
                        </div>
                    </form>
                </div>
            </div>




        </div>
        <div class="  m-6 flex items-center justify-center bg-gray-100 font-sans mx-auto w-full">
            <label for="dropzone-file" class="mx-auto cursor-pointer flex w-full max-w-lg flex-col items-center rounded-xl border-2 border-dashed border-blue-400 bg-white p-6 text-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10 text-blue-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12" />
                </svg>

                <h2 class="mt-4 text-xl font-medium text-gray-700 tracking-wide">Payment File</h2>

                <p class="mt-2 text-gray-500 tracking-wide">Upload or drag & drop your file SVG, PNG, JPG, or GIF.</p>

                <input id="dropzone-file" type="file" class="hidden" />
            </label>
        </div>


        <!--
  Heads up! 👋

  This component comes with some `rtl` classes. Please remove them if they are not needed in your project.
-->

        <div class="overflow-x-auto">
            <table class="min-w-full divide-y-2 divide-gray-200 bg-white text-sm">
                <thead class="ltr:text-left rtl:text-right">
                <tr>
                    <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">Name</th>
                    <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">Date of Birth</th>
                    <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">Role</th>
                    <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">Salary</th>
                    <th class="px-4 py-2"></th>
                </tr>
                </thead>

                <tbody class="divide-y divide-gray-200">
                <tr>
                    <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">John Doe</td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">24/05/1995</td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">Web Developer</td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">$120,000</td>
                    <td class="whitespace-nowrap px-4 py-2">
                        <a
                                href="#"
                                class="inline-block rounded bg-indigo-600 px-4 py-2 text-xs font-medium text-white hover:bg-indigo-700"
                        >
                            View
                        </a>
                    </td>
                </tr>

                <tr>
                    <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">Jane Doe</td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">04/11/1980</td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">Web Designer</td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">$100,000</td>
                    <td class="whitespace-nowrap px-4 py-2">
                        <a
                                href="#"
                                class="inline-block rounded bg-indigo-600 px-4 py-2 text-xs font-medium text-white hover:bg-indigo-700"
                        >
                            View
                        </a>
                    </td>
                </tr>

                <tr>
                    <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">Gary Barlow</td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">24/05/1995</td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">Singer</td>
                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">$20,000</td>
                    <td class="whitespace-nowrap px-4 py-2">
                        <a
                                href="#"
                                class="inline-block rounded bg-indigo-600 px-4 py-2 text-xs font-medium text-white hover:bg-indigo-700"
                        >
                            View
                        </a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>



        <h1 class="text-3xl font-bold mb-4">List of Incidents</h1>
        <div class="mb-4 relative">
            <input type="text" id="filter" class="form-input border-gray-300 rounded-md shadow-sm pl-10 pr-4 py-2 w-full" placeholder="Filter Residence Meeting" onkeyup="filterMeetings()">
            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                <svg class="h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M6 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm8 6a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm3-6a7 7 0 1 1-14 0 7 7 0 0 1 14 0z" clip-rule="evenodd" />
                </svg>
            </div>
        </div>

        <div class="grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-2">
                <%
                    List<Incident> listIncidents = (List<Incident>) session.getAttribute("list_Incidents");
                    if (listIncidents != null) {
                        for (Incident incident : listIncidents) {
                %>
                <div class="bg-white overflow-hidden shadow-sm rounded-lg">
                    <div class="p-6">
                        <h2 class="flex items-center justify-between text-xl font-semibold mb-4 cursor-pointer" onclick="toggleDetails(this)">
                            <span> Incident N°<%= incident.getIncidentId() %></span>
                            <svg class="h-6 w-6 fill-current text-gray-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                <path d="M10 15l-5-5h10z"/>
                            </svg>

                        </h2>
                        <div class="hidden bg-gray-100 shadow-md rounded-lg p-4 mb-4">
                            <div class="flex flex-wrap -mx-2">
                                <div class="w-full md:w-1/2 px-2 mb-4 md:mb-0">
                                    <p class="text-gray-800"><strong>Incident ID:</strong> <%= incident.getIncidentId() %></p>
                                    <p class="text-gray-800"><strong>Date:</strong> <%= incident.getIncidentDate() %></p>

                                </div>
                                <div class="w-full md:w-1/2 px-2">
                                    <p class="text-gray-800"><strong>Status:</strong> <%= incident.getIncidentStatus() %></p>
                                    <p class="text-gray-800"><strong>Type:</strong> <%= incident.getIncidentType() %></p>
                                </div>
                            </div>
                            <div class="w-full px-2 mt-4">
                                <strong class="text-gray-800 block mb-2">IncidentDescription:</strong>
                                <div class="bg-white rounded-lg shadow-md p-4">
                                    <%= incident.getIncidentDescription() %>
                                </div>
                            </div>

                            <div class="w-full px-2 mt-4">
                                <strong class="text-gray-800 block mb-2">Type:</strong>
                                <div class="bg-white rounded-lg shadow-md p-4">
                                    <%= incident.getIncidentResolutionDate() %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Bouton "Modifier" pour chaque réunion -->
                    <button onclick="toggleEditForm(<%= incident.getIncidentSId() %>)" class="m-4 px-4 py-2 text-lg font-medium text-white bg-indigo-600 rounded-md hover:bg-indigo-700 focus:outline-none focus:bg-indigo-700">Edit</button>

                    <!-- Bouton "Imprimer" -->
                    <a onclick="printMeetingDetails(<%= incident.getIncidentSId() %>)" class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none" href="#">
                        <svg class="flex-shrink-0 size-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 6 2 18 2 18 9"/><path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"/><rect width="12" height="8" x="6" y="14"/></svg>
                        Print
                    </a>



                    <!-- Formulaire de modification de la conclusion -->
                    <form id="editForm_<%= incident.getIncidentSId() %>" class="edit-form hidden" action="meeting" method="post">
                        <input type="hidden" name="action" value="editIncident">
                        <input type="hidden" name="meetingId" value="<%= incident.getIncidentSId() %>">
                        <label for="newStatus_<%= incident.getIncidentSId() %>" class="block mb-2 text-base font-medium text-gray-700">Incident Status:</label>
                        <div class="relative">
                            <textarea id="newStatus_<%= incident.getIncidentSId() %>" name="newStatus" rows="4" class="w-full px-3 py-2 text-base text-gray-700 placeholder-gray-600 border rounded-md focus:outline-none focus:border-indigo-500 focus:shadow-outline-indigo resize-none"></textarea>
                        </div>
                        <div class="flex justify-end mt-4">
                            <button type="submit" class="ml-auto px-6 py-2 text-lg font-medium text-white bg-indigo-600 rounded-md hover:bg-indigo-700 focus:outline-none focus:bg-indigo-700">Save</button>
                        </div>
                    </form>
                </div>

                <%
                        }
                    }
                %>
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
                    <p>Hey, <b><%= ((Syndic) session.getAttribute("syndic")).getFirstName() %></b></p>
                    <small class="text-muted">Syndic</small>
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
<script>
    document.getElementById("incident").classList.add("active");
</script>
<script>
    function filterMeetings() {
        var input, filter, meetings, meeting, txtValue, i;
        input = document.getElementById("filter");
        filter = input.value.toUpperCase();
        meetings = document.querySelectorAll(".grid > div");
        for (i = 0; i < meetings.length; i++) {
            meeting = meetings[i].querySelector("h2");
            txtValue = meeting.textContent || meeting.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                meetings[i].style.display = "";
            } else {
                meetings[i].style.display = "none";
            }
        }
    }

    function toggleDetails(element) {
        var details = element.nextElementSibling;
        details.classList.toggle("hidden");
    }

    <!-- JavaScript pour afficher/cacher les formulaires de modification -->
        function toggleEditForm(incidentId) {
        var editForm = document.getElementById("editForm_" + incidentId);
        if (editForm.classList.contains("hidden")) {
        editForm.classList.remove("hidden");
    } else {
        editForm.classList.add("hidden");
    }
    }

    function printMeetingDetails(incidentId) {

        window.open("meetingPrint.jsp?meetingId=" + incidentId, "_blank");
    }







</script>



</body>

<script src="javascript/main.js"></script>
</html>