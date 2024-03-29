package com.spring.mukstar.command.qna;

import com.spring.mukstar.dao.QnADAO;
import com.spring.mukstar.dto.QnADTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class QnAListCommand {

    @Autowired
    private QnADAO dao;

    public List<QnADTO> execute() {
        System.out.println("===== QnA List Command is Running =====");

        List<QnADTO> dtos = dao.qnaList();
        if (dtos.isEmpty()) {
            System.out.println("===== List Load Fail =====");

            return null;
        } else {
            System.out.println("===== List Load Success =====");

            return dtos;
        }
    }

    public List<QnADTO> executeUid(HttpServletRequest request) {
        System.out.println("===== QnA List Command is Running with u_id =====");

        String u_id = request.getParameter("u_id");

        List<QnADTO> dtos = dao.qnaList(u_id);
        if (dtos.isEmpty()) {
            System.out.println("===== List Load Fail =====");

            return null;
        } else {
            System.out.println("===== List Load Success =====");

            return dtos;
        }
    }
}
