package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import com.spring.mukstar.dto.ResBoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Service
public class BoardListCommand {

    @Autowired
    private ResBoardDAO dao;

    public List<ResBoardDTO> execute(HttpServletRequest request) {
        System.out.println("===== Board List Command is Running =====");

        List<ResBoardDTO> dtos = dao.boardList();
        if (null == dtos || dtos.isEmpty()) {
            System.out.println("===== List is Empty =====");

            return null;
        } else {
            System.out.println("===== List is Exists =====");
            for (ResBoardDTO res : dtos) {
                System.out.println("===== 게시글 번호 : " + res.getR_id() + " r_date 수정 =====");
                Timestamp temp = Timestamp.valueOf(res.getR_date());
                res.setR_date(changeDate(temp));
            }

            return dtos;
        }
    }

    private String changeDate(Timestamp r_date) {
        System.out.println("===== Date Format Change =====");
        System.out.println("수정 전 : " + r_date);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
        String result = formatter.format(r_date.toLocalDateTime());

        System.out.println("수정 후 : " + result);

        return result;
    }
}
