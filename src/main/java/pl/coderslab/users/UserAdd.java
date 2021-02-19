package pl.coderslab.users;

import org.mindrot.jbcrypt.BCrypt;
import pl.coderslab.entity.User;
import pl.coderslab.entity.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "UserAdd", value = "/user/add")
public class UserAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userHashPassword = hashPassword(request.getParameter("userPassword"));

        if (!UserDao.isExistEmail(userEmail)) {
            User user = new User();
            user.setUserName(userName);
            user.setEmail(userEmail);
            user.setPassword(userHashPassword);

            UserDao userDao = new UserDao();
            userDao.create(user);
            response.sendRedirect(request.getContextPath() + "/user/list");
        } else {
            Cookie cookie = new Cookie("emailExist", "true");
            cookie.setMaxAge(5);
            response.addCookie(cookie);

            response.sendRedirect(request.getContextPath() + "/user/add");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        getServletContext().getRequestDispatcher("/users/add.jsp")
                .forward(request, response);
    }

    private String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }
}
