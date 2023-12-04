package com.spring.mukstar.command.reply;

import com.spring.mukstar.dao.ReplyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class ReplyInsertCommand {

    @Autowired
    private ReplyDAO dao;
    @Autowired
    private HttpSession session;

    public int execute(HttpServletRequest request) {
        System.out.println("===== Reply Insert Command is Running =====");

        int r_bid = Integer.parseInt(request.getParameter("r_bid"));
        String r_uid = session.getAttribute("u_id").toString();
        String r_contents = request.getParameter("r_contents");
        System.out.println("게시글 ID : " + r_bid + ", 유저 ID : " + r_uid);

        int result = dao.insertReply(r_bid, r_uid, r_contents);
        if (1 == result) {
            System.out.println("===== Insert Success =====");

            return 1;
        } else {
            System.out.println("===== Insert Fail =====");

            return -1;
        }
    }
}
