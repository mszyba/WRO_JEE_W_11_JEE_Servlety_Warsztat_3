package pl.coderslab.entity;

import pl.coderslab.utils.DbUtil;

import java.sql.*;
import java.util.ArrayList;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class UserDao {

    private static final Logger log = LogManager.getLogger(UserDao.class);

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

    public User create(User user) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(CREATE_USER_QUERY, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.executeUpdate();
            ResultSet resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                user.setId(resultSet.getInt(1));
            }
            log.info("Added user: " + user.toString());
            return user;
        } catch (SQLIntegrityConstraintViolationException e) {
            log.warn("e-mail already exists: " + user.toString());
            return null;
        } catch (SQLException e) {
            log.error(e.getMessage());
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
                log.warn("Id doesn't exist: " + userId);
                return null;
            }
        } catch (SQLException e) {
            log.error(e.getMessage());
            return null;
        }
    }

    public void update(User user) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(UPDATE_USER_QUERY);
            if (isExistRecord(user.getId(), conn)) {
                statement.setString(1, user.getUserName());
                statement.setString(2, user.getEmail());
                statement.setString(3, user.getPassword());
                statement.setInt(4, user.getId());
                statement.executeUpdate();
                log.info(user + " successfully updated");
            } else {
                log.warn(user + " : record not exist");
            }
        }  catch (SQLIntegrityConstraintViolationException e) {
            log.warn("e-mail already exists: " + user.toString());
        } catch (SQLException e) {
            log.error(e.getMessage());
        }
    }

    public void delete(int userId) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(DELETE_USER_QUERY);
            if (isExistRecord(userId, conn)) {
                statement.setInt(1, userId);
                statement.executeUpdate();
                log.info("successfully deleted record id: " + userId);
            } else {
                log.warn("Record doesn't exist, id: " + userId);
            }
        } catch (SQLException e) {
            log.error(e.getMessage());
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
                log.warn("No records in table");
            }
            return allUsers;
        } catch (SQLException e) {
            log.error(e.getMessage());
            return null;
        }
    }

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

    public static boolean isExistEmail(String email) {
        final String SQL = "SELECT 1 FROM users WHERE email = ?";

        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            log.error(e.getMessage());
        }
        return false;
    }
}
