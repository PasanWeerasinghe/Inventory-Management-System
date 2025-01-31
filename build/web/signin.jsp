<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Joydip Paul">
    <meta name="description" content="Code snippets and creative web designs by Joydip Paul.">
    <title>Sign In - Inventory Management System</title>
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
    margin: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    background: linear-gradient(135deg, #11998e, #38ef7d);
    color: #333;
}

.container {
    width: 100%;
    max-width: 400px;
    
}

.card {
    width: 100%;
    background-color: rgba(255, 255, 255, 0.9);
    padding: 40px;
    border-radius: 12px;
    border: 1px solid #a7ddf5;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    
    .title {
            font-size: 24px;
            font-weight: bold;
            color: #8e24aa;
            margin-bottom: 15px;
            text-align: center;
        }

    

    .cartoon {
        margin-bottom: 35px;
        margin-left: auto;
        margin-right: auto;
        width: 150px;
        height: 150px;

        img {
            width: 100%;
            height: 100%;
        }
    }

    form {
        display: flex;
        flex-direction: column;
        

        .input-group {
            width: 100%;
            margin-bottom: 14px;
            
            label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
            color: #555;
        }
            

            input {
                padding: 16px;
                border: 1px solid #ddd;
                border-radius: 5px;
                transition: border-color 0.3s ease-in-out;
                outline: none;
                color: #555;
                background-color: #ffffff;
                width: 100% ;
                
            }
            input::placeholder {
                color: #959595;
            }

            input:focus {
                border-color: #8e24aa;
            }
        }

        button {
            background-color: #8e24aa;
            color: #fff;
            padding: 16px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
            font-size: 16px;
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 1px;
            margin-top: 10px;
        }

        button:hover {
            background-color: #7b1fa2;
        }
    }
}

        /* Footer link styling */
        .footer {
            margin-top: 20px;
            font-size: 15px;
            color: #777;
            text-align: center;
        }

        .footer a {
            color: #1976d2;
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
            <img src="https://i.ibb.co.com/98gpLCQ/l1.png" alt="animation1" id="animation1">
            <img src="https://i.ibb.co.com/Vq5j4Vg/l2.png" alt="animation2" id="animation2" style="display: none;">
            <img src="https://i.ibb.co.com/Y0jsj90/l3.png" alt="animation3" id="animation3" style="display: none;">
        </div>
        
        <!-- Modified form structure -->
        <div class="title">Sign In</div>
        <form action="SignInServlet" method="post">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            
            <button type="submit" class="button">Sign In</button>
        </form>

        <div class="footer">
            Don't have an account? <a href="signup.jsp">Sign Up</a>
        </div>
    </div>
</div>
    <script>
    const usernameInput = document.getElementById('username');
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

// Animation change on focus of the password input
passwordInput.addEventListener('focus', () => {
    animation1.style.display = "none";
    animation2.style.display = "block";
    animation3.style.display = "none";
});

// Reset animation on blur for both username and password inputs
const showAnimation1 = () => {
    animation1.style.display = "block";
    animation2.style.display = "none";
    animation3.style.display = "none";
};

usernameInput.addEventListener('blur', showAnimation1);
passwordInput.addEventListener('blur', showAnimation1);

</script>
</body>
</html>
