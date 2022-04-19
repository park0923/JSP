package mysql;

import beans.BoardDto;
import beans.UserDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class BoardDao {
    public static int NOTICE_EXISTENT = 1;
    public static int NOTICE_NONEXISTENT = 2;
    public static int NOTICE_WRITE_SUCCESS = 3;
    public static int NOTICE_DELETE_SUCCESS = 4;
    public static int NOTICE_LOGIN_FAIL = 5;
    private static BoardDao instance = new BoardDao();
    public static BoardDao getInstance() { return instance; }

    private BoardDao(){
    }

    public int getNoticeId(){
        int id = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "SELECT max(id) from board";
        try{
            conn = DatabaseUtil.getConnection();
            if(conn == null )return id;
            pstmt=conn.prepareStatement(query);
            ResultSet resultSet = pstmt.executeQuery();
            if(resultSet.next()){
                id=resultSet.getInt("max(id)")+1;
            }
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
        return id;
    }

    public int insertBoard(BoardDto boardDto, String name){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "INSERT INTO board VALUES (?,?,?,?,?,?,?)";
        try{
            conn = DatabaseUtil.getConnection();
            LocalDateTime now = LocalDateTime.now();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, getNoticeId());
            pstmt.setString(2, boardDto.getTitle());
            pstmt.setString(3, boardDto.getContents());
            pstmt.setString(4, name);
            pstmt.setInt(5, 0);
            pstmt.setString(6, now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
            pstmt.setString(7, now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
            pstmt.executeUpdate();
            rt = NOTICE_WRITE_SUCCESS;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try{
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();;
            }catch (Exception e){
                e.printStackTrace();;
            }
        }
        return rt;
    }

    public ResultSet getBoard(){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query = "SELECT * FROM board";

        try{
            conn = DatabaseUtil.getConnection();

            if(conn == null) return rs;
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public BoardDto getBoardId(String id){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDto boardDto = null;
        String query = "SELECT * FROM board WHERE id = ?";

        try{
            conn = DatabaseUtil.getConnection();

            if (conn == null) return boardDto;
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1,Integer.parseInt(id));
            rs = pstmt.executeQuery();
            if(rs.next()){
                boardDto = new BoardDto(rs.getInt("id"),
                rs.getString("title"),
                rs.getString("contents"),
                rs.getString("writer"),
                rs.getInt("readcount"),
                rs.getDate("createDay"),
                rs.getDate("updateDay"));
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
        return boardDto;
    }

    public int deleteBoard(String id){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "DELETE FROM board WHERE id = ?";

        try{
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1,Integer.parseInt(id));
            pstmt.executeUpdate();
            rt = NOTICE_DELETE_SUCCESS;
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
}
