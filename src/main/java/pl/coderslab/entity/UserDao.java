package pl.coderslab.entity;

import org.mindrot.jbcrypt.BCrypt;
import pl.coderslab.utils.DbUtil;

import java.sql.*;
import java.util.ArrayList;

public class UserDao {

    private static final String CREATE_USER_QUERY =
            "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
    private static final String READ_USER_QUERY =
            "SELECT * FROM users WHERE id = ?";
    private static final String UPDATE_USER_QUERY =
            "UPDATE users SET username = ?, email = ?, password = ? WHERE id = ?";
    private static final String DELETE_USER_QUERY =
            "DELETE FROM users WHERE id = ?";
    private static final String ALL_USERS_QUERY =
            "SELECT * FROM users";

    private String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public User create(User user) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(CREATE_USER_QUERY, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getEmail());
            statement.setString(3, hashPassword(user.getPassword()));
            statement.executeUpdate();
            ResultSet resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                user.setId(resultSet.getInt(1));
            }
            System.out.println("Record added.");
            return user;
        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("A user with this e-mail already exists. Try again.");
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public User read(int userId) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(READ_USER_QUERY);
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new User(
                        resultSet.getInt("id"),
                        resultSet.getString("username"),
                        resultSet.getString("email"),
                        resultSet.getString("password")
                );
            } else {
                System.out.println("Id doesn't exist. Try again.");
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void update(User user) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(UPDATE_USER_QUERY);
            if (isExistRecord(user.getId(), conn)) {
                statement.setString(1, user.getUserName());
                statement.setString(2, user.getEmail());
                statement.setString(3, hashPassword(user.getPassword()));
                statement.setInt(4, user.getId());
                statement.executeUpdate();
                System.out.println("Successfully updated!");
            } else {
                System.out.println("Record doesn't exist.");
            }
        }  catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("A user with this e-mail already exists. Try again.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int userId) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(DELETE_USER_QUERY);
            if (isExistRecord(userId, conn)) {
                statement.setInt(1, userId);
                statement.executeUpdate();
                System.out.println("Successfully deleted!");
            } else {
                System.out.println("Record doesn't exist.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<User> findAll() {
        try (Connection conn = DbUtil.getConnection()) {
            ArrayList<User> allUsers = new ArrayList<>();
            PreparedStatement statement = conn.prepareStatement(ALL_USERS_QUERY);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("email")
                );
                allUsers.add(user);
            }
            if (allUsers.size() <= 0) {
                System.out.println("No records in table.");
            }
            return allUsers;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    //    metoda sprawdza czy rekord istnieje w bazie danych
    private boolean isExistRecord(int id, Connection dbConn) {
        final String SQL = "SELECT 1 FROM users WHERE id = ?";
        try {
            PreparedStatement ps = dbConn.prepareStatement(SQL);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
