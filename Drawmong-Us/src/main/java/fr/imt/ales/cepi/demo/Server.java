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

    public boolean lobbyExist(int id){
        for(int i =0; i<lobbies.size(); i++){
            if(lobbies.get(i).id == id){
                return true;
            }
        }
        return false;
    }

    public Lobby getLobbyFromId(int id){
        for(int i =0; i<lobbies.size(); i++){
            if(lobbies.get(i).id == id){
                return lobbies.get(i);
            }
        }
        //Cette ligne n'est jamais censée être éxecutée, il faut prendre soin d'être sur qu'un tel lobby exist lorsque qu'on apelle cette méthode
        return lobbies.get(0);
    }
}
