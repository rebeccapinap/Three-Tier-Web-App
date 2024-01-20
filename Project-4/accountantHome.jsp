<!DOCTYPE html>
<!-- accountantHome.jsp -->
<% 
   String data = (String) session.getAttribute("data");
   
   if (data == null) data = " ";
%>
<html lang="en">
<head>
   <title>Authentication Page</title>
   <meta charset="utf-8" />
   <style type="text/css">
	    body{background-color: black; text-align: center; font-family: Verdana, Arial, sans-serif;}
		
        h1{color: yellow; font-size: 24pt;}
        h2{color: limegreen; font-size: 22pt;}
        label{color: blue;text-align: left;}
        button{background-color: slategrey;font-weight:bold;margin-right: 60px;}
        hr{color: white;}
        p{color: white;}
        div{background-color: rgba(255, 255, 255, 0.5);padding: 20px;text-align: left;}
        th{background-color: red}
        tr{background-color: lightgray}
        table{margin-left: auto; margin-right: auto;}
	</style>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
    <p>You are connected to the Project 4 Enterprise System database as a <span style = "color: red;">accountant-level</span> user. <br>Please select the operation you would like to perform from the list below.</p>
    <br>
   <form action = "/Project-4/acountantHome" method = "post">
      <div><input type = "radio" id = "maxStatus" name = "numCommand" value = "1"/>
         <label for = "maxStatus">Get The Maximum Status Value Of All Suppliers <span style = "color: black;">(Returns a maximum value)</span></label>
         <br>
         <br>
         <input type = "radio" id = "totalWeight" name = "numCommand" value = "2"/>
         <label for = "totalWeight">Get The Total Weight Of All Parts <span style = "color: black;">(Returns a sum)</span></label>
         <br>
         <br>
         <input type = "radio" id = "totalShipments" name = "numCommand" value = "3"/>
         <label for = "totalShipments">Get The Total Number of Shipments <span style = "color: black;">(Returns the current number of shipments in total)</span></label>
         <br>
         <br>
         <input type = "radio" id = "jobInfo" name = "numCommand" value = "4"/>
         <label for = "jobInfo">Get The Name And Number Of Workers Of The Job With The Most Workers <span style = "color: black;">(Returns two values)</span></label>
         <br>
         <br>
         <input type = "radio" id = "supplierInfo" name = "numCommand" value = "5"/>
         <label for = "supplierInfo">List The Name And Status Of Every Supplier <span style = "color: black;">(Returns a list of supplier names with status)</span></label>
         <br>
         <br>
         </div>
         <div style = "text-align: center">
         <button type = "submit" style = "color: limegreen">Execute Command</button>
         <button type = "button" style = "color: red" onclick = "javascript:eraseData();">Clear Results</button>
      </div>
   </form>
    <br>
    <p>All execution results will appear below this line.</p>
    <hr>
    <p style = "font-weight:bold">Execution Results:</p>
    <br>
    <div id = "data">
    <table name = "data"> <%= data %>
    </table>
    </div>
</body>
</html>