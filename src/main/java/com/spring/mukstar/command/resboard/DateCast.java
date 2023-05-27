package com.spring.mukstar.command.resboard;

import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;

public class DateCast {

    protected String changeDate(Timestamp r_date) {
        System.out.println("===== Date Format Change =====");
        System.out.println("수정 전 : " + r_date);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
        String result = formatter.format(r_date.toLocalDateTime());

        System.out.println("수정 후 : " + result);

        return result;
    }
}
