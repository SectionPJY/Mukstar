package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class BoardInsertCommand {

    @Autowired
    private ResBoardDAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== Board Insert Command is Running =====");

        String rb_uid = request.getSession().getAttribute("u_id").toString();
        String rb_sub = request.getParameter("rb_sub");
        String r_name = request.getParameter("r_name");
        String r_address = request.getParameter("r_address");
        String rb_contents = request.getParameter("rb_contents");
        int rb_rating = Integer.parseInt(request.getParameter("rb_rating"));

        System.out.println(rb_uid + ", " + rb_sub + ", " + rb_contents + ", " + rb_rating + ", " + r_name + ", " + r_address);

        int result = dao.boardInsert(rb_uid, rb_sub, r_name, r_address, rb_contents, rb_rating);
        if (1 == result) {
            System.out.println("===== Insert Success =====");
        } else {
            System.out.println("===== Insert Fail =====");
        }

        return result;
    }
}
