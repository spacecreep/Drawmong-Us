package fr.imt.ales.cepi.demo.lobby;


import fr.imt.ales.cepi.demo.Server;

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
        Player p = new Player(request.getParameter("pseudo"));
        session.setAttribute("pseudo",p.pseudo);
        session.setAttribute("player",p);
        session.setAttribute("id",p.id);

        request.getRequestDispatcher("jsp/lobby.jsp").forward(request, response);
    }}








