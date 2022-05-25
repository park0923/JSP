package mysql;

import java.time.LocalDateTime;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ScheduleDao {
    public static int SCHEDULE_EXISTENT = 1;
    public static int SCHEDULE_NONEXISTENT = 2;
    public static int SCHEDULE_INSERT_SUCCESS = 3;
    public static int SCHEDULE_DELETE_SUCCESS = 4;
    public static int SCHEDULE_LOGIN_FAIL = 5;
    public static int SCHEDULE_UPDATE_SUCCESS = 6;
    public static int SCHEDULE_UPDATE_FAIL = 7;

    private static ScheduleDao instance = new ScheduleDao();
    public static ScheduleDao getInstance() {
        return instance;
    }

    public int getScheduleId(){
        int id = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "SELECT max(schedule_index) from schedule";
        try{
            conn = DatabaseUtil.getConnection();
            if(conn == null )return id;
            pstmt=conn.prepareStatement(query);
            ResultSet resultSet = pstmt.executeQuery();
            if(resultSet.next()){
                id=resultSet.getInt("max(schedule_index)")+1;
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

    public ResultSet getSchedule() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query = "SELECT * FROM schedule";

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

    public int insertSchedule(String schedule_name, String schedule_lectureroom_num, String schedule_class_stime, String schedule_class_etime, String schedule_week){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "INSERT INTO schedule VALUES (?,?,?,?,?,?)";
        try{
            conn = DatabaseUtil.getConnection();
            LocalDateTime now = LocalDateTime.now();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, getScheduleId());
            pstmt.setString(2, schedule_name);
            pstmt.setString(3, schedule_lectureroom_num);
            pstmt.setString(4, schedule_class_stime);
            pstmt.setString(5, schedule_class_etime);
            pstmt.setString(6, schedule_week);
            pstmt.executeUpdate();
            rt = SCHEDULE_INSERT_SUCCESS;
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
}
