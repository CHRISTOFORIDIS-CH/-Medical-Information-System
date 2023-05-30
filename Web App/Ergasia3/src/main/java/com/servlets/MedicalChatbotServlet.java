package com.servlets;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
@WebServlet(name = "MedicalChatbotServlet", value = "/MedicalChatbotServlet")
public class MedicalChatbotServlet extends  HttpServlet{
    private static Map<String, String> symptomToSpecialist;

    static {
        symptomToSpecialist = new HashMap<>();
        symptomToSpecialist.put("back pain", "Orthopedist");
        symptomToSpecialist.put("headache", "Neurologist");
        symptomToSpecialist.put("chest pain", "Cardiologist");
        // Add more symptoms and corresponding doctors here
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String symptom = request.getParameter("symptom").toLowerCase();

        String specialist = symptomToSpecialist.get(symptom);
        //To avoid any Exceptions if string == null (the symptom doesn't exit in the map) then return an empty string
        if (specialist == null) {
            specialist = "";
        }
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(specialist);
    }
}
