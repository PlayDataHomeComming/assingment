package com.playdata.assignment.dao;
import com.playdata.assignment.config.JdbcConnection;
import com.playdata.assignment.dto.Cinema;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    public List<Cinema> relatedCinemaPrint(String previewId){
        Connection conn = new JdbcConnection().getJdbc();
        String sql = "select * from (select * from cinema,preview_cinema where cinema.id=preview_cinema.cinema_id)as t where preview_id=?";
        List<Cinema> cinemas= new ArrayList<Cinema>();
        try {
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,previewId);
            ResultSet res = psmt.executeQuery();
            while (res.next()){
                cinemas.add(new Cinema(res.getInt("pc_id"),res.getString("cinema_name"),res.getString("address"),1));
                //여기서 id는 pc_id임을 명심하자. Cinema의 id공간에 pc_id를 넣었다(객체 또 만들기 귀찮아서)->잘못 짠 코드임
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        try {
            conn.close();
        } catch (SQLException e) {
            System.out.println("connection close fail");
        }
        return cinemas;
    }
}
