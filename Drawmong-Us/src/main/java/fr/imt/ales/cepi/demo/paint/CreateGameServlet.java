package fr.imt.ales.cepi.demo.paint;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * The servlet for the paint page. Handle only GET method. Dispatch to paint.jsp
 */
@WebServlet("/game")
public class CreateGameServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("jsp/paint.jsp").forward(request, response);
    }
}