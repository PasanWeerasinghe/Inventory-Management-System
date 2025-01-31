<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #6a1b9a;
            color: #fff;
            text-align: center;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            margin: 50px auto;
            width: 50%;
            border-radius: 8px;
            color: #333;
        }

        input, textarea, button {
            display: block;
            width: 100%;
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
        }

        button {
            background-color: #6a1b9a;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #4e1173;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Item</h2>
        <form action="EditItemServlet" method="post">
            <input type="hidden" name="itemId" value="${itemId}">
            <input type="text" name="itemName" value="${itemName}" placeholder="Item Name" required>
            <textarea name="description" rows="3" placeholder="Description" required>${description}</textarea>
            <input type="number" name="quantity" value="${quantity}" placeholder="Quantity" required>
            <input type="number" name="price" value="${price}" placeholder="Price" required>
            <button type="submit">Update Item</button>
        </form>
    </div>
</body>
</html>

