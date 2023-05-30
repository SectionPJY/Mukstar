package com.spring.mukstar.dto;

public class UserDTO {

    private String u_id;
    private String u_pw;
    private String u_info;
    private String u_nickname;
    private String u_phone;
    private String u_img;
    private int u_drop;

    public UserDTO(String u_id, String u_pw, String u_info, String u_nickname, String u_phone, String u_img, int u_drop) {
        this.u_id = u_id;
        this.u_pw = u_pw;
        this.u_info = u_info;
        this.u_nickname = u_nickname;
        this.u_phone = u_phone;
        this.u_img = u_img;
        this.u_drop = u_drop;
    }

    public String getU_id() {
        return u_id;
    }

    public void setU_id(String u_id) {
        this.u_id = u_id;
    }

    public String getU_pw() {
        return u_pw;
    }

    public void setU_pw(String u_pw) {
        this.u_pw = u_pw;
    }

    public String getU_nickname() {
        return u_nickname;
    }

    public void setU_nickname(String u_nickname) {
        this.u_nickname = u_nickname;
    }

    public String getU_phone() {
        return u_phone;
    }

    public void setU_phone(String u_phone) {
        this.u_phone = u_phone;
    }

    public String getU_img() {
        return u_img;
    }

    public void setU_img(String u_img) {
        this.u_img = u_img;
    }

    public int getU_drop() {
        return u_drop;
    }

    public void setU_drop(int u_drop) {
        this.u_drop = u_drop;
    }

    public String getU_info() {
        return u_info;
    }

    public void setU_info(String u_info) {
        this.u_info = u_info;
    }
}
