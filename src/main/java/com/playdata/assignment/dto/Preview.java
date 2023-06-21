package com.playdata.assignment.dto;

public class Preview {
    private Integer id;
    private String movieName;
    private String dateOfPreview;

    public Preview(Integer id, String movieName, String dateOfPreview) {
        this.id = id;
        this.movieName = movieName;
        this.dateOfPreview = dateOfPreview;
    }

    public Integer getId() {
        return id;
    }

    public String getMovieName() {
        return movieName;
    }

    public String getDateOfPreview() {
        return dateOfPreview;
    }
}
