package com.spring.mukstar.command.qna;

import com.spring.mukstar.dao.QnADAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class QnADeleteCommand {

    @Autowired
    private QnADAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== QnA Delete Command is Running =====");

        int q_id = Integer.parseInt(request.getParameter("q_id"));

        int result = dao.deleteQna(q_id);
        if (1 == result) {
            System.out.println("===== Delete Success =====");

            return result;
        } else {
            System.out.println("===== Delete Fail =====");

            return -1;
        }
    }
}
