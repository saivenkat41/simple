<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Resume</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            color: #333;
            line-height: 1.6;
        }
        h2 {
            text-align: center;
            color: #007BFF;
            margin-bottom: 20px;
        }
        strong {
            color: #555;
        }
        h3 {
            border-bottom: 2px solid #007BFF;
            padding-bottom: 5px;
            margin-top: 20px;
            color: #0056b3;
        }
        p, pre {
            background-color: #fff;
            padding: 10px;
            font-family: Arial, sans-serif;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            
            margin: 10px 0;
        }
        form {
            text-align: center;
            margin-top: 20px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>Your Resume</h2>
    <%
        ResultSet rs = (ResultSet) request.getAttribute("resumeData");
        if (rs != null) {
    %>
        <strong>Name:</strong> <%= rs.getString("firstName") %> <%= rs.getString("lastName") %><br>
        <strong>Email:</strong> <%= rs.getString("email") %><br>
        <strong>Phone:</strong> <%= rs.getString("phone") %><br>
        <strong>Career Objective:</strong> <pre><%= rs.getString("careerObjective").replace("\n", "<br>") %></pre>
        
        <h3>Education Details:</h3>
        <pre><%= rs.getString("educationDetails")%></pre>
        
        <h3>Experience Details:</h3>
        <pre><%= rs.getString("experienceDetails")%></pre>
        
        <h3>Project Details:</h3>
        <pre><%= rs.getString("projectDetails") %></pre>

        <h3>Skills:</h3>
        <pre><%= rs.getString("skills") %></pre>
        
        <h3>Languages:</h3>
        <pre><%= rs.getString("languages") %></pre>

        <h3>Achievements:</h3>
        <pre><%= rs.getString("achievements") %></pre>

        <h3>Certifications:</h3>
        <pre><%= rs.getString("certifications") %></pre>

        <form action="downloadResumeServlet" method="post">
            <input type="hidden" name="email" value="<%= rs.getString("email") %>" />
        </form>
    <%
        } else {
            out.println("<p>No resume data found.</p>");
        }
    %>
</body>
</html>
