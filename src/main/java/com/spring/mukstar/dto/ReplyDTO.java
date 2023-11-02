package com.spring.mukstar.dto;

import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;

public class ReplyDTO {

    private int r_id;
    private int r_bid;
    private String r_uid;
    private String r_contents;
    private String r_date;

    public ReplyDTO(int r_id, int r_bid, String r_uid, String r_contents, Timestamp r_date) {
        this.r_id = r_id;
        this.r_bid = r_bid;
        this.r_uid = r_uid;
        this.r_contents = r_contents;
        this.r_date = changeDate(r_date);
    }

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public int getR_bid() {
        return r_bid;
    }

    public void setR_bid(int r_bid) {
        this.r_bid = r_bid;
    }

    public String getR_uid() {
        return r_uid;
    }

    public void setR_uid(String r_uid) {
        this.r_uid = r_uid;
    }

    public String getR_contents() {return r_contents; }

    public void setR_contents(String r_contents) {this.r_contents = r_contents; }

    public String getR_date() {
        return r_date;
    }

    public void setR_date(String r_date) {
        this.r_date = r_date;
    }

    private String changeDate(Timestamp rb_date) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
        String result = formatter.format(rb_date.toLocalDateTime());

        return result;
    }
}
