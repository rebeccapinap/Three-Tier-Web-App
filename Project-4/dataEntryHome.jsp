<!DOCTYPE html>
<!-- dataEntryHome.jsp -->
<% 
   String success = (String) session.getAttribute("success");
   String error = (String) session.getAttribute("error");
   
   if (success == null) success = " ";
   if (error == null) error = " ";
%>
<html lang="en">
<head>
   <title>Authentication Page</title>
   <meta charset="utf-8" />
   <style type="text/css">
	    body{background-color: black; text-align: center; font-family: Verdana, Arial, sans-serif;width: 100%}
		
        h1{color: red; font-size: 20pt;}
        h2{color: cyan; font-size: 18pt;}
        label{color: yellow;}
        button{background-color: grey;font-weight:bold;margin-right: 60px;}
        hr{color: white;}
        p{color: white;}
        th{color: lightcyan;border:1px solid yellow;}
        fieldset{width: 780px; height: 180px;}
        legend{color: white; text-align: left;}
        td{border:1px solid yellow;}
        table{border:3px solid yellow; width: 100%;}
	</style>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script type = "text/javascript">
        function eraseDataResults() {
            $("#cmd").html("");
            $("#success").remove();  
            $("#error").remove();  
        }
    </script>
</head>
<body>
    <h1>Welcome to the Fall 2023 Project 4 Enterprise System</h1>
    <h2>Data Entry Application</h2>
    <hr>
    <p>You are connected to the Project 4 Enterprise System database as a <span style = "color: red;">data-entry-level</span> user. <br>Enter the data values in a form below to add a new record to the corresponding database table.</p>
    <hr>
    <form action = "/Project-4/addSupplier" method = "post">
    <fieldset> 
        <legend>Suppliers Record Insert</legend>
        <br>
        <table>
            <tr>
                <th>snum</th><th>sname</th><th>status</th><th>city</th>
            </tr>
            <tr name = "cmd">
                <td><input type = "text" name = "snum" /></td>
                <td><input type = "text" name = "sname" /></td>
                <td><input type = "text" name = "status" /></td>
                <td><input type = "text" name = "city" /></td>
            </tr>
        </table>
        <br>
        <button type = "submit" style = "color: limegreen">Enter Supplier Record Into Database</button>
        <button type = "submit" style = "color: red">Clear Data and Results</button>
        </fieldset>
    </form>
    <form action = "/Project-4/addPart" method = "post">
      <fieldset> 
        <legend>Parts Record Insert</legend>
        <br>
        <table>
            <tr>
                <th>pnum</th><th>pname</th><th>color</th><th>weight</th><th>city</th>
            </tr>
            <tr name = "cmd">
                <td><input type = "text" name = "pnum" /></td>
                <td><input type = "text" name = "pname" /></td>
                <td><input type = "text" name = "color" /></td>
                <td><input type = "text" name = "weight" /></td>
                <td><input type = "text" name = "city" /></td>
            </tr>
        </table>
        <br>
        <button type = "submit" style = "color: limegreen">Enter Part Record Into Database</button>
        <button type = "submit" style = "color: red">Clear Data and Results</button>
        </fieldset>
    </form>
    <form action = "/Project-4/addJob" method = "post">
      <fieldset> 
        <legend>Jobs Record Insert</legend>
        <br>
        <table>
            <tr>
                <th>jnum</th><th>jname</th><th>numworkers</th><th>city</th>
            </tr>
            <tr name = "cmd">
                <td><input type = "text" name = "jnum" /></td>
                <td><input type = "text" name = "jname" /></td>
                <td><input type = "text" name = "numworkers" /></td>
                <td><input type = "text" name = "city" /></td>
            </tr>
        </table>
        <br>
        <button type = "submit" style = "color: limegreen">Enter Job Record Into Database</button>
        <button type = "submit" style = "color: red">Clear Data and Results</button>
        </fieldset>
    </form>
    <form action = "/Project-4/addShipment" method = "post">
      <fieldset> 
        <legend>Shipments Record Insert</legend>
        <br>
        <table>
            <tr>
                <th>snum</th><th>pnum</th><th>jnum</th><th>quantity</th>
            </tr>
            <tr name = "cmd">
                <td><input type = "text" name = "snum" /></td>
                <td><input type = "text" name = "pnum" /></td>
                <td><input type = "text" name = "jnum" /></td>
                <td><input type = "text" name = "quantity" /></td>
            </tr>
        </table>
        <br>
        <button type = "submit" style = "color: limegreen">Enter Shipment Record Into Database</button>
        <button type = "submit" style = "color: red">Clear Data and Results</button>
        </fieldset>
    </form>
    <p style = "font-weight:bold">Execution Results:</p>
    <br>
    <div id = "data">
    <p name = "success" style = "background-color: blue; display: inline-block;"><%= success %></p>
    <p name = "error" style = "background-color: red; display: inline-block;"><%= error %></p>
    </div>
</body>
</html>