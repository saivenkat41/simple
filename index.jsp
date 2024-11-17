<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Resume Builder</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2, h3 {
            color: #333;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 5px;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }

        input[type="text"],
        input[type="email"],
        input[type="file"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            height: 100px;
            resize: none;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }

        .form-section {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Enter Your Details</h2>
        <form action="storeDataServlet" method="post">
            <div class="form-section">
                <label>First Name:</label>
                <input type="text" name="firstName" required/>

                <label>Last Name:</label>
                <input type="text" name="lastName" required/>

                <label>Email:</label>
                <input type="email" name="email" required/>

                <label>Phone Number:</label>
                <input type="text" name="phone" required/>
                <label>Linked In link</label>
                <input type="text" name="linkedin" required>
                <label>Git Hub link</label>
                <input type="text" name="github" required>
            </div>
            <div class="form-section">
                <label>Career Objective:</label>
                <textarea name="careerObjective" required></textarea>
            </div>
            <div class="form-section">
                <h3>Education Details:</h3>
                <textarea name="educationDetails" required></textarea>
            </div>
            <div class="form-section">
                <h3>Experience Details:</h3>
                <textarea name="experienceDetails"></textarea>
            </div>
            <div class="form-section">
                <h3>Project Details:</h3>
                <textarea name="projectDetails" required></textarea>
            </div>
            <div class="form-section">
                <h3>Skills:</h3>
                <textarea name="skills" required></textarea>
            </div>
            <div class="form-section">
                <h3>Languages:</h3>
                <textarea name="languages" required></textarea>
            </div>
            <div class="form-section">
                <h3>Achievements:</h3>
                <textarea name="achievements"></textarea>
            </div>
            <div class="form-section">
                <h3>Certifications:</h3>
                <textarea name="certifications"></textarea>
            </div>
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>

    