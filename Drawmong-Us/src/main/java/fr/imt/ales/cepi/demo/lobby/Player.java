package fr.imt.ales.cepi.demo.lobby;

import fr.imt.ales.cepi.demo.Server;

import java.util.Random;

public class Player {

    public String pseudo;
    public int id;

    public Player(String pseudo) {

        this.pseudo = pseudo;
        this.id = playerLogin(pseudo);
        Server.players.add(this);
    }

    public int playerLogin(String pseudo){
        boolean check = true;
        int r = 0;
        while(check){
            int _ = 0;
            r = getRandomNumberInRange(100000,999999);
            for(int i = 0; i< Server.players.size();i++){
                if(Server.players.get(i).id == r){
                    _ = 1;
                }
            }
            if(_==0){
                check = false;
            }
        }
        return r;
    }

    private int getRandomNumberInRange(int min, int max) {

        if (min >= max) {
            throw new IllegalArgumentException("max must be greater than min");
        }

        Random r = new Random();
        return r.nextInt((max - min) + 1) + min;
    }
}
