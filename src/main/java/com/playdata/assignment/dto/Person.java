package com.playdata.assignment.dto;

public class Person {
    private Integer id = null;
    private String name = null;
    private String phoneNum=null;
    private String cinemaName=null;
    private String address=null;
    private String movieName=null;
    private String dateOfPreview=null;

    public Person(Integer id, String name, String phoneNum, String cinemaName, String address, String movieName, String dateOfPreview) {
        this.id = id;
        this.name = name;
        this.phoneNum = phoneNum;
        this.cinemaName = cinemaName;
        this.address = address;
        this.movieName = movieName;
        this.dateOfPreview = dateOfPreview;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public String getCinemaName() {
        return cinemaName;
    }

    public String getAddress() {
        return address;
    }

    public String getMovieName() {
        return movieName;
    }

    public String getDateOfPreview() {
        return dateOfPreview;
    }
}
