<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="test.FlashMessage" %>

<%
String flash = FlashMessage.get(session);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<style>


/* Toast container styling */
.toast-container {
    position: fixed;
    top: 1rem;
    right: 1rem;
    z-index: 1055;
}
</style>
</head>
<body>


<%
    // Read success message from session
    String successMsg = (String) session.getAttribute("loginSuccess");
    if (successMsg != null) {
        session.removeAttribute("loginSuccess"); // Remove after reading
%>
<div id="flashPopup" class="flash-popup"></div>

<script>
window.onload = function () {

    let msg = `<%= flash == null ? "" : flash %>`;

    if (msg.trim() !== "") {
        const popup = document.getElementById("flashPopup");
        popup.innerText = msg;
        popup.style.display = "block";

        setTimeout(() => {
            popup.style.opacity = "0";
            setTimeout(()=> popup.remove(), 400);
        }, 2500);
    }
};

</script>

<div class="toast-container">
    <div class="toast show text-bg-success shadow rounded-3" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-body">
            <i class="bi bi-check-circle-fill me-2"></i>
            <%= successMsg %>
        </div>
    </div>
</div>

<script>
    // Auto-remove toast after 2.5 seconds
    setTimeout(() => {
        const toast = document.querySelector(".toast");
        if (toast) toast.remove();
    }, 2500);
</script>
<% } %>

<!-- Main content -->
<div class="container mt-5">
    <h1 class="text-center mb-4">Welcome to Dashboard</h1>
    <p class="text-center">You are logged in as a Therapist.</p>

    <div class="text-center mt-4">
        <a href="therapistLogin.jsp" class="btn btn-primary me-2">Therapist Login</a>
        <a href="therapistRegister.jsp" class="btn btn-secondary me-2">Therapist Register</a>
        <a href="adminLogin.jsp" class="btn btn-info">Admin Login</a>
    </div>
</div>

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
