package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import com.spring.mukstar.dto.ResBoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class BoardSelectCommand {

    @Autowired
    private ResBoardDAO dao;

    public List<ResBoardDTO> execute(HttpServletRequest request) {
        System.out.println("===== Board Select Command is Running =====");

        int r_id = Integer.parseInt(request.getParameter("r_id"));
        List<ResBoardDTO> dto = dao.boardSelect(r_id);
        if (null == dto) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");
            Timestamp temp = Timestamp.valueOf(dto.get(0).getR_date());
            dto.get(0).setR_date(changeDate(temp));

            return dto;
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
