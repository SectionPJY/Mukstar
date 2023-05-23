package com.spring.mukstar.dto;

import java.sql.Timestamp;
import java.util.Date;

public class ResBoardDTO {

    private int r_id;
    private String r_uid;
    private String r_sub;
    private String r_name;
    private String r_address;
    private int r_rating;
    private String r_contents;
    private int r_view;
    private String r_date;
    private boolean r_mark;

    public ResBoardDTO(int r_id, String r_uid, String r_sub, String r_name, String r_address,
                       int r_rating, String r_contents, int r_view, String r_date, boolean r_mark) {
        this.r_id = r_id;
        this.r_uid = r_uid;
        this.r_sub = r_sub;
        this.r_name = r_name;
        this.r_address = r_address;
        this.r_rating = r_rating;
        this.r_contents = r_contents;
        this.r_view = r_view;
        this.r_date = r_date;
        this.r_mark = r_mark;
    }

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public String getR_uid() {
        return r_uid;
    }

    public void setR_uid(String r_uid) {
        this.r_uid = r_uid;
    }

    public String getR_sub() {
        return r_sub;
    }

    public void setR_sub(String r_sub) {
        this.r_sub = r_sub;
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

    public int getR_rating() {
        return r_rating;
    }

    public void setR_rating(int r_rating) {
        this.r_rating = r_rating;
    }

    public String getR_contents() {
        return r_contents;
    }

    public void setR_contents(String r_contents) {
        this.r_contents = r_contents;
    }

    public int getR_view() {
        return r_view;
    }

    public void setR_view(int r_view) {
        this.r_view = r_view;
    }

    public String getR_date() {
        return r_date;
    }

    public void setR_date(String r_date) {
        this.r_date = r_date;
    }

    public boolean isR_mark() {
        return r_mark;
    }

    public void setR_mark(boolean r_mark) {
        this.r_mark = r_mark;
    }
}
