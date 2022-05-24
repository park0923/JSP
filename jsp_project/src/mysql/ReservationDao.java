package mysql;

import beans.ReservationDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReservationDao {
    public static int RESERVATION_SUCCESS = 1;
    public static int SELECT_SUCCESS = 2;
    private static ReservationDao instance = new ReservationDao();

    public static ReservationDao getInstance() { return instance; }

    private ReservationDao(){
    }

    public int insertReservation(ReservationDto reservation, String seat) {
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "INSERT INTO reservation (reservation_id, reservation_lectureroom_num, reservation_startTime, reservation_endTime," +
                "reservation_seat, reservation_date) VALUES (?,?,?,?,?,?)";
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, reservation.getId());
            pstmt.setString(2, reservation.getLectureroomNum());
            pstmt.setString(3, reservation.getStartTime());
            pstmt.setString(4, reservation.getEndTime());
            pstmt.setString(5, seat);
            pstmt.setString(6, reservation.getDate());
            pstmt.executeUpdate();
            rt = RESERVATION_SUCCESS;
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

    public int insertReservationAm(ReservationDto reservation, String seat) {
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "INSERT INTO reservation (reservation_id, reservation_lectureroom_num, reservation_startTime, reservation_endTime," +
                "reservation_seat, reservation_date, reservation_state) VALUES (?,?,?,?,?,?,?)";
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, reservation.getId());
            pstmt.setString(2, reservation.getLectureroomNum());
            pstmt.setString(3, reservation.getStartTime());
            pstmt.setString(4, reservation.getEndTime());
            pstmt.setString(5, seat);
            pstmt.setString(6, reservation.getDate());
            pstmt.setString(7, "승인");
            pstmt.executeUpdate();
            rt = RESERVATION_SUCCESS;
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

    public int selectLongTime(){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "SELECT MAX(CONVERT(SUBSTR(reservation_endTime,1,2), signed integer)), reservation_id FROM reservation";
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.executeQuery();
            rt = SELECT_SUCCESS;
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

    public List<ReservationDto> selectTime(String room, String date, int start, int end){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "SELECT reservation_seat FROM reservation WHERE reservation_date=? " +
                "AND reservation_lectureroom_num=?"+
                "AND ((? >= CONVERT(SUBSTR(reservation_startTime,1,2), signed integer) AND ? < CONVERT(SUBSTR(reservation_endTime,1,2), signed integer))" +
                "OR (? >= CONVERT(SUBSTR(reservation_startTime,1,2), signed integer) AND ? < CONVERT(SUBSTR(reservation_endTime,1,2), signed integer))" +
                "OR (? <= CONVERT(SUBSTR(reservation_startTime,1,2), signed integer) AND ? >= CONVERT(SUBSTR(reservation_endTime,1,2), signed integer)))" +
                "AND reservation_state='승인'";
        ResultSet rs = null;
        ArrayList<ReservationDto> list = new ArrayList<>();
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return null;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, date);
            pstmt.setString(2, room);
            pstmt.setInt(3, start);
            pstmt.setInt(4, start);
            pstmt.setInt(5, end);
            pstmt.setInt(6, end);
            pstmt.setInt(7, start);
            pstmt.setInt(8, end);
            rs = pstmt.executeQuery();

            while(rs.next()){
                ReservationDto dto = new ReservationDto.Builder()
                        .seat(rs.getString("reservation_seat"))
                        .build();
                list.add(dto);
            }
            return list;
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
        return null;
    }

    public List<ReservationDto> selectSeat(String date, int start, int end){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "SELECT reservation_seat FROM reservation " +
                "WHERE reservation_date=? AND (CONVERT(SUBSTR(reservation_startTime,1,2), signed integer) >= ? " +
                "OR CONVERT(SUBSTR(reservation_endTime,1,2), signed integer) <= ?)";
        ResultSet rs = null;
        ArrayList<ReservationDto> list = new ArrayList<>();
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return null;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, date);
            pstmt.setInt(2, start);
            pstmt.setInt(3, end);
            rs = pstmt.executeQuery();

            while(rs.next()){
                ReservationDto dto = new ReservationDto.Builder()
                        .seat(rs.getString("reservation_seat"))
                        .build();
                list.add(dto);
            }
            return list;
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
        return null;
    }
}
