<%@page import="bean.RegisterDao"%>
<%@page import="bean.register"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Listing</title>
</head>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    .edit-form input:not([readonly]) {
        width: 100%;
    }

    .edit-form button {
        margin-top: 8px;
    }
</style>
<body>
    <%
// Check if the user is logged in
if (session.getAttribute("user") == null ) {
    // Redirect to the login page or display an access denied message
    response.sendRedirect("login.jsp");
    return;
}
if(session.getAttribute("role")!="Admin"){
    response.sendRedirect("dashboard.jsp");}
%>

    <table>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>User Name</th>
            <th>Role</th>
            <th>Action</th>
        </tr>
        <% for (register user : RegisterDao.getUserListing()) {%>
        <tr>
            <td><%= user.getFirstName()%></td>
            <td><%= user.getLastName()%></td>
            <td><%= user.getUserName()%></td>
            <td><%= user.getRole()%></td>
            <td>
                <button onclick="editUser('<%= user.getId()%>', '<%= user.getFirstName()%>', '<%= user.getLastName()%>', '<%= user.getUserName()%>', '<%= user.getRole()%>')">Edit</button>
                <form id="deleteForm<%= user.getId() %>" method="post" action="deleteUser.jsp">
                    <input type="hidden" name="id" value="<%= user.getId() %>">
                    <button type="submit" onclick="return confirm('Are you sure you want to delete this user?')">Delete</button>
                </form>
            </td>
        </tr>
        <% }%>
    </table>

    <div id="editFormContainer" style="display: none;">
        <h2>Edit User</h2>
        <form id="editForm" method="post" action="updateUser.jsp">
            <input type ="hidden" id="editUserId" name="id">
            <div>
                <label for="editFirstName">First Name:</label>
                <input type="text" id="editFirstName" name="firstName">
            </div>
            <div>
                <label for="editLastName">Last Name:</label>
                <input type="text" id="editLastName" name="lastName">
            </div>
            <div>
                <label>User Name:</label>
                <input type="text" id="editUserName" name="userName" readonly>
            </div>
            <div>
                <label>Role:</label>
                <input type="text" id="editRole" name="role" readonly>
            </div>
            <button type="submit">Save</button>
            <button type="button" onclick="cancelEdit()">Cancel</button>
        </form>
        
        
        ...

...

    </div>

    <script>
        function editUser(userId, firstName, lastName, userName, role) {
            console.log("Came here");
            // Set the values in the edit form
            document.getElementById('editUserId').value = userId;
            document.getElementById('editFirstName').value = firstName;
            document.getElementById('editLastName').value = lastName;
            document.getElementById('editUserName').value = userName;
            document.getElementById('editRole').value = role;

            // Show the edit form
            document.getElementById('editFormContainer').style.display = 'block';
        }

        function cancelEdit() {
            // Hide the edit form
            document.getElementById('editFormContainer').style.display = 'none';
        }
   </script>