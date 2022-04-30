package fr.imt.ales.cepi.demo.lobby;


import fr.imt.ales.cepi.demo.Server;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import static fr.imt.ales.cepi.demo.lobby.JoinLobby.getCHarFromListPlayers;
import static java.lang.Integer.parseInt;

@WebServlet("/refreshlobby")

public class RefreshLobby extends HttpServlet{

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {

        // Recupere la session
        HttpSession session = request.getSession();

        session.setAttribute("listejoueurs",getCHarFromListPlayers(Server.getInstance().getLobbyFromId((int)(session.getAttribute("id"))).joueurs));
        request.getRequestDispatcher("jsp/paint.jsp").forward(request, response);
    }


}








