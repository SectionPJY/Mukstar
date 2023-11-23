package com.spring.mukstar.command.reply;

import com.spring.mukstar.dao.ReplyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class ReplyDeleteCommand {

    @Autowired
    private ReplyDAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== Reply Delete Command is Running =====");

        int r_id = Integer.parseInt(request.getParameter("r_id"));

        int result = dao.deleteReply(r_id);
        if (1 == result) {
            System.out.println("===== Delete Complete =====");

            return result;
        } else {
            System.out.println("===== Delete Fail =====");

            return -1;
        }
    }
}
