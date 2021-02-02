package pl.coderslab.users;

import pl.coderslab.entity.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserList", value = "/user/list")
public class UserList extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        tworzy obiekt
        UserDao userDao = new UserDao();
//        ustawia atrybuty
        request.setAttribute("users", userDao.findAll());
//        które potem przekazuje do pliku .jsp
        getServletContext().getRequestDispatcher("/users/list.jsp")
                .forward(request, response);
    }
}
