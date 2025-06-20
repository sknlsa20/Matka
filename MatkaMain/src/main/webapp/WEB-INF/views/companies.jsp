<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        padding: 20px;
    }

    h2 {
        text-align: center;
        color: #333;
    }

    #customers {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }

    #customers th, #customers td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

    #customers th {
        background-color: #04AA6D;
        color: white;
    }

    #customers tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    #customers tr:hover {
        background-color: #e0f7fa;
    }

    select, a {
        margin: 10px;
        padding: 5px 10px;
        font-size: 14px;
    }

    .action-links {
        margin-top: 10px;
    }

</style>
</head>
<body>
<a href="./companies">back to menu</a> 
<a href="./add">Add Company</a> 
<table id="customers">
    <tr>
        <th>Company Id</th>
        <th >Company Name</th>
        <th>Del</th>
    </tr>
<c:forEach var="c" items="${cms}">
<tr>
        <td>${c.cid }</td>
        <td>${c.cname }</td>
        <td><a href="./delete/${c.cid }">X</a></td>
    </tr>
 </c:forEach>   
  </table>
</body>
</html>