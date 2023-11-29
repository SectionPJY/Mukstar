package com.spring.mukstar.command.reply;

import com.spring.mukstar.dao.ReplyDAO;
import com.spring.mukstar.dto.ReplyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class ReplySelectRidCommand {

    @Autowired
    private ReplyDAO dao;

    public ReplyDTO execute(HttpServletRequest request) {
        System.out.println("===== Reply Select with r_id Command is Running =====");

        int r_id = Integer.parseInt(request.getParameter("r_id"));

        ReplyDTO dto = dao.selectReplyRid(r_id);
        if (null == dto) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");

            return dto;
        }
    }
}
