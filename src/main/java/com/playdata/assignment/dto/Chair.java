package com.playdata.assignment.dto;

public class Chair {
    private Integer id;
    private Integer previewCinemaId;
    private Integer x;
    private Integer y;
    private String status;

    public Chair(Integer id, Integer previewCinemaId, Integer x, Integer y, String status) {
        this.id = id;
        this.previewCinemaId = previewCinemaId;
        this.x = x;
        this.y = y;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public Integer getPreviewCinemaId() {
        return previewCinemaId;
    }

    public Integer getX() {
        return x;
    }

    public Integer getY() {
        return y;
    }

    public String getStatus() {
        return status;
    }
}
