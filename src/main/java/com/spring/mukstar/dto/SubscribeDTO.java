package com.spring.mukstar.dto;

import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;

public class SubscribeDTO {

    private int s_id;
    private String s_channel;
    private String s_subscriber;
    private String s_date;
    private String u_nickname;

    public SubscribeDTO(int s_id, String s_channel, String s_subscriber, Timestamp s_date) {
        this.s_id = s_id;
        this.s_channel = s_channel;
        this.s_subscriber = s_subscriber;
        this.s_date = changeDate(s_date);
    }

    public SubscribeDTO(String s_channel, String s_subscriber, Timestamp s_date, String u_nickname) {
        this.s_channel = s_channel;
        this.s_subscriber = s_subscriber;
        this.s_date = changeDate(s_date);
        this.u_nickname = u_nickname;
    }

    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
    }

    public String getS_channel() {
        return s_channel;
    }

    public void setS_channel(String s_channel) {
        this.s_channel = s_channel;
    }

    public String getS_subscriber() {
        return s_subscriber;
    }

    public void setS_subscriber(String s_subscriber) {
        this.s_subscriber = s_subscriber;
    }

    public String getS_date() {
        return s_date;
    }

    public void setS_date(String s_date) {
        this.s_date = s_date;
    }

    public String getU_nickname() {
        return u_nickname;
    }

    public void setU_nickname(String u_nickname) {
        this.u_nickname = u_nickname;
    }

    private String changeDate(Timestamp s_date) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
        String result = formatter.format(s_date.toLocalDateTime());

        return result;
    }
}
