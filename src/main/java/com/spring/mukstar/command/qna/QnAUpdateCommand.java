package com.spring.mukstar.command.qna;

import com.spring.mukstar.dao.QnADAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class QnAUpdateCommand {

    @Autowired
    private QnADAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== QnA Update Command is Running =====");

        int q_id = Integer.parseInt(request.getParameter("q_id"));
        String q_uid = request.getParameter("q_uid");
        String q_sub = request.getParameter("q_sub");
        String q_contents = request.getParameter("q_contents");
        System.out.println(q_id + ", " + q_uid + ", " + q_sub + ", " + q_contents);

        int result = dao.updateQna(q_id, q_uid, q_sub, q_contents);
        if (1 == result) {
            System.out.println("===== Update Success =====");

            return result;
        } else {
            System.out.println("===== Update Fail =====");

            return -1;
        }
    }
}
