package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class BoardUpdateCommand {

    @Autowired
    private ResBoardDAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== Board Update Command is Running =====");

        int rb_id = Integer.parseInt(request.getParameter("rb_id"));
        int rb_rid = Integer.parseInt(request.getParameter("rb_rid"));
        String rb_sub = request.getParameter("rb_sub");
        int rb_rating = Integer.parseInt(request.getParameter("rb_rating"));
        String rb_contents = request.getParameter("rb_contents");
        System.out.println(rb_id + ", " + rb_rid + ", " + rb_sub + ", " + rb_rating + ", " + rb_contents);

        int result = dao.updateBoard(rb_id, rb_rid, rb_sub, rb_rating, rb_contents);
        if (1 == result) {
            System.out.println("===== Update Success =====");

            return result;
        } else {
            System.out.println("===== Update Fail =====");

            return -1;
        }
    }
}
