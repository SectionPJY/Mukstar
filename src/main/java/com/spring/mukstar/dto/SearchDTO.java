package com.spring.mukstar.dto;

public class SearchDTO {

    private String u_id;
    private String u_nickname;
    private long rb_count;

    public SearchDTO(String u_id, String u_nickname, long rb_count) {
        this.u_id = u_id;
        this.u_nickname = u_nickname;
        this.rb_count = rb_count;
    }

    public String getU_nickname() {
        return u_nickname;
    }

    public void setU_nickname(String u_nickname) {
        this.u_nickname = u_nickname;
    }

    public long getRb_count() {
        return rb_count;
    }

    public void setRb_count(long rb_count) {
        this.rb_count = rb_count;
    }

    public String getU_id() {
        return u_id;
    }

    public void setU_id(String u_id) {
        this.u_id = u_id;
    }
}
