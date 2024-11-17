package com.sai.resume;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@MultipartConfig
public class storeDataServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException
    {

        // Retrieve form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String linkedin = request.getParameter("linkedin");
        String github = request.getParameter("github");
        String careerObjective = request.getParameter("careerObjective");
        String educationDetails = request.getParameter("educationDetails"); 
        String experienceDetails = request.getParameter("experienceDetails"); 
        String projectDetails = request.getParameter("projectDetails");
        String skills = request.getParameter("skills");
        String languages = request.getParameter("languages");
        String achievements = request.getParameter("achievements");
        String certifications = request.getParameter("certifications");
        String dbUrl = "jdbc:mysql://localhost:3306/explog";
        String dbUser = "root";
        String dbPassword = "Saivenkat@541";
        String query = "INSERT INTO resumes (firstName, lastName, email, phone, linkedin, github, careerObjective, educationDetails, experienceDetails, projectDetails, skills, languages, achievements, certifications) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
                 PreparedStatement pstmt = con.prepareStatement(query)) {
                pstmt.setString(1, firstName);
                pstmt.setString(2, lastName);
                pstmt.setString(3, email);
                pstmt.setString(4, phone);
                pstmt.setString(5, linkedin);
                pstmt.setString(6, github);
                pstmt.setString(7, careerObjective);
                String[] educationLines = educationDetails.split("\\r?\\n");
                StringBuilder educationBuilder = new StringBuilder();
                for (String line : educationLines) 
                {
                    educationBuilder.append(line).append("\n");
                }
                pstmt.setString(8, educationBuilder.toString());
                String[] experienceLines = experienceDetails.split("\\r?\\n");
                StringBuilder experienceBuilder = new StringBuilder();
                for (String line : experienceLines) 
                {
                    experienceBuilder.append(line).append("\n");
                }
                pstmt.setString(9, experienceBuilder.toString());
                String[] projectLines = projectDetails.split("\\r?\\n");
                StringBuilder projectBuilder = new StringBuilder();
                for (String line : projectLines)
                {
                    projectBuilder.append(line).append("\n");
                }
                pstmt.setString(10, projectBuilder.toString());
                String[] skillsLines = skills.split("\\r?\\n");
                StringBuilder skillsBuilder = new StringBuilder();
                for (String line : skillsLines) 
                {
                    skillsBuilder.append(line).append("\n");
                }
                pstmt.setString(11, skillsBuilder.toString());
                String[] languagesLines = languages.split("\\r?\\n");
                StringBuilder languagesBuilder = new StringBuilder();
                for (String line : languagesLines)
                {
                	languagesBuilder.append(line).append("\n");
                }
                pstmt.setString(12, languagesBuilder.toString());
                String[] achievementsLines = achievements.split("\\r?\\n");
                StringBuilder achievementsBuilder = new StringBuilder();
                for (String line : achievementsLines) 
                {
                	achievementsBuilder.append(line).append("\n");
                }
                pstmt.setString(13, achievementsBuilder.toString());
                String[] certificationsLines = certifications.split("\\r?\\n");
                StringBuilder certificationsBuilder = new StringBuilder();
                for (String line : certificationsLines)
                {
                	certificationsBuilder.append(line).append("\n");
                }
                pstmt.setString(14, certificationsBuilder.toString());
                pstmt.executeUpdate();
            }

            
            response.sendRedirect("retrieveServlet?email=" + email);
        } 
        catch (SQLException sqlEx) 
        {
            sqlEx.printStackTrace(); 
            response.getWriter().println("Database error: " + sqlEx.getMessage());
        } 
        catch (ClassNotFoundException cnfEx) 
        {
            cnfEx.printStackTrace(); 
            response.getWriter().println("Driver not found: " + cnfEx.getMessage());
        } 
        catch (Exception e) 
        {
            e.printStackTrace(); 
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
