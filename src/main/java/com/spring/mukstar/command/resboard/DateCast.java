package com.spring.mukstar.command.resboard;

import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;

public class DateCast {

    protected String changeDate(Timestamp rb_date) {
        System.out.println("===== Date Format Change =====");
        System.out.println("수정 전 : " + rb_date);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
        String result = formatter.format(rb_date.toLocalDateTime());

        System.out.println("수정 후 : " + result);

        return result;
    }
}
