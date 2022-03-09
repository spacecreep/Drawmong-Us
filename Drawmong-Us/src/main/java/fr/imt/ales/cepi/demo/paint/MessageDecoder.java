package fr.imt.ales.cepi.demo.paint;

import com.google.gson.Gson;
import fr.imt.ales.cepi.demo.chat.Message;

import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

public class MessageDecoder implements Decoder.Text<Message> {

    private static Gson gson = new Gson();

    @Override
    public Message decode(String s) throws DecodeException {
        return gson.fromJson(s, Message.class);
    }

    /**
     * Indicates if a message has to be decodes
     *
     * @param s the message
     * @return
     */
    @Override
    public boolean willDecode(String s) {
        return (s != null);
    }

    /**
     * Initialize the decoder
     *
     * @param endpointConfig configuration of the endPoint
     */
    @Override
    public void init(EndpointConfig endpointConfig) {
    }

    /**
     * Destroy the decoder
     */
    @Override
    public void destroy() {
    }
}
