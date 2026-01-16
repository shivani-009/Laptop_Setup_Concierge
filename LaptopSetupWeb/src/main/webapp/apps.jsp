<%@ page import="java.util.List, java.util.HashSet, java.util.Set" %>
<%@ page import="com.laptopsetup.model.App" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Recommended Apps</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body { font-family: 'Segoe UI', sans-serif; margin:0; padding:0; background:#f5f7fa; color:#2E4053; transition:0.3s; }
        header {
    display: flex;
    justify-content: space-between; /* push header text left, button right */
    align-items: center;
    padding: 15px 20px;
    font-weight: bold;
    font-size: 20px;
    background: #2E86C1;
    color: #fff;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    box-sizing: border-box; /* important */
    z-index: 1000;
}

        .mode-toggle {
    flex-shrink: 0; /* prevent shrinking */
    width: 35px;
    height: 35px;
    line-height: 35px;
    text-align: center;
    font-size: 20px;
    background: transparent;
    border: none;
    border-radius: 50%;
    cursor: pointer;
}

        .mode-toggle:hover { transform: scale(1.2); }

        .container { max-width:600px; margin:120px auto 80px; padding:20px; }
        .apps-container { background:#fff; padding:25px 30px; border-radius:12px; box-shadow:0 8px 20px rgba(0,0,0,0.15); }
        ul { list-style:none; padding:0; }
        li { margin:10px 0; }
        a { color:#2874A6; text-decoration:none; font-weight:500; }
        a:hover { color:#1B4F72; transform:translateX(5px); }
        .back-btn { display:inline-block; margin-top:15px; padding:10px 20px; background:#2E86C1; color:#fff; border-radius:6px; text-decoration:none; }
        .back-btn:hover { background:#1B4F72; }
        footer { width:100%; background:#2E86C1; color:#fff; padding:10px; text-align:center; position:fixed; bottom:0; }

        /* Dark Mode */
        body.dark { background:#1E1E1E; color:#f5f5f5; }
        body.dark .apps-container { background:#2C2C2C; }
        body.dark .back-btn { background:#444; }
        body.dark .back-btn:hover { background:#222; }

        /* Responsive */
        @media (max-width: 768px){
            header { font-size:18px; padding:12px 15px; }
            .container { margin:100px 15px 80px; }
        }
        @media (max-width: 480px){
            header { font-size:16px; flex-direction: column; gap:8px; }
            .mode-toggle { align-self:flex-end; }
            .container { margin:90px 10px 80px; padding:15px; }
        }
    </style>
</head>
<body>
<header>
    Recommended Apps
    <button id="modeToggle" class="mode-toggle">🌙</button>
</header>

<div class="container">
<%
List<App> apps = (List<App>) request.getAttribute("apps");
if(apps != null && !apps.isEmpty()){
    Set<String> seen = new HashSet<>();
%>
<div class="apps-container">
    <ul>
    <% for(App app: apps){
        if(!seen.contains(app.getName())){ seen.add(app.getName()); %>
            <li><a href="<%= app.getLink() %>" target="_blank"><%= app.getName() %></a></li>
    <% } } %>
    </ul>
    <a href="index.jsp" class="back-btn">← Back to Selection</a>
</div>
<% } else { %>
<p>No apps available for the selected OS and User Type.</p>
<a href="index.jsp" class="back-btn">← Back to Selection</a>
<% } %>
</div>

<footer>© 2025 KIPM College of Engineering & Technology | Laptop Setup Concierge</footer>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const toggle = document.getElementById('modeToggle');
    toggle.textContent = document.body.classList.contains('dark') ? '☀️' : '🌙';
    toggle.addEventListener('click', () => {
        document.body.classList.toggle('dark');
        toggle.textContent = document.body.classList.contains('dark') ? '☀️' : '🌙';
    });
});
</script>
</body>
</html>
