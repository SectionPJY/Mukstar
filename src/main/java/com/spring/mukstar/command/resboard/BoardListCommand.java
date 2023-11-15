package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import com.spring.mukstar.dto.ResBoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.List;

@Service
public class BoardListCommand extends DateCast {

    @Autowired
    private ResBoardDAO dao;

    public List<ResBoardDTO> executeUser(HttpServletRequest request) {
        System.out.println("===== Board List Command is Running =====");
        String sort;
        System.out.println(request.getParameter("sort"));
        if (request.getParameter("sort") == null){ sort = "rb_view"; }
        else { sort = request.getParameter("sort"); }

        List<ResBoardDTO> dtos = dao.boardList(sort);
        if (null == dtos || dtos.isEmpty()) {
            System.out.println("===== List is Empty =====");

            return null;
        } else {
            System.out.println("===== List is Exists =====");
            for (ResBoardDTO res : dtos) {
                System.out.println("===== 게시글 번호 : " + res.getRb_id() + " rb_date 수정 =====");
                Timestamp tmp = Timestamp.valueOf(res.getRb_date());
                res.setRb_date(changeDate(tmp));
            }

            return dtos;
        }
    }

    public List<ResBoardDTO> executeAdmin(HttpServletRequest request) {
        System.out.println("===== Board List Command is Running =====");

        String u_id = request.getParameter("u_id");
        System.out.println("User ID : " + u_id);

        List<ResBoardDTO> dtos = dao.selectBoardAdmin(u_id);
        if (dtos.isEmpty() || null == dtos) {
            System.out.println("===== List is Empty =====");

            return null;
        } else {
            System.out.println("===== List is Exists =====");
            for(ResBoardDTO res : dtos) {
                System.out.println("===== 게시글 번호 : " +  res.getRb_date() + " rb_date 수정 =====");
                Timestamp tmp = Timestamp.valueOf(res.getRb_date());
                res.setRb_date(changeDate(tmp));
            }

            return dtos;
        }
    }
}
