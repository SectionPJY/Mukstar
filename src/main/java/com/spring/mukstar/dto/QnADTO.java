package com.spring.mukstar.dto;

import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;

public class QnADTO {

    private int q_id;
    private String q_uid;
    private String q_sub;
    private String q_contents;
    private boolean q_answer;
    private String q_date;

    public QnADTO(int q_id, String q_uid, String q_sub, String q_contents, boolean q_answer, Timestamp q_date) {
        this.q_id = q_id;
        this.q_uid = q_uid;
        this.q_sub = q_sub;
        this.q_contents = q_contents;
        this.q_answer = q_answer;
        this.q_date = changeDate(q_date);
    }

    public int getQ_id() {
        return q_id;
    }

    public void setQ_id(int q_id) {
        this.q_id = q_id;
    }

    public String getQ_uid() {
        return q_uid;
    }

    public void setQ_uid(String q_uid) {
        this.q_uid = q_uid;
    }

    public String getQ_sub() {
        return q_sub;
    }

    public void setQ_sub(String q_sub) {
        this.q_sub = q_sub;
    }

    public String getQ_contents() {
        return q_contents;
    }

    public void setQ_contents(String q_contents) {
        this.q_contents = q_contents;
    }

    public boolean isQ_answer() {
        return q_answer;
    }

    public void setQ_answer(boolean q_answer) {
        this.q_answer = q_answer;
    }

    public String getQ_date() {return q_date;}

    public void setQ_date(String q_date) {this.q_date = q_date;}

    private String changeDate(Timestamp rb_date) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
        String result = formatter.format(rb_date.toLocalDateTime());

        return result;
    }
}
