package pl.coderslab.users;

import org.mindrot.jbcrypt.BCrypt;
import pl.coderslab.entity.User;
import pl.coderslab.entity.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserEdit", value = "/user/edit")
public class UserEdit extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("id"));
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userHashPassword = hashPassword(request.getParameter("userPassword"));

        if (!UserDao.verifyEmail(userEmail)) {
            Cookie cookie = new Cookie("emailNotVerify", "true");
            cookie.setMaxAge(5);
            response.addCookie(cookie);

            response.sendRedirect(request.getContextPath() + "/user/edit?id=" + userId);
        } else if (!UserDao.isExistEmail(userEmail)) {
            User user = new User();
            user.setId(userId);
            user.setUserName(userName);
            user.setEmail(userEmail);
            user.setPassword(userHashPassword);

            UserDao userDao = new UserDao();
            userDao.update(user);
            response.sendRedirect(request.getContextPath() + "/user/list");
        } else {
            Cookie cookie = new Cookie("emailExist", "true");
            cookie.setMaxAge(5);
            response.addCookie(cookie);

            response.sendRedirect(request.getContextPath() + "/user/edit?id=" + userId);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        UserDao userDao = new UserDao();
        User read = userDao.read(Integer.parseInt(id));
        request.setAttribute("user", read);

        getServletContext().getRequestDispatcher("/users/edit.jsp")
                .forward(request, response);
    }

    private String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }
}
