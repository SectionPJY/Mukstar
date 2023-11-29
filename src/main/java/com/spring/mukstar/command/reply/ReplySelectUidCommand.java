package com.spring.mukstar.command.reply;

import com.spring.mukstar.dao.ReplyDAO;
import com.spring.mukstar.dto.ReplyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class ReplySelectUidCommand {

    @Autowired
    private ReplyDAO dao;

    public List<ReplyDTO> execute(HttpServletRequest request) {
        System.out.println("===== Reply Select Command is Running =====");
        String u_id = request.getParameter("u_id");

        List<ReplyDTO> dtos = dao.selectUserReply(u_id);
        if (dtos.isEmpty() || null == dtos) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");

            return dtos;
        }
    }
}
