package com.spring.mukstar.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;

public class ResBoardDTO {

    private int rb_id;
    private String rb_uid;
    private String rb_sub;
    private String rb_name;
    private String rb_address;
    private int rb_rating;
    private String rb_contents;
    private int rb_view;
    private String rb_date;
    private boolean rb_mark;
    private String sort;

    public ResBoardDTO(int rb_id, String rb_uid, String rb_sub, String rb_name, String rb_address,
                       int rb_rating, String rb_contents, int rb_view, Timestamp rb_date, boolean rb_mark) {
        this.rb_id = rb_id;
        this.rb_uid = rb_uid;
        this.rb_sub = rb_sub;
        this.rb_name = rb_name;
        this.rb_address = rb_address;
        this.rb_rating = rb_rating;
        this.rb_contents = rb_contents;
        this.rb_view = rb_view;
        this.rb_date = changeDate(rb_date);
        this.rb_mark = rb_mark;
    }

    public int getRb_id() {
        return rb_id;
    }

    public void setRb_id(int rb_id) {
        this.rb_id = rb_id;
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

    public String getRb_name() {
        return rb_name;
    }

    public void setRb_name(String rb_name) {
        this.rb_name = rb_name;
    }

    public String getRb_address() {
        return rb_address;
    }

    public void setRb_address(String rb_address) {
        this.rb_address = rb_address;
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

    public boolean isrb_mark() {
        return rb_mark;
    }

    public void setRb_mark(boolean rb_mark) {
        this.rb_mark = rb_mark;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    private String changeDate(Timestamp rb_date) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
        String result = formatter.format(rb_date.toLocalDateTime());

        return result;
    }
}
