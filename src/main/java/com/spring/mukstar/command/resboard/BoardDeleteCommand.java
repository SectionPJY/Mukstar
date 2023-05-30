package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class BoardDeleteCommand {

    @Autowired
    private ResBoardDAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== Board Delete Command is Running =====");

        int r_id = Integer.parseInt(request.getParameter("r_id"));
        System.out.println("게시글 번호 : " + r_id);

        int result = dao.boardDelete(r_id);
        if (1 == result) {
            System.out.println("===== Delete Complete =====");
        } else {
            System.out.println("===== Delete Fail =====");
        }

        return result;
    }
}
