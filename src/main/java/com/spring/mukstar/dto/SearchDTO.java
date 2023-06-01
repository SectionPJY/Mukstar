package com.spring.mukstar.dto;

public class SearchDTO {

    private String u_id;
    private String u_nickname;
    private long r_count;

    public SearchDTO(String u_id, String u_nickname, long r_count) {
        this.u_id = u_id;
        this.u_nickname = u_nickname;
        this.r_count = r_count;
    }

    public String getU_nickname() {
        return u_nickname;
    }

    public void setU_nickname(String u_nickname) {
        this.u_nickname = u_nickname;
    }

    public long getR_count() {
        return r_count;
    }

    public void setR_count(long r_count) {
        this.r_count = r_count;
    }

    public String getU_id() {
        return u_id;
    }

    public void setU_id(String u_id) {
        this.u_id = u_id;
    }
}
