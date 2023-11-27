package com.spring.mukstar.command.reply;

import com.spring.mukstar.dao.ReplyDAO;
import com.spring.mukstar.dto.ReplyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class ReplySelectRidCommand {

    @Autowired
    private ReplyDAO dao;

    public List<ReplyDTO> execute(HttpServletRequest request) {
        System.out.println("===== Reply Select with r_id Command is Running =====");

        int r_id = Integer.parseInt(request.getParameter("r_id"));

        List<ReplyDTO> dto = dao.selectReplyRid(r_id);
        if (dto.isEmpty() || null == dto) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");

            return dto;
        }
    }
}
