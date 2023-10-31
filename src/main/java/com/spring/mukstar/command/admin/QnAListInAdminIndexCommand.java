package com.spring.mukstar.command.admin;

import com.spring.mukstar.command.resboard.DateCast;
import com.spring.mukstar.dao.QnADAO;
import com.spring.mukstar.dto.QnADTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class QnAListInAdminIndexCommand extends DateCast {

    @Autowired
    private QnADAO dao;

    public List<QnADTO> execute() {
        System.out.println("===== QnA List in Admin Index Command is Running =====");

        List<QnADTO> dtos = dao.qnaListAdminIndex();
        if (dtos.isEmpty() || dtos == null) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");
            for (QnADTO qna : dtos) {
                System.out.println("===== q_date 수정 =====");
                Timestamp tmp = Timestamp.valueOf(qna.getQ_date());
                qna.setQ_date(changeDate(tmp));
            }

            return dtos;
        }
    }
}
