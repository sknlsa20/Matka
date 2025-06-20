<%@ page language="java" import="java.time.LocalDate,java.util.*,java.text.*" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="datefn" uri="http://example.com/functions" %>
<%@ page import="java.time.*, java.time.format.*, java.util.*"%>
<%@ page import="java.time.*, java.time.format.*, java.util.*,com.example.model.Result" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Results</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f0f2f5;
        margin: 0;
        padding: 20px;
        color: #333;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #2c3e50;
    }

    a {
        color: #3498db;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }

    select, input[type="submit"], input[type="text"] {
        padding: 8px;
        margin: 8px 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }

    input[type="submit"] {
        background-color: #04AA6D;
        color: white;
        border: none;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #03995c;
    }

    form {
        margin: 10px 0;
        text-align: center;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: white;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: center;
        vertical-align: middle;
    }

    th {
        background-color: #04AA6D;
        color: white;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover td {
        background-color: #e6f7ff;
    }

    td strong {
        display: block;
        font-size: 16px;
        color: #2c3e50;
    }

    .event {
        background-color: #d1ecf1;
    }

    #eventForm {
        display: none;
        margin: 20px auto;
        padding: 20px;
        max-width: 500px;
        border: 1px solid #ccc;
        background-color: #ffffff;
        box-shadow: 0 0 5px rgba(0,0,0,0.1);
    }

    #eventForm h3 {
        margin-top: 0;
        color: #2c3e50;
        text-align: center;
    }

    .action-links {
        text-align: center;
        margin-bottom: 15px;
    }
</style>

    <script>
   
    
    function handleChange() {
        var arr = document.getElementById('menu1');
        var selectedValue = arr.value;

        // Don't redirect if placeholder is selected
        if (selectedValue === "select" || selectedValue === "") {
            return; // do nothing
        }

        // Use absolute URL to avoid repeated /selectcompany/selectcompany
        window.location.href = "/selectcompany/" + selectedValue;
    }
</script>
</head>
<body>

<h2>Welcome to Results</h2>
<c:set value="${cms}" var="cms" scope="session"></c:set>
<div style="text-align:center;">
    <form>
        <a href="/display">Company Details</a><br>
        <label>Select your company:</label>
        <select name="company" id="menu1" onchange="handleChange()">
            <option value="select">-- Select --</option>
            <c:forEach items="${cms}" var="c">
                <option value="${c.cname}"><c:out value="${c.cname}"/></option>
            </c:forEach>
        </select> 
    </form>
   </div>   

   
  
   <c:if test="${cname ne null }">  
<form id="monthYearForm" method="post" action="/selectcompany/${cname}">
    <c:set var="months" value="${['January','February','March','April','May','June','July','August','September','October','November','December']}" />
    <select name="month">
        <c:forEach var="i" begin="0" end="11">
            <option value="${i}" ${i == month ? "selected" : ""}>${months[i]}</option>
        </c:forEach>
    </select>
    <select name="year">
        <c:forEach var="y" begin="${year - 10}" end="${year + 10}">
            <option value="${y}" ${y == year ? "selected" : ""}>${y}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Go" />
</form>
<c:out value="${cname} chart"></c:out>
<table>
    <tr>
        <th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th>
        <th>Fri</th><th>Sat</th><th>Sun</th>
    </tr>
    <tr>
    <%
    
    Calendar cal = Calendar.getInstance();
    int month = request.getParameter("month") != null ? Integer.parseInt(request.getParameter("month")) : cal.get(Calendar.MONTH);
    int year = request.getParameter("year") != null ? Integer.parseInt(request.getParameter("year")) : cal.get(Calendar.YEAR);
    cal.set(Calendar.MONTH, month);
    cal.set(Calendar.YEAR, year);
    cal.set(Calendar.DAY_OF_MONTH, 1);
    
    Map<Integer, Result> resultsMap = new HashMap<>();
    List<?> results = (List<?>) request.getAttribute("results");
    String cname = (String)request.getAttribute("cname");
    
    for (Object obj : results) {
        Result ev = (Result) obj; // Adjust package if needed
        int day = ev.getDate().getDayOfMonth();
       resultsMap.computeIfAbsent(day, k -> new Result(ev.getId(),ev.getDate(),ev.getCompanyname(),ev.getFirstnumber(),ev.getSecondnumber(),ev.isFirstresult(),ev.isSecondresult()));
        
    }
    
    int daysInMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    int firstDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

    int dayCounter = 1;
    for (int i = 1; i < firstDayOfWeek; i++) {
        out.print("<td></td>");
        dayCounter++;
    }

    for (int day = 1; day <= daysInMonth; day++) {
       Result res = resultsMap.get(day);
      	
      	String msg = "hello";
       out.print("<td>");
        out.print("<strong>" + day + "</strong>");
        if (res != null && res.getCompanyname().equals(cname)) {
            
                out.print("<br><small>" + res.getFirstnumber()+" - "+res.isFirstresult()+ "</small><br>");
                out.print("<small>" + res.getSecondnumber()+"-"+res.isSecondresult()+ "</small><br><a href='../deleteresult/"+res.getId()+"'>X</a>");
           
        }
        else
        {
        	
        	out.print("<br><a href='javascript:showForm(" + day + ")'>+</a>");
        }
       	
        out.print("</td>");
        if (dayCounter % 7 == 0) {
            out.print("</tr><tr>");
        }
        dayCounter++;
    }

    while ((dayCounter - 1) % 7 != 0) {
        out.print("<td></td>");
        dayCounter++;
    }
    %>
    </tr>
   
</table>
<script type="text/javascript">
function showForm(day) {
    const form = document.getElementById("eventForm");
    form.style.display = "block";
    const dateField = document.getElementById("selectedDate");
    const selectedDate = "<%= year %>-" + ("0" + (<%= month + 1 %>)).slice(-2) + "-" + ("0" + day).slice(-2);
    dateField.value = selectedDate;
    document.getElementById("selectedDayLabel").innerText = selectedDate;
}
</script>
<!-- Add Event Form -->
<div id="eventForm" style="display:none; margin-top: 20px; padding: 10px; border: 1px solid #ccc;">
    <h3>Add Event for <span id="selectedDayLabel"></span></h3>
    <form method="get" action="../addresults">
        <input type="hidden" name="month" value="<%= month %>" />
        <input type="hidden" name="year" value="<%= year %>" />
        <input type="hidden" name="cname" value="<%= cname %>" />
        <input type="hidden" id="selectedDate" name="selectedDate"/>
        <input type="text" name="fn" required placeholder="Enter firstnumber" />
        <input type="text" name="sn" required placeholder="Enter secondnumber" />
        <input type="submit" value="Save Event" />
    </form>
</div>

</c:if>
  </body>
</html>
