package fr.imt.ales.cepi.demo.lobby;


import java.io.*;

import javax.servlet.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")

public class Login extends HttpServlet{

    public void doPost(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        // Recupere la session
        HttpSession session = request.getSession();

        // Puis on login le joueur
        session.setAttribute("player",new Player(request.getParameter("pseudo")));

        System.out.println("OK");

        request.getRequestDispatcher("jsp/lobby.jsp").forward(request, response);
    }}








