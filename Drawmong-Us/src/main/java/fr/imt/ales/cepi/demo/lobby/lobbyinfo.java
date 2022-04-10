package fr.imt.ales.cepi.demo.lobby;

import fr.imt.ales.cepi.demo.Server;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import static java.lang.Integer.parseInt;

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


        Server.getInstance().createLobby((int) session.getAttribute("id"),request.getParameter("language"),
                parseInt(request.getParameter("drawing_time")),
                parseInt(request.getParameter("rounds")),
                parseInt(request.getParameter("max_players")),
                Boolean.parseBoolean(request.getParameter("public")),
                getListFromString(request.getParameter("custom_words")),
                parseInt(request.getParameter("custom_words_chance"))
                );

        session.setAttribute("partyowner",session.getAttribute("pseudo"));
        session.setAttribute("partyid",session.getAttribute("id"));
        Server.getInstance().getLobbyFromId((int)session.getAttribute("id")).joueurs.add((Player) session.getAttribute("player"));

        request.getRequestDispatcher("jsp/paint.jsp").forward(request, response);

        System.out.println(Server.getInstance().lobbies.size());
    }

    private ArrayList<String> getListFromString(String s){
        return new ArrayList<String>(Arrays.asList(s.split(", ")));
    }
}








