<%@ page import="dao.CustomerDao" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("login.jsp?error=SessionExpired");
        return;
    }
%>

<%
String error = request.getParameter("error");
String success = request.getParameter("success");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #fddb92, #d1fdff);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            max-width: 800px;
            width: 100%;
            background: white;
            padding: 20px;
            margin: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
            font-weight: 300;
            margin-bottom: 20px;
        }
        .message {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            text-align: center;
            width: 100%;
        }
        .message.error {
            background-color: #f8d7da;
            color: #721c24;
        }
        .message.success {
            background-color: #d4edda;
            color: #155724;
        }
        p {
            background: #fafafa;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
        }
        form {
            background: #fafafa;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            width: 100%;
            max-width: 500px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }
        input[type="number"], input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }
        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #fddb92;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 16px;
        }
        button:hover {
            background-color: #fcbf52;
        }
        #logoutForm button {
            background-color: #dc3545;
        }
        #logoutForm button:hover {
            background-color: #c82333;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Welcome, <%= customer.getFullName() %></h1>
    <% if (error != null) { %>
        <p class="message error">
            <% if ("PasswordsMismatch".equals(error)) { %>
                New passwords do not match.
            <% } else if ("InvalidCurrentPassword".equals(error)) { %>
                Current password is incorrect.
            <% } else if ("PasswordChangeFailed".equals(error)) { %>
                Failed to change password. Please try again.
            <% } %>
        </p>
    <% } %>

    <% if ("PasswordChanged".equals(success)) { %>
        <p class="message success">Password changed successfully.</p>
    <% } %>
    <p>Account Number: <%= customer.getAccountNo() %></p>
    <p>Balance: <%= customer.getBalance() %></p>

    <form action="CustomerController" method="post">
        <input type="hidden" name="action" value="deposit">
        <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
        <label for="amount">Deposit Amount:</label>
        <input type="number" id="amount" name="amount" required>
        <button type="submit">Deposit</button>
    </form>

    <form action="CustomerController" method="post">
        <input type="hidden" name="action" value="withdraw">
        <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
        <label for="amount">Withdraw Amount:</label>
        <input type="number" id="withdrawAmount" name="amount" required>
        <button type="submit">Withdraw</button>
    </form>

    <form action="CustomerController" method="post">
        <input type="hidden" name="action" value="viewTransactions">
        <button type="submit">View Transactions</button>
    </form>

    <form action="CustomerController" method="post">
        <input type="hidden" name="action" value="changePassword">
        <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
        <label for="currentPassword">Current Password:</label>
        <input type="password" id="currentPassword" name="currentPassword" required>
        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required>
        <label for="confirmPassword">Confirm New Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br>
        <button type="submit">Change Password</button>
    </form>

    <form id="logoutForm" action="CustomerController" method="post">
        <input type="hidden" name="action" value="logout">
        <button type="submit">Logout</button>
    </form>
</div>

</body>
</html>
