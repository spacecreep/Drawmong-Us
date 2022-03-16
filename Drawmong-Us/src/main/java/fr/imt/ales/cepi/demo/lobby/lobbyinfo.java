package fr.imt.ales.cepi.demo.lobby;

import java.io.*;

import javax.servlet.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/info")

public class lobbyinfo extends HttpServlet{

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        // Recupere la session
        HttpSession session = request.getSession();
        // Recupere les parametres du jeu
        session.setAttribute("langue",request.getParameter("language"));
        session.setAttribute("temps",request.getParameter("drawing_time"));
        session.setAttribute("manches",request.getParameter("rounds"));
        session.setAttribute("max",request.getParameter("max_players"));
        session.setAttribute("publique",request.getParameter("public"));
        session.setAttribute("mots",request.getParameter("custom_words"));
        session.setAttribute("proba",request.getParameter("custom_words_chance"));

        request.getRequestDispatcher("jsp/paint.jsp").forward(request, response);
    }
}








