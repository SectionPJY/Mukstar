package com.spring.mukstar.command.qna;

import com.spring.mukstar.dao.QnADAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class QnAInsertCommand {

    @Autowired
    private QnADAO dao;
    @Autowired
    private HttpSession session;

    public int execute(HttpServletRequest request) {
        System.out.println("===== QnA Insert Command is Running =====");

        String q_uid = session.getAttribute("u_id").toString();
        String q_sub = request.getParameter("q_sub");
        String q_contents = request.getParameter("q_contents");
        System.out.println("유저 ID : " + q_uid + ", 제목 : " + q_sub);

        int result = dao.insertQna(q_uid, q_sub, q_contents);
        if (1 == result) {
            System.out.println("===== QnA Insert Success =====");

            return 1;
        } else {
            System.out.println("===== QnA Insert Fail =====");

            return -1;
        }
    }
}
