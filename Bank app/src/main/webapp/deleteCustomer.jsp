<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Customer</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        form {
            max-width: 400px;
            width: 100%;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
        button {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <h1>Delete Customer</h1>
    <form action="AdminController" method="post">
        <input type="hidden" name="action" value="delete">
        <label for="accountNo">Account No:</label>
        <input type="text" id="accountNo" name="accountNo" required>
        <button type="submit">Delete Customer</button>
    </form>
</body>
</html>
