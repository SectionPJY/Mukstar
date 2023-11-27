package com.spring.mukstar.command.qna;

import com.spring.mukstar.dao.QnADAO;
import com.spring.mukstar.dto.QnADTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class QnASelectCommand {

    @Autowired
    private QnADAO dao;

    public List<QnADTO> execute(HttpServletRequest request) {
        System.out.println("===== QnA Select Command is Running =====");

        int q_id = Integer.parseInt(request.getParameter("q_id"));

        List<QnADTO> dto = dao.selectQna(q_id);
        if (dto.isEmpty() || null == dto) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");

            return dto;
        }
    }
}
