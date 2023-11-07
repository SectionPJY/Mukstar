package com.spring.mukstar.dto;

public class RestaurantDTO {

    private int r_id;
    private String r_name;
    private String r_address;
    private boolean r_mark;

    public RestaurantDTO(int r_id, String r_name, String r_address, boolean r_mark) {
        this.r_id = r_id;
        this.r_name = r_name;
        this.r_address = r_address;
        this.r_mark = r_mark;
    }

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public String getR_name() {
        return r_name;
    }

    public void setR_name(String r_name) {
        this.r_name = r_name;
    }

    public String getR_address() {
        return r_address;
    }

    public void setR_address(String r_address) {
        this.r_address = r_address;
    }

    public boolean getR_mark() {
        return r_mark;
    }

    public void setR_mark(boolean r_mark) {
        this.r_mark = r_mark;
    }
}
