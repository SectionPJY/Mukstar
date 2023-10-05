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
        String rb_uid = request.getParameter("rb_uid");
        String rb_sub = request.getParameter("rb_sub");
        String rb_name = request.getParameter("r_name");
        String rb_address = request.getParameter("r_address");
        String rb_contents = request.getParameter("rb_contents");
        int rb_rating = Integer.parseInt(request.getParameter("rb_rating"));

        int result = dao.boardUpdate(rb_id, rb_sub, rb_name, rb_address, rb_contents, rb_rating);
        if (1 == result) {
            System.out.println("===== Update Success =====");
        } else {
            System.out.println("===== Update Fail =====");
        }

        return result;
    }
}
