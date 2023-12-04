package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import com.spring.mukstar.dto.ResBoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.List;

@Service
public class BoardInfoCommand extends DateCast {

    @Autowired
    private ResBoardDAO dao;

    public ResBoardDTO execute(HttpServletRequest request) {
        System.out.println("===== Board Select Command is Running =====");

        int rb_id = Integer.parseInt(request.getParameter("rb_id"));

        ResBoardDTO dto = dao.boardSelect(rb_id);
        if (null == dto) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");
            Timestamp temp = Timestamp.valueOf(dto.getRb_date());
            dto.setRb_date(changeDate(temp));

            return dto;
        }
    }
}
