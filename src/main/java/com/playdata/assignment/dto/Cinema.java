package com.playdata.assignment.dto;

public class Cinema {
    private Integer id;
    private String cinemaName;
    private String address;
    private Integer capacityChair;

    public Cinema(Integer id, String cinemaName, String address, Integer capacityChair) {
        this.id = id;
        this.cinemaName = cinemaName;
        this.address = address;
        this.capacityChair = capacityChair;
    }

    public Integer getId() {
        return id;
    }

    public String getCinemaName() {
        return cinemaName;
    }

    public String getAddress() {
        return address;
    }

    public Integer getCapacityChair() {
        return capacityChair;
    }
}
