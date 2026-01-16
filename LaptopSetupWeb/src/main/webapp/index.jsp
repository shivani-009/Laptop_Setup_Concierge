<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Laptop Setup Concierge</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Base Styles */
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
        #websiteSearchForm {
    display: flex;
    flex-direction: column;
}

#websiteSearchForm {
    background: #fff;
    margin-top: 20px;
    display: flex;
    flex-direction: column;
}
 #websiteSearchForm input[type="text"] {
    width:100%; padding:10px; margin-bottom:15px; border-radius:6px; border:1px solid #ccc; font-size:15px; 
}
/* Submit Button */
 #websiteSearchForm input[type="submit"] {
    width:100%; padding:10px; margin-bottom:15px; border-radius:6px; border:1px solid #ccc; font-size:15px; 
}
#websiteSearchForm input[type=submit] {  border:none; cursor:pointer; font-weight:bold; }
 body.dark #websiteSearchForm { background:#2C2C2C; }

 
    
      
   
      

        .container { max-width:600px; margin:120px auto 80px; padding:20px; }
        .form-container { background:#fff; padding:25px 30px; border-radius:12px; box-shadow:0 8px 20px rgba(0,0,0,0.15); }
        label { display:block; margin:12px 0 5px; font-weight:bold; color:#34495E; }
        select, input[type=submit] { width:100%; padding:10px; margin-bottom:15px; border-radius:6px; border:1px solid #ccc; font-size:15px; }
        input[type=submit] { background:#2E86C1; color:#fff; border:none; cursor:pointer; font-weight:bold; }
        input[type=submit]:hover { background:#1B4F72; }
        footer { width:100%; background:#2E86C1; color:#fff; padding:10px; text-align:center; position:fixed; bottom:0; }

        /* Dark Mode */
        body.dark { background:#1E1E1E; color:#f5f5f5; }
        body.dark .form-container { background:#2C2C2C; }
        body.dark input[type=submit] { background:#444; }
        body.dark input[type=submit]:hover { background:#222; }

        /* Responsive */
        @media (max-width: 768px){
            header { font-size:18px; padding:12px 15px; }
            .container { margin:100px 15px 80px; }
            input[type=submit], select { font-size:14px; padding:8px; }
        }
        @media (max-width: 480px){
        #websiteSearchForm input[type="text"],
    #websiteSearchForm input[type="submit"] {
            header { font-size:16px; flex-direction: column; gap:8px; }
            .mode-toggle { align-self:flex-end; }
            .container { margin:90px 10px 80px; padding:15px; }
        }
    </style>
</head>
<body>
<header>
    Laptop Setup Concierge
    <button id="modeToggle" class="mode-toggle">🌙</button>
</header>

<div class="container">
    <h2>Select your OS and User Type</h2>
    <p>Choose options below to see recommended apps:</p>
    
    

    <div class="form-container">
        <form method="post" action="fetchApps">
            <label for="os">Operating System:</label>
            <select name="os" id="os">
                <option value="1">Windows</option>
                <option value="2">Mac</option>
                <option value="3">Linux</option>
            </select>
            <label for="userType">User Type:</label>
            <select name="userType" id="userType">
                <option value="1">Student</option>
                <option value="2">Developer</option>
                <option value="3">Gamer</option>
            </select>
            <input type="submit" value="Show Apps">
            
        </form>
        <!-- Website Search Section -->
    <hr style="margin:20px 0; border:0; border-top:1px solid #ccc;">
    <h3>Search for any Website</h3>
    <form id="websiteSearchForm">
        <label for="website">Website Name or URL:</label>
        <input type="text" id="website" name="website" placeholder="e.g. google.com" required>
        <input type="submit" value="Go">
    </form>
    </div>
    
    
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
<script>
document.getElementById('websiteSearchForm').addEventListener('submit', function(e) {
    e.preventDefault();
    let site = document.getElementById('website').value.trim();
    if(!site.startsWith('http://') && !site.startsWith('https://')){
        site = 'https://' + site;
    }
    window.open(site, '_blank');
});
</script>


</body>
</html>
