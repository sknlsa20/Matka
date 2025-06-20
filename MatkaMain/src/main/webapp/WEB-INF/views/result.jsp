<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Result</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .form-box {
        background-color: #ffffff;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        width: 400px;
    }

    .form-box h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
    }

    label {
        display: block;
        margin-bottom: 6px;
        color: #444;
    }

    input[type="text"],
    input[type="number"],
    input[type="date"],
    select
    {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #04AA6D;
        border: none;
        border-radius: 5px;
        color: white;
        font-weight: bold;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #03895a;
    }

    .company-label {
        margin-bottom: 10px;
        font-weight: bold;
        color: #555;
    }
</style>
</head>
<body>

<div class="form-box">
    <h2>Add Result</h2>
    <form action="../addresults" method="post">
        <label for="date">Select Date:</label>
        <input type="date" name="date" id="date" required />

       <label>Select your company:</label>
        <select name="companyname">
            <option value="select">-- Select --</option>
            <c:forEach items="${cms}" var="c">
                <option value="${c.cname}"><c:out value="${c.cname}"/></option>
            </c:forEach>
        </select> 

        <label for="firstnumber">Enter First Number:</label>
        <input type="number" name="firstnumber" id="firstnumber" required />

        <label for="secondnumber">Enter Second Number:</label>
        <input type="number" name="secondnumber" id="secondnumber" required />

        <input type="submit" value="Submit" />
    </form>
</div>

</body>
</html>
