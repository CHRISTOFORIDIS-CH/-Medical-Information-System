package com.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name =  "HumanAnatomyServlet", value = "/HumanAnatomyServlet")
public class HumanAnatomyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("front_head", "If you are hurting in your head, you should see a neurologist");
        request.setAttribute("front_arm", "If you are hurting in your arm, you should see an orthopedist");
        request.setAttribute("back_head", "If you are hurting in the back of your head, you should see a neurologist");
        request.setAttribute("back_back", "If you are hurting in your back, you should see an orthopedist");

        request.getRequestDispatcher("Interactive_Human_Views.jsp").forward(request, response);
    }
}
