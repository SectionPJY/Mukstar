package com.spring.mukstar.command.reply;

import com.spring.mukstar.command.resboard.DateCast;
import com.spring.mukstar.dao.ReplyDAO;
import com.spring.mukstar.dto.ReplyDTO;
import com.spring.mukstar.dto.ResBoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.List;

@Service
public class ReplySearchCommand extends DateCast {

    @Autowired
    private ReplyDAO dao;

    public List<ReplyDTO> execute(HttpServletRequest request) {
        System.out.println("===== Reply Search Command is Running =====");

        String searchWord = request.getParameter("searchWord");
        System.out.println("Search Word : " + searchWord);

        List<ReplyDTO> dtos = dao.searchReplyAdmin(searchWord);
        if (dtos.isEmpty() || dtos == null) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exits =====");

            System.out.println("rb_date Change");
            for (ReplyDTO res : dtos) {
                Timestamp tmp = Timestamp.valueOf(res.getR_date());
                res.setR_date(changeDate(tmp));
            }

            return dtos;
        }
    }
}
