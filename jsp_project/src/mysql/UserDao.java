package mysql;

import beans.UserDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    public static int USER_EXISTENT = 1;
    public static int USER_NONEXISTENT = 2;
    public static int USER_JOIN_SUCCESS = 3;
    public static int USER_LOGIN_SUCCESS = 4;
    public static int USER_LOGIN_FAIL = 5;
    private static UserDao instance = new UserDao();

    public static UserDao getInstance() {
        return instance;
    }

    private UserDao() {
    }

    public int insertUser(UserDto user) {
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "INSERT INTO USER VALUES (?,?,?,?)";
        try {
            conn = DatabaseUtil.getConnection();

            if (conn == null) return rt;

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPw());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getGrade());
            pstmt.executeUpdate();
            rt = USER_JOIN_SUCCESS;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return rt;
    }

    public int updateUser(UserDto user) {
        int rt = 0;

        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "UPDATE USER SET PW=?, GRADE=? WHERE ID=?";
        try {
            conn = DatabaseUtil.getConnection();

            if (conn == null) return rt;

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, user.getPw());
            pstmt.setString(2, user.getGrade());
            pstmt.setString(3, user.getId());
            rt = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rt;
    }

    public int confirmId(String id) {
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String query = "SELECT ID FROM USER WHERE ID = ?";

        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next())
                rt = USER_EXISTENT;
            else
                rt = USER_NONEXISTENT;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return rt;
    }

    public int confirmLogin(String id, String pw) {
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String query = "SELECT PW FROM USER WHERE ID = ?";

        try {
            conn = DatabaseUtil.getConnection();

            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (pw.equals(rs.getString("pw")))
                    rt = USER_LOGIN_SUCCESS;
                else
                    rt = USER_LOGIN_FAIL;
            } else
                rt = USER_NONEXISTENT;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rt;
    }

    public UserDto getUser(String id) {
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        UserDto user = null;

        String query = "SELECT * FROM USER WHERE ID = ?";

        try {
            conn = DatabaseUtil.getConnection();

            if (conn == null) return user;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user = new UserDto(rs.getString("id"),
                        rs.getString("pw"),
                        rs.getString("name"),
                        rs.getString("grade"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return user;
    }

}