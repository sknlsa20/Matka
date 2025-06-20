<%@ page import="java.util.*, java.text.*" %>
<%
    HttpSession sess = request.getSession();

    // Get selected month/year from request or default to current
    String selectedMonth = request.getParameter("month");
    String selectedYear = request.getParameter("year");
    int selectedDay = (request.getParameter("day") != null) ? Integer.parseInt(request.getParameter("day")) : -1;
    String newValue = request.getParameter("eventValue");

    Calendar cal = Calendar.getInstance();
    int month = (selectedMonth != null) ? Integer.parseInt(selectedMonth) : cal.get(Calendar.MONTH);
    int year = (selectedYear != null) ? Integer.parseInt(selectedYear) : cal.get(Calendar.YEAR);
    cal.set(Calendar.MONTH, month);
    cal.set(Calendar.YEAR, year);
    cal.set(Calendar.DAY_OF_MONTH, 1);
    int firstDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
    int daysInMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

    // Store event data in session map
    String key = month + "-" + year;
    Map<Integer, String> events = (Map<Integer, String>) sess.getAttribute(key);
    if (events == null) {
        events = new HashMap<>();
    }

    // Save new event value if submitted
    if (selectedDay != -1 && newValue != null && !newValue.trim().isEmpty()) {
        events.put(selectedDay, newValue);
        sess.setAttribute(key, events);
    }
%>

<html>
<head>
    <title>Interactive JSP Calendar</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; cursor: pointer; }
        .event { background-color: #e0f7fa; }
        #eventForm { display: none; padding: 10px; border: 1px solid #aaa; background: #f9f9f9; margin-top: 10px; }
    </style>
    <script>
        function showForm(day) {
            document.getElementById("eventForm").style.display = "block";
            document.getElementById("selectedDay").value = day;
            document.getElementById("displayDate").innerText = day;
        }
    </script>
</head>
<body>

    <h2>Select Month and Year</h2>
    <form method="get">
        <select name="month">
            <%
                String[] months = new DateFormatSymbols().getMonths();
                for (int i = 0; i < 12; i++) {
                    out.print("<option value='" + i + "'" + (i == month ? " selected" : "") + ">" + months[i] + "</option>");
                }
            %>
        </select>
        <select name="year">
            <%
                for (int y = year - 5; y <= year + 5; y++) {
                    out.print("<option" + (y == year ? " selected" : "") + ">" + y + "</option>");
                }
            %>
        </select>
        <input type="submit" value="Go" />
    </form>

    <h2>Calendar - <%= new SimpleDateFormat("MMMM yyyy").format(cal.getTime()) %></h2>
    <table>
        <tr>
            <th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th>
            <th>Thu</th><th>Fri</th><th>Sat</th>
        </tr>
        <tr>
        <%
            int dayOfWeekCounter = 1;
            for (int i = 1; i < firstDayOfWeek; i++) {
                out.print("<td></td>");
                dayOfWeekCounter++;
            }

            for (int day = 1; day <= daysInMonth; day++) {
                String eventText = events.get(day);
                out.print("<td class='" + (eventText != null ? "event" : "") + "' onclick='showForm(" + day + ")'>");
                out.print(day);
                if (eventText != null) {
                    out.print("<br/><small>" + eventText + "</small>");
                }
                out.print("</td>");

                if (dayOfWeekCounter % 7 == 0) {
                    out.print("</tr><tr>");
                }
                dayOfWeekCounter++;
            }

            while ((dayOfWeekCounter - 1) % 7 != 0) {
                out.print("<td></td>");
                dayOfWeekCounter++;
            }
        %>
        </tr>
    </table>

    <!-- Event input form -->
    <div id="eventForm">
        <h3>Add Event for Day <span id="displayDate"></span></h3>
        <form method="post">
            <input type="hidden" name="month" value="<%= month %>" />
            <input type="hidden" name="year" value="<%= year %>" />
            <input type="hidden" id="selectedDay" name="day" />
            <input type="text" name="eventValue" placeholder="Enter event or note" required />
            <input type="submit" value="Save" />
        </form>
    </div>

</body>
</html>
