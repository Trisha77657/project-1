<%@ page import="java.util.List" %>
<%@ page import="model.Transaction" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Transactions</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
        }
        td {
            background-color: #f9f9f9;
        }
        a {
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s;
        }
        a:hover {
            color: #0056b3;
        }
        .no-transaction {
            text-align: center;
            margin-top: 20px;
            color: #555;
        }
    </style>
</head>
<body>

<div class="container">

    <%
        List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");

        if (transactions == null || transactions.isEmpty()) {
    %>
        <h1>No transactions found.</h1>
    <%
        } else {
    %>
        <h1>Transaction History</h1>
        <table>
            <tr>
                <th>Transaction ID</th>
                <th>Account No</th>
                <th>Amount</th>
                <th>Transaction Type</th>
                <th>Transaction Date</th>
            </tr>
    <%
            for (Transaction transaction : transactions) {
    %>
            <tr>
                <td><%= transaction.getTransactionId() %></td>
                <td><%= transaction.getAccountNo() %></td>
                <td><%= transaction.getAmount() %></td>
                <td><%= transaction.getTransactionType() %></td>
                <td><%= transaction.getTransactionDate() %></td>
            </tr>
    <%
            }
    %>
        </table>
    <%
        }
    %>

    <p class="no-transaction"><a href="customerDashboard.jsp">Back to Dashboard</a></p>

</div>

</body>
</html>
