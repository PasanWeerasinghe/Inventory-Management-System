<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 400px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #ff5722;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-size: 14px;
            color: #333;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        textarea:focus {
            border-color: #ff5722;
            outline: none;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
        }

        .btn {
            padding: 10px 20px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 48%;
            color: white;
        }

        .btn-submit {
            background-color: #ff5722;
        }

        .btn-submit:hover {
            background-color: #e64a19;
        }

        .btn-update {
            background-color: #607d8b;
        }

        .btn-back:hover {
            background-color: #455a64;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Add New Inventory Item</h2>

    <!-- Display Success/Error Message -->
    <%
        String message = request.getParameter("message");
        if (message != null) {
    %>
    <div style="color: green; font-weight: bold; text-align: center; margin-bottom: 15px;">
        <%= message %>
    </div>
    <%
        }
    %>

    <form action="AddItemServlet" method="post">
        <!-- Form fields for item name, description, quantity, and price -->
        <div class="form-group">
            <label for="itemName">Item Name</label>
            <input type="text" id="itemName" name="itemName" required>
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" rows="3" required></textarea>
        </div>

        <div class="form-group">
            <label for="quantity">Quantity</label>
            <input type="number" id="quantity" name="quantity" min="0" required>
        </div>

        <div class="form-group">
            <label for="price">Price</label>
            <input type="number" id="price" name="price" step="0.01" min="0" required>
        </div>

        <div class="button-group">
            <button type="submit" class="btn btn-submit" >Add Item</button>
            <a href="inventory.jsp" class="btn btn-update">Back to Dashboard</a>
            
        </div>
    </form>
</div>

</body>
</html>
