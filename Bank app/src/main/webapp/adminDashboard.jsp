<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.CustomerDao"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Customer"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        /* Reset default margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(120deg, #f6d365 0%, #fda085 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 0;
        }
        
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 2rem auto;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        }
        
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 2rem;
            font-weight: 300;
            letter-spacing: 2px;
        }
        
        .action-buttons {
            display: flex;
            justify-content: space-around;
            margin-bottom: 2rem;
        }
        
        .btn {
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 25px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
            display: inline-block;
            text-transform: uppercase;
        }
        
        .btn-primary { background-color: #f6d365; }
        .btn-primary:hover { background-color: #f6ad55; }
        .btn-danger { background-color: #f88f01; }
        .btn-danger:hover { background-color: #e3601c; }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 2rem;
            background-color: #fff;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: #f6d365;
            color: white;
            text-transform: uppercase;
        }
        
        tr { background-color: #fff8dc; }
        
        tr:hover { background-color: #fff4c6; }
        
        .btn-table {
            padding: 0.4rem 1rem;
            font-size: 0.9rem;
            border-radius: 15px;
            border: none;
            background-color: #f6d365;
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .btn-table:hover {
            background-color: #f6ad55;
        }
        
        /* Responsive adjustments */
        @media screen and (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            .btn {
                padding: 0.6rem 1rem;
            }
            .btn-table {
                padding: 0.3rem 0.8rem;
                font-size: 0.8rem;
            }
        }
        
        @media screen and (max-width: 480px) {
            h1 {
                font-size: 1.5rem;
            }
            .btn {
                padding: 0.5rem 0.8rem;
                font-size: 0.9rem;
            }
            .btn-table {
                padding: 0.3rem 0.6rem;
                font-size: 0.7rem;
            }
            table {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        
        <div class="action-buttons">
            <a href="createCustomer.jsp" class="btn btn-primary">Create Customer</a>
            <a href="deleteCustomer.jsp" class="btn btn-primary">Delete Customer</a>
            <form action="LogoutController" method="post">
                <button type="submit" class="btn btn-danger">Logout</button>
            </form>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Account No</th>
                    <th>Full Name</th>
                    <th>Email ID</th>
                    <th>Account Type</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                CustomerDao customerDao = new CustomerDao();
                List<Customer> customers = customerDao.getAllCustomers();
                for (Customer customer : customers) {
                %>
                <tr>
                    <td><%= customer.getAccountNo() %></td>
                    <td><%= customer.getFullName() %></td>
                    <td><%= customer.getEmailId() %></td>
                    <td><%= customer.getAccountType() %></td>
                    <td>
                        <form action="AdminController" method="post">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
                            <button type="submit" class="btn btn-table">Edit</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
