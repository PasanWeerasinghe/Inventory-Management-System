<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Logging Out...</title>
    <meta http-equiv="refresh" content="2;url=signin.jsp" />
    <script type="text/javascript">
        // This JavaScript will run when the page is loaded
        window.onload = function() {
            // Display an alert message
            alert("You have been logged out successfully.");
        };
    </script>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            color: #333;
            text-align: center;
        }

        .message {
            font-size: 20px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="message">
        <p>You have been logged out successfully.</p>
        <p>Redirecting to the sign-in page...</p>
    </div>

    <%
        // Get the current session, if one exists
//        HttpSession session = request.getSession(false); // Get the current session without creating a new one
//        
        if (session != null) {
            // Invalidate the session to log out the user
            session.invalidate();
        }

        // Redirect to the sign-in page after logout
        response.sendRedirect("index.jsp");
    %>

</body>
</html>
