<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Inventory Management System</title>
    <style>
        /* Reset margin and padding for all elements */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Background styling */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #11998e, #38ef7d);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        /* Container styling */
        .container {
            width: 100%;
            max-width: 400px;
        }

        .card {
            width: 100%;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        /* Title styling */
        .title {
            font-size: 24px;
            font-weight: bold;
            color: #8e24aa;
            margin-bottom: 15px;
            text-align: center;
        }

        /* Cartoon/Animation styling */
        .cartoon {
            margin-bottom: 35px;
            margin-left: auto;
            margin-right: auto;
            width: 150px;
            height: 150px;
        }

        .cartoon img {
            width: 100%;
            height: 100%;
        }

        /* Form styling */
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
            transition: border-color 0.3s ease;
        }
        .form-group input::placeholder {
                color: #959595;
                font-size: 14px;
            }

        .form-group input:focus {
            border-color: #8e24aa;
            font-size: 14px;
        }

        /* Sign Up button styling */
        .button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-color: #8e24aa;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-transform: uppercase;
        }

        .button:hover {
            background-color: #7b1fa2;
        }

        /* Footer link styling */
        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #777;
            text-align: center;
        }

        .footer a {
            color: #8e24aa;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="cartoon">
                <img src="https://i.ibb.co/98gpLCQ/l1.png" alt="animation1" id="animation1">
                <img src="https://i.ibb.co/Vq5j4Vg/l2.png" alt="animation2" id="animation2" style="display: none;">
                <img src="https://i.ibb.co/Y0jsj90/l3.png" alt="animation3" id="animation3" style="display: none;">
            </div>

            <div class="title">Create an Account</div>
            <form action="SignUpServlet" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter your username" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
                <div class="form-group">
                    <label for="role">Role</label>
                    <select class="form-control" id="role" name="role" required>
                    <option value="Admin">Admin</option>
                    <option value="User">User</option>
                    </select>
                </div>
                <button type="submit" class="button">Sign Up</button>
            </form>
            <div class="footer">
                Already have an account? <a href="signin.jsp">Sign In</a>
            </div>
        </div>
    </div>

    <script>
        const usernameInput = document.getElementById('username');
        const emailInput = document.getElementById('email');
        const passwordInput = document.getElementById('password');
        const animation1 = document.getElementById('animation1');
        const animation2 = document.getElementById('animation2');
        const animation3 = document.getElementById('animation3');

        // Animation change on focus of the username input
        usernameInput.addEventListener('focus', () => {
            animation1.style.display = "none";
            animation3.style.display = "block";
            animation2.style.display = "none";
        });

        // Animation change on focus of the email input
        emailInput.addEventListener('focus', () => {
            animation1.style.display = "none";
            animation2.style.display = "none";
            animation3.style.display = "block";
        });

        // Animation change on focus of the password input
        passwordInput.addEventListener('focus', () => {
            animation1.style.display = "none";
            animation2.style.display = "block";
            animation3.style.display = "none";
        });

        // Reset animation on blur for all inputs
        const showAnimation1 = () => {
            animation1.style.display = "block";
            animation2.style.display = "none";
            animation3.style.display = "none";
        };

        usernameInput.addEventListener('blur', showAnimation1);
        emailInput.addEventListener('blur', showAnimation1);
        passwordInput.addEventListener('blur', showAnimation1);
    </script>
</body>
</html>
