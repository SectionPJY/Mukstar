package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import com.spring.mukstar.dto.ResBoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class BoardListInAdminIndexCommand extends DateCast {

    @Autowired
    private ResBoardDAO dao;

    public List<ResBoardDTO> execute() {
        System.out.println("===== Board List in Admin Index Command is Running =====");

        List<ResBoardDTO> dtos = dao.adminSelectBoard();
        if (dtos.isEmpty() || dtos == null) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");
            for (ResBoardDTO res : dtos) {
                System.out.println("===== rb_date 수정 =====");
                Timestamp tmp = Timestamp.valueOf(res.getRb_date());
                res.setRb_date(changeDate(tmp));
            }

            return dtos;
        }
    }
}
