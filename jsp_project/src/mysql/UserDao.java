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
    public static int USER_DELETE_SUCCESS = 6;
    public static int USER_DELETE_FAIL = 7;
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
        String query = "INSERT INTO member (member_id, member_pw, member_name, member_phone, member_email) VALUES (?,?,?,?,?)";
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPw());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getPhone());
            pstmt.setString(5, user.getEmail());
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

    public int updateUser(String id, UserDto user) {
        int rt = 0;

        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "UPDATE member SET member_id=?, member_name=?," +
                "member_phone=?, member_email=? WHERE member_id=?";
        try {
            conn = DatabaseUtil.getConnection();

            if (conn == null) return rt;

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getName());
            pstmt.setString(3, user.getPhone());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, id);
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
        String query = "SELECT member_id FROM member WHERE member_id = ?";

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
        String query = "SELECT member_pw FROM member WHERE member_id = ?";

        try {
            conn = DatabaseUtil.getConnection();

            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (pw.equals(rs.getString("member_pw")))
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

        String query = "SELECT * FROM member WHERE member_id = ?";

        try {
            conn = DatabaseUtil.getConnection();

            if (conn == null) return user;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user = new UserDto.Builder()
                        .id(rs.getString("member_id"))
                        .pw(rs.getString("member_pw"))
                        .name(rs.getString("member_name"))
                        .phone(rs.getString("member_phone"))
                        .email(rs.getString("member_email"))
                        .build();
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

    public int deleteId(String id){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query = "DELETE FROM member WHERE member_id = ?";

        try {
            conn = DatabaseUtil.getConnection();

            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.executeUpdate();
            rt = USER_DELETE_SUCCESS;
        } catch (SQLException e) {
            rt = USER_DELETE_FAIL;
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

    public String getposition(String id) {
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        UserDto user = null;
        String st = null;

        String query = "SELECT member_position FROM member WHERE member_id = ?";

        try {
            conn = DatabaseUtil.getConnection();

            if (conn == null) return null;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                st= rs.getString("member_position");
                System.out.println(st);
                return st;
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
        return st;
    }

    public ResultSet getMember(){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query = "SELECT * FROM member";

        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rs;
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
}