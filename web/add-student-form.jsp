<!DOCTYPE html>
<html>

    <head>
        <title>Add Student</title>

    <style>
            html, body{
                margin-left:15px; margin-right:15px; 
                padding:0px; 
                font-family:Verdana, Arial, Helvetica, sans-serif;
            }
            
            .center {
                display: flex;
                justify-content: center;
            }
            
            .center div,
            .center table{
                  text-align: center;
                  width: 800px;
            }
            
            table {   
                border-collapse:collapse;
                border-bottom:1px solid gray;
                font-family: Tahoma,Verdana,Segoe,sans-serif;
            }

            th {
                border-bottom:1px solid gray;
                background:none repeat scroll 0 0 #0775d3;
                padding:10px;
                color: #FFFFFF;
            }

            tr {
                border-top:1px solid gray;
                text-align:center;	
            }

            tr:nth-child(even) {background: #FFFFFF}
            tr:nth-child(odd) {background: #BBBBBB}	

            #wrapper { margin-top: 0px; }
            #header { background: #0775d3; margin-top: 0px; padding:15px 0px 15px 0px;}
            #header h2 { margin:auto; color: #FFFFFF;}
            #container { margin:auto}
            #container h3 {color: #000;}
            #container #content {margin-top: 20px;}

            .add-student-button {
                border: 1px solid #666; 
                border-radius: 5px; 
                padding: 4px; 
                font-size: 12px;
                font-weight: bold;
                width: 120px; 
                padding: 5px 10px; 
                margin-bottom: 15px;
                background: #cccccc;
            }
            
            form {
                margin-top: 10px;
        }

        label {
                font-size: 16px; 
                width: 100px; 
                display: block; 
                text-align: right;
                margin-right: 10px;
                margin-top: 8px;
                margin-bottom: 8px;
        }

        input {
                width: 250px;
                border: 1px solid #666; 
                border-radius: 5px; 
                padding: 4px; 
                font-size: 16px;
        }

        .save {
                font-weight: bold;
                width: 130px; 
                padding: 5px 10px; 
                margin-top: 30px;
                background: #cccccc;
        }

        table {   
                border-style:none;
                width:50%;
        }

        tr:nth-child(even) {background: #FFFFFF}
        tr:nth-child(odd) {background: #FFFFFF}

        tr {
                border-style:none;
                text-align:left;	
        }


        </style>
    </head>

    <body>
        <div id="wrapper">
            <div id="header">
                <h2>FooBar University</h2>
            </div>
        </div>

        <div id="container">
            <h3>Add Student</h3>

            <form action="StudentControllerServlet" method="PSOT">

                <input type="hidden" name="command" value="ADD" />

                <table>
                    <tbody>
                        <tr>
                            <td><label>First name:</label></td>
                            <td><input type="text" name="firstName" /></td>
                        </tr>

                        <tr>
                            <td><label>Last name:</label></td>
                            <td><input type="text" name="lastName" /></td>
                        </tr>

                        <tr>
                            <td><label>Email:</label></td>
                            <td><input type="text" name="email" /></td>
                        </tr>

                        <tr>
                            <td><label></label></td>
                            <td><input type="submit" value="Save" class="save" /></td>
                        </tr>

                    </tbody>
                </table>
            </form>

            <div style="clear: both;"></div>

            <p>
                <a href="StudentControllerServlet">Back to List</a>
            </p>
        </div>
    </body>

</html>

