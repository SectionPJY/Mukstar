package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import com.spring.mukstar.dto.ResBoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class BoardSelectCommand {

    @Autowired
    private ResBoardDAO dao;

    public List<ResBoardDTO> execute(HttpServletRequest request) {
        System.out.println("===== Board Select Command is Running =====");

        int r_id = Integer.parseInt(request.getParameter("r_id"));
        List<ResBoardDTO> dto = dao.boardSelect(r_id);
        if (null == dto) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");

            return dto;
        }
    }
}
