package com.spring.mukstar.command.reply;

import com.spring.mukstar.dao.ReplyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class ReplyUpdateCommand {

    @Autowired
    private ReplyDAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== Reply Update Command is Running =====");

        int r_id = Integer.parseInt(request.getParameter("r_id"));
        String r_bid = request.getParameter("r_bid");
        String r_uid = request.getParameter("r_uid");
        String r_contents = request.getParameter("r_contents");
        System.out.println(r_id + ", " + r_bid + ", " + r_uid + ", " + r_contents);

        int result = dao.updateReply(r_id, r_bid, r_uid, r_contents);
        if (1 == result) {
            System.out.println("===== Update Success =====");

            return result;
        } else {
            System.out.println("===== Update Fail =====");

            return -1;
        }
    }
}
