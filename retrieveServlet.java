package com.sai.resume;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class retrieveServlet extends HttpServlet
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException 
    {

        String email = request.getParameter("email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/explog", "root", "Saivenkat@541");
            String query = "SELECT * FROM resumes WHERE email = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next()) 
            {
                request.setAttribute("resumeData", rs);
                RequestDispatcher rd = request.getRequestDispatcher("showResume.jsp");
                rd.forward(request, response);
            } 
            else 
            {
                response.getWriter().println("No data found for email: " + email);
            }
            
            con.close();
        } 
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
