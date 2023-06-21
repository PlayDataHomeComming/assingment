package com.playdata.assignment.dto;

public class Preview {
    private Integer id;
    private String movieName;
    private Integer dateOfPreview;

    public Integer getId() {
        return id;
    }

    public String getMovieName() {
        return movieName;
    }

    public Integer getDateOfPreview() {
        return dateOfPreview;
    }

    public Preview(Integer id, String movieName, Integer dateOfPreview) {
        this.id = id;
        this.movieName = movieName;
        this.dateOfPreview = dateOfPreview;
    }
}
