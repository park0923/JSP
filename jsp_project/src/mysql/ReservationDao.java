package mysql;

import beans.ReservationDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReservationDao {
    public static int RESERVATION_SUCCESS = 1;
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
}
