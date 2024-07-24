<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Customer</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: #f0f0f0;
            color: #333;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            text-align: center;
        }
        h1 {
            color: #2196f3;
            margin-bottom: 30px;
            font-size: 24px;
        }
        form {
            display: grid;
            gap: 20px;
            text-align: left;
        }
        label {
            font-weight: bold;
            color: #333;
        }
        input[type="text"], input[type="email"], input[type="date"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #2196f3;
            color: #fff;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0d47a1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Customer Details</h1>
        <% Customer customer = (Customer) request.getAttribute("customer"); %>
        <form action="AdminController" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
            
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" value="<%= customer.getFullName() %>" required>
            
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="<%= customer.getAddress() %>" required>
            
            <label for="mobileNo">Mobile No:</label>
            <input type="text" id="mobileNo" name="mobileNo" value="<%= customer.getMobileNo() %>" required>
            
            <label for="emailId">Email ID:</label>
            <input type="email" id="emailId" name="emailId" value="<%= customer.getEmailId() %>" required>
            
            <label for="accountType">Account Type:</label>
            <input type="text" id="accountType" name="accountType" value="<%= customer.getAccountType() %>" required>
            
            <label for="dateOfBirth">Date of Birth:</label>
            <input type="date" id="dateOfBirth" name="dateOfBirth" value="<%= customer.getDateOfBirth() %>" required>
            
            <label for="idProof">ID Proof:</label>
            <input type="text" id="idProof" name="idProof" value="<%= customer.getIdProof() %>" required>
            
            <input type="submit" value="Update Customer">
        </form>
    </div>
</body>
</html>
