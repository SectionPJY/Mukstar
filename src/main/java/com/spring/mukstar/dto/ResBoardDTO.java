package com.spring.mukstar.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;

public class ResBoardDTO {

    private int rb_id;
    private int rb_rid;
    private String rb_uid;
    private String rb_sub;
    private int rb_rating;
    private String rb_contents;
    private int rb_view;
    private String rb_date;
    private int rb_like;
    private String sort;
    private String r_name;
    private String r_address;

    public ResBoardDTO(int rb_id, int rb_rid, String rb_uid, String rb_sub, int rb_rating, String rb_contents, int rb_view, Timestamp rb_date, int rb_like) {
        this.rb_id = rb_id;
        this.rb_rid = rb_rid;
        this.rb_uid = rb_uid;
        this.rb_sub = rb_sub;
        this.rb_rating = rb_rating;
        this.rb_contents = rb_contents;
        this.rb_view = rb_view;
        this.rb_date = changeDate(rb_date);
        this.rb_like = rb_like;
    }

    public ResBoardDTO(int rb_id, String rb_uid, String rb_sub, int rb_rating, String rb_contents, int rb_view, Timestamp rb_date, String r_name, String r_address) {
        this.rb_id = rb_id;
        this.rb_uid = rb_uid;
        this.rb_sub = rb_sub;
        this. rb_rating = rb_rating;
        this. rb_contents = rb_contents;
        this. rb_view = rb_view;
        this.rb_date = changeDate(rb_date);
        this.r_name = r_name;
        this.r_address = r_address;
    }

    public int getRb_id() {
        return rb_id;
    }

    public void setRb_id(int rb_id) {
        this.rb_id = rb_id;
    }

    public int getRb_rid() {
        return rb_rid;
    }

    public void setRb_rid(int rb_rid) {
        this.rb_rid = rb_rid;
    }

    public String getRb_uid() {
        return rb_uid;
    }

    public void setRb_uid(String rb_uid) {
        this.rb_uid = rb_uid;
    }

    public String getRb_sub() {
        return rb_sub;
    }

    public void setRb_sub(String rb_sub) {
        this.rb_sub = rb_sub;
    }

    public int getRb_rating() {
        return rb_rating;
    }

    public void setRb_rating(int rb_rating) {
        this.rb_rating = rb_rating;
    }

    public String getRb_contents() {
        return rb_contents;
    }

    public void setRb_contents(String rb_contents) {
        this.rb_contents = rb_contents;
    }

    public int getRb_view() {
        return rb_view;
    }

    public void setRb_view(int rb_view) {
        this.rb_view = rb_view;
    }

    public String getRb_date() {
        return rb_date;
    }

    public void setRb_date(String rb_date) {
        this.rb_date = rb_date;
    }

    public int getRb_like() {
        return rb_like;
    }

    public void setRb_like(int rb_like) {
        this.rb_like = rb_like;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
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

    private String changeDate(Timestamp rb_date) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
        String result = formatter.format(rb_date.toLocalDateTime());

        return result;
    }
}
