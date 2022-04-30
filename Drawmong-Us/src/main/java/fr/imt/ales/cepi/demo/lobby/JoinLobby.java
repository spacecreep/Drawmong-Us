package fr.imt.ales.cepi.demo.lobby;


import fr.imt.ales.cepi.demo.Server;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import static java.lang.Integer.parseInt;

@WebServlet("/joinlobby")

public class JoinLobby extends HttpServlet{

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {

        // Recupere la session
        HttpSession session = request.getSession();

        // Puis on check si la partie existe
        String id = request.getParameter("lobbycode");
        boolean b = Server.getInstance().lobbyExist(parseInt(id));
        if(!b){
            request.getRequestDispatcher("jsp/lobby.jsp").forward(request, response);
            return;
        }
        Server.getInstance().getLobbyFromId(parseInt(id)).joueurs.add((Player)session.getAttribute("player"));
        session.setAttribute("listejoueurs",getCHarFromListPlayers(Server.getInstance().getLobbyFromId(parseInt(id)).joueurs));
        request.getRequestDispatcher("jsp/paint.jsp").forward(request, response);
    }

    public static String getCHarFromListPlayers(ArrayList<Player> A){
        String s = "";
        for(int i = 0; i<A.size()-1; i++){
            s += A.get(i).pseudo + ", ";
        }
        s += A.get(A.size()-1).pseudo;
        System.out.println(A);
        System.out.println(s);
        return s;
    }

}








