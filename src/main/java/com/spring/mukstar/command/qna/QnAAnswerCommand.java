package com.spring.mukstar.command.qna;

import com.spring.mukstar.dao.QnADAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class QnAAnswerCommand {
    @Autowired
    private QnADAO dao;
    @Autowired
    private HttpSession session;

    public int execute(HttpServletRequest request) {
        int q_id = Integer.parseInt(request.getParameter("q_id"));
        String q_ansCon = request.getParameter("q_ansCon");
        String q_ansAdmin = session.getAttribute("m_id").toString();

        int result = dao.qnaAnswer(q_id, q_ansCon, q_ansAdmin);
        if (1 == result) {
            return 1;
        } else {
            return -1;
        }
    }
}
