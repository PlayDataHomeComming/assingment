package com.playdata.assignment.dao;
import com.playdata.assignment.config.JdbcConnection;
import com.playdata.assignment.dto.Chair;
import com.playdata.assignment.dto.Cinema;
import com.playdata.assignment.dto.Preview;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

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

    public List<Chair> getChair(String pcId){
        Connection conn = new JdbcConnection().getJdbc();
        List<Chair> chairs=new ArrayList<Chair>();
        String sql = "select * from chair "+
                "where preview_cinema_id=?";
        //preview_cinema_id로 input
        try {
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,pcId);//cinema_preview_id 입력한거임
            ResultSet res = psmt.executeQuery();
            while (res.next()){
                chairs.add(new Chair(res.getInt("id"),res.getInt("preview_cinema_id"),res.getInt("x"),res.getInt("y"),res.getString("status")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            conn.close();
        } catch (SQLException e) {
            System.out.println("connection close fail");
        }
        return chairs;
    }

    public Integer changeStatusAndPersonInsert(String chairId,String name,String phoneNum){
        Connection conn = new JdbcConnection().getJdbc();
        String checkChairSql = "select * from person where phone_num =?";
        List<Integer> checkChair_id = new ArrayList<Integer>();
        try {
            PreparedStatement psmt = conn.prepareStatement(checkChairSql);
            psmt.setString(1,phoneNum);
            ResultSet res = psmt.executeQuery();
            while (res.next()){
                checkChair_id.add(res.getInt("chair_id"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

//      해당하는 check_id의 pc_id 저장
        List<Integer> check_pc_id = new ArrayList<Integer>();
        String Sql = "select * from chair, preview_cinema where chair.preview_cinema_id=preview_cinema.pc_id " +
                "and chair.id=?";
        for (Integer chair_id:checkChair_id) {
            try {
                PreparedStatement psmt = conn.prepareStatement(Sql);
                psmt.setInt(1,chair_id);
                ResultSet res = psmt.executeQuery();
                while (res.next()){
                    check_pc_id.add(res.getInt("preview_cinema_id"));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        Sql = "select * from chair, preview_cinema where chair.preview_cinema_id=preview_cinema.pc_id " +
                "and chair.id=?";
        for (Integer chair_id:checkChair_id) {
            try {
                PreparedStatement psmt = conn.prepareStatement(Sql);
                psmt.setString(1,chairId);
                ResultSet res = psmt.executeQuery();
                while (res.next()){
                    for (Integer cd_id:check_pc_id) {
                        if (cd_id==res.getInt("preview_cinema_id")){
                            System.out.println("같은 시사회 선택 금지입니다. 다른 시사회를 선택 하십시오.");
                            return 1;
                        }
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }



        String checkSql = "select * from chair where id=?";
        String checkChairStatus=null;
        try {
            PreparedStatement psmt = conn.prepareStatement(checkSql);
            psmt.setString(1,chairId);
            ResultSet res = psmt.executeQuery();
            while (res.next()){
                checkChairStatus=res.getString("status");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if(checkChairStatus.equals("X")) {
            return 2;
        }
        String sql = "update chair set status=\'X\' where id=?";
        try {
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, chairId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        String sql5 = "insert into person(chair_id, name,phone_num)\n" +
                "values (?, ?, ?)";
        try {
            PreparedStatement psmt = conn.prepareStatement(sql5);
            psmt.setString(1, chairId);
            psmt.setString(2, name);
            psmt.setString(3, phoneNum);
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
        return 3;

    }

    public List<Preview> relatedPreviewPrint(String cinemaId){
        Connection conn = new JdbcConnection().getJdbc();
        List<Preview> previews=new ArrayList<Preview>();
        String sql = "select * from (select * from preview,preview_cinema where preview.id=preview_cinema.preview_id)as t where cinema_id=?";
        try {
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,cinemaId);
            ResultSet res = psmt.executeQuery();
            while (res.next()){
                previews.add(new Preview(res.getInt("pc_id"),res.getString("movie_name"), res.getString("date_of_preview")));
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




}
