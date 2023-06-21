package com.playdata.assignment.dto;

public class Cinema {
    private Integer id;
    private String cinemaName;
    private String adderess;
    private Integer capacityChair;

    public Cinema(Integer id, String cinemaName, String adderess, Integer capacityChair) {
        this.id = id;
        this.cinemaName = cinemaName;
        this.adderess = adderess;
        this.capacityChair = capacityChair;
    }

    public Integer getId() {
        return id;
    }

    public String getCinemaName() {
        return cinemaName;
    }

    public String getAdderess() {
        return adderess;
    }

    public Integer getCapacityChair() {
        return capacityChair;
    }
}
