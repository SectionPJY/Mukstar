package com.spring.mukstar.command.user;

import com.spring.mukstar.dao.UserDAO;
import com.spring.mukstar.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

@Service
public class UserSelectCommand {

    @Autowired
    private HttpSession session;

    @Autowired
    private UserDAO dao;

    public UserDTO execute(Model model) {
        System.out.println("===== Test User Information Command is Running =====");

        String u_id = session.getAttribute("u_id").toString();
        System.out.println("ID : " + u_id);

        UserDTO dto = dao.userInfo(u_id);
        if (dto.getU_id() == null) {
            System.out.println("===== User Information Loading Fail =====");
            System.out.println(dto);
        } else {
            System.out.println("===== User Information Loading Success =====");
            model.addAttribute("userInfo", dto);
        }

        return dto;
    }
}
