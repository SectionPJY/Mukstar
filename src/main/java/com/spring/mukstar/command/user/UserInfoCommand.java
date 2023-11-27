package com.spring.mukstar.command.user;

import com.spring.mukstar.dao.UserDAO;
import com.spring.mukstar.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class UserInfoCommand {

    @Autowired
    private HttpSession session;

    @Autowired
    private UserDAO dao;

    public UserDTO execute(HttpServletRequest request) {
        System.out.println("===== Test User Information Command is Running =====");

        String id = request.getParameter("id");
        System.out.println("id : " + id);

        UserDTO dto = dao.userSelect(id);
        if (dto.getU_id() == null) {
            System.out.println("===== User Information Loading Fail =====");
            System.out.println(dto);
        } else {
            System.out.println("===== User Information Loading Success =====");
        }

        return dto;
    }
}
