package fr.imt.ales.cepi.demo;

import fr.imt.ales.cepi.demo.lobby.Lobby;
import fr.imt.ales.cepi.demo.lobby.Player;

import java.util.ArrayList;
import java.util.Random;

public class Server {

    private static final Server instance = new Server();

    public static ArrayList<Lobby> lobbies = new ArrayList<>();
    public static ArrayList<Player> players = new ArrayList<>();


    private Server(){

    }

    public static Server getInstance() {
        return instance;
    }

    public void createLobby(int id, String langue, int t_dessin, int nb_manches, int nb_joueurs_max, boolean room_public, ArrayList<String> mots, int proba) {
        Lobby t = new Lobby(id, langue, t_dessin, nb_manches, nb_joueurs_max, room_public, mots, proba);
        lobbies.add(t);
    }

}
