package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import com.spring.mukstar.dto.ResBoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Service
public class BoardListCommand extends DateCast {

    @Autowired
    private ResBoardDAO dao;

    public List<ResBoardDTO> execute(HttpServletRequest request) {
        System.out.println("===== Board List Command is Running =====");
        String sort;
        System.out.println(request.getParameter("sort"));
        if (request.getParameter("sort") == null){ sort = "r_view"; }
        else { sort = request.getParameter("sort"); }

        List<ResBoardDTO> dtos = dao.boardList(sort);
        if (null == dtos || dtos.isEmpty()) {
            System.out.println("===== List is Empty =====");

            return null;
        } else {
            System.out.println("===== List is Exists =====");
            for (ResBoardDTO res : dtos) {
                System.out.println("===== 게시글 번호 : " + res.getR_id() + " r_date 수정 =====");
                Timestamp temp = Timestamp.valueOf(res.getR_date());
                res.setR_date(changeDate(temp));
            }

            return dtos;
        }
    }
}
