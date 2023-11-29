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
        String data = request.getParameter("rb_id");
        if (data.isEmpty()){
            return 0;
        }else {
            int rb_id = Integer.parseInt(data);
            System.out.println("게시글 번호 : " + rb_id);
            int result = dao.boardDelete(rb_id);
            if (1 == result) {
                System.out.println("===== Delete Complete =====");
            } else {
                System.out.println("===== Delete Fail =====");
            }

            return result;
        }
    }
}
