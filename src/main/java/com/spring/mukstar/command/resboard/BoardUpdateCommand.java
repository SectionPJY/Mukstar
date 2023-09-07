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

        int r_id = Integer.parseInt(request.getParameter("r_id"));
        String r_uid = request.getParameter("r_uid");
        String r_sub = request.getParameter("r_sub");
        String r_name = request.getParameter("r_name");
        String r_address = request.getParameter("r_address");
        String r_contents = request.getParameter("r_contents");
        int r_rating = Integer.parseInt(request.getParameter("r_rating"));

        int result = dao.boardUpdate(r_id, r_sub, r_name, r_address, r_contents, r_rating);
        if (1 == result) {
            System.out.println("===== Update Success =====");
        } else {
            System.out.println("===== Update Fail =====");
        }

        return result;
    }
}
