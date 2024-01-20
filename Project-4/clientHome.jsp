<!DOCTYPE html>
<!-- clientHome.jsp -->
<% 
   String data = (String) session.getAttribute("data");
   String success = (String) session.getAttribute("success");
   String businessLogic = (String) session.getAttribute("businessLogic");
   String error = (String) session.getAttribute("error");
   
   if (data == null) data = " ";
   if (success == null) success = " ";
   if (businessLogic == null) businessLogic = " ";
   if (error == null) error = " ";
%>
<html lang="en">
<head>
   <title>Authentication Page</title>
   <meta charset="utf-8" />
   <style type="text/css">
	    body{background-color: black; text-align: center; font-family: Verdana, Arial, sans-serif;}
		
        h1{color: red; font-size: 28pt;}
        h2{color: cyan; font-size: 24pt;}
        label{color: yellow;}
        button{background-color: grey;font-weight:bold;margin-right: 60px;}
        hr{color: white;}
        p{color: white;}
        th{background-color: red}
        tr{background-color: lightgray}
        table{margin-left: auto; margin-right: auto;}
	</style>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script type = "text/javascript">
        function eraseText() {
            $("#query").html("");
        }
    </script>
    <script type = "text/javascript">
        function eraseData() {
            $("#data").remove();
        }
    </script>
</head>
<body>
    <h1>Welcome to the Fall 2023 Project 4 Enterprise System</h1>
    <h2>A Servlet/JSP-Based Multi-Tiered Enterprise Application Using A Tomcat Container</h2>
    <hr>
    <p>You are connected to the Project 4 Enterprise System database as a <span style = "color: red;">client-level</span> user. <br>Please enter any SQL query or update command in the box below.</p>
    <br>
   <form action = "/Project-4/clientHome" method = "post">
      <p><textarea rows = "15" cols = "75" type = "text" name = "query"></textarea>
         <br>
         <br>
         <button type = "submit" style = "color: limegreen">Execute Command</button>
         <button type = "reset" style = "color: red" onclick = "javascript:eraseText();">Reset Form</button>
         <button type = "button" style = "color: yellow" onclick = "javascript:eraseData();">Clear Results</button>
      </p>
   </form>
    <br>
    <p>All execution results will appear below this line.</p>
    <hr>
    <p style = "font-weight:bold">Execution Results:</p>
    <br>
    <div id = "data">
    <table name = "data"> <%= data %>
    </table>
    <p name = "success" style = "background-color: limegreen; display: inline-block;"><%= success %></p>
    <br>
    <p name = "businessLogic" style = "background-color: limegreen; display: inline-block;"><%= businessLogic %></p>
    <p name = "error" style = "background-color: red; display: inline-block;"><%= error %></p>
    </div>
</body>
</html>