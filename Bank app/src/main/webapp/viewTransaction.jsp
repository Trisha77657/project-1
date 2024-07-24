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
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f0f0f0;
        }
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            max-width: 90%;
            text-align: center;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }
        form {
            display: grid;
            gap: 15px;
            text-align: left;
        }
        label {
            font-weight: bold;
            color: #555;
        }
        input[type="text"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>View Transactions</h1>
        <form action="CustomerController" method="post">
            <input type="hidden" name="action" value="viewTransactions">
            <label for="accountNo">Enter Account No:</label>
            <input type="text" id="accountNo" name="accountNo" required>
            <button type="submit">View Transactions</button>
        </form>
    </div>
</body>
</html>
