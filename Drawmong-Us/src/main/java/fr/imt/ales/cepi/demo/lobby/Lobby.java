package fr.imt.ales.cepi.demo.lobby;

import java.util.ArrayList;

public class Lobby {
    public ArrayList<Player> joueurs = new ArrayList<>();
    public String langue;
    public int id;
    public int t_dessin;
    public int nb_manches;
    public int nb_joueurs_max;
    public boolean room_public;
    public ArrayList<String> mots;
    public int proba;

    public Lobby(int id, String langue, int t_dessin, int nb_manches, int nb_joueurs_max, boolean room_public, ArrayList<String> mots, int proba) {
        this.langue = langue;
        this.id = id;
        this.t_dessin = t_dessin;
        this.nb_manches = nb_manches;
        this.nb_joueurs_max = nb_joueurs_max;
        this.room_public = room_public;
        this.mots = mots;
        this.proba = proba;
    }
}
