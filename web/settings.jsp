<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Settings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #ffafbd, #ffc3a0);
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .settings-container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 400px;
            text-align: center;
        }

        h2 {
            color: #444;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-group input:focus {
            border-color: #ff7e5f;
            outline: none;
        }

        .save-btn {
            background-color: #ff7e5f;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        .save-btn:hover {
            background-color: #ff6a47;
        }

        .back-link {
            display: block;
            margin-top: 15px;
            font-size: 14px;
            text-decoration: none;
            color: #888;
        }

        .back-link:hover {
            color: #555;
        }
    </style>
</head>
<body>
    <div class="settings-container">
        <h2>Settings</h2>

        <!-- Change Password -->
        <form action="ChangePasswordServlet" method="POST">
            <div class="form-group">
                <label for="currentPassword">Current Password</label>
                <input type="password" id="currentPassword" name="currentPassword" required>
            </div>
            <div class="form-group">
                <label for="newPassword">New Password</label>
                <input type="password" id="newPassword" name="newPassword" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm New Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            <button type="submit" class="save-btn">Save Changes</button>
        </form>

        <!-- Back to Dashboard -->
        <a href="inventory.jsp" class="back-link">Back to Dashboard</a>
    </div>
</body>
</html>
