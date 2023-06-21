package com.playdata.assignment.dao;

import com.playdata.assignment.config.JdbcConnection;
import com.playdata.assignment.dto.Cinema;
import com.playdata.assignment.dto.Person;
import com.playdata.assignment.dto.Preview;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDao {
    public void preInsert(String movieName, String dateOfPreview) {
        Connection conn = new JdbcConnection().getJdbc();

        String sql = "insert into preview(movie_name, date_of_preview)\n" +
                "values (?, ?)";
        try {
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, movieName);
            psmt.setString(2, dateOfPreview);
            if (psmt.executeUpdate() == 0) {
                System.out.println("insertPreview err");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            conn.close();
        } catch (SQLException e) {
            System.out.println("connection close fail");
        }

    }
    public void cinInsert(String cinemaName, String address, String numChair) {
        Connection conn = new JdbcConnection().getJdbc();
        String sql = "insert into cinema(cinema_name, address,capacity_chair)\n" +
                "values (?, ?,?)";
        try {
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, cinemaName);
            psmt.setString(2, address);
            psmt.setString(3, numChair);

            if (psmt.executeUpdate() == 0) {
                System.out.println("insertPreview err");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List<Preview> getPreview() {
        Connection conn = new JdbcConnection().getJdbc();
        List<Preview> previews=new ArrayList<Preview>();
        String sql = "select * from preview";
          try {
            PreparedStatement psmt = conn.prepareStatement(sql);
            ResultSet res = psmt.executeQuery();
//            System.out.println("시사회No.\t영화 제목\t\t\t\t\t\t(상영 날짜)");
            while (res.next()) {
                previews.add(new Preview(res.getInt("id"),res.getString("movie_name"), res.getString("date_of_preview")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            conn.close();
        } catch (SQLException e) {
            System.out.println("connection close fail");
        }
        return previews;
    }

    public List<Cinema> getCinema() {
        Connection conn = new JdbcConnection().getJdbc();
        String sql = "select * from cinema ";
        List<Cinema> cinemas=new ArrayList<Cinema>();
        try {
            PreparedStatement psmt = conn.prepareStatement(sql);
            ResultSet res = psmt.executeQuery();
            while (res.next()) {
//                System.out.println(res.getString("cinema_name"));
                cinemas.add(new Cinema(res.getInt("id"),res.getString("cinema_name"),res.getString("address"),res.getInt("capacity_chair")));
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

    public void insertCombinePreview(String previewId, String cinemaId){
        Connection conn = new JdbcConnection().getJdbc();
        String sql = "insert into preview_cinema(preview_id, cinema_id)\n" +
                "values (?, ?)";
        try {
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, previewId);
            psmt.setString(2, cinemaId);
            if (psmt.executeUpdate() == 0) {
                System.out.println("insertPreview err");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        sql = "select * from (select * from cinema,preview_cinema where cinema.id=preview_cinema.cinema_id)as t "
                +"where preview_id=? and cinema_id=?";
        Integer previewCinemaId=null;
        Integer numChair=null;
        try {
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,previewId);
            psmt.setString(2,cinemaId);
            ResultSet res = psmt.executeQuery();
            while (res.next()){
                previewCinemaId=res.getInt("pc_id");
                numChair=res.getInt("capacity_chair");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        sql = "insert into chair(x, y,preview_cinema_id) " +
                "values (?, ?, ?)";
        int x;
        int y;
        for(int i = 0; i<numChair; i++) {
            y=(int)(i/5)+1;
            x=(i%5)+1;
            try {
                PreparedStatement psmt = conn.prepareStatement(sql);
                psmt.setInt(1, x);
                psmt.setInt(2, y);
                psmt.setInt(3, previewCinemaId);
                if (psmt.executeUpdate() == 0) {
                    System.out.println("insertChair err");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        try {
            conn.close();
        } catch (SQLException e) {
            System.out.println("connection close fail");
        }
    }

    public List<Person>  printPerson() {
        Connection conn = new JdbcConnection().getJdbc();
        List<Person> people=new ArrayList<Person>();
        String sql =
                "SELECT * FROM PERSON,PREVIEW_CINEMA,PREVIEW,CINEMA,CHAIR "+
                        "WHERE PERSON.CHAIR_ID = CHAIR.ID AND CHAIR.PREVIEW_CINEMA_ID=PREVIEW_CINEMA.PC_ID AND PREVIEW.ID=PREVIEW_CINEMA.PREVIEW_ID AND CINEMA.ID=PREVIEW_CINEMA.CINEMA_ID";
        try {
            PreparedStatement psmt = conn.prepareStatement(sql);
            ResultSet res = psmt.executeQuery();
            while (res.next()) {
                people.add(new Person(res.getInt("id"),res.getString("name"),res.getString("phone_num"),res.getString("cinema_name"),res.getString("address"),res.getString("movie_name"),res.getString("date_of_preview")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        try {
            conn.close();
        } catch (SQLException e) {
            System.out.println("connection close fail");
        }
        return people;
    }

}
