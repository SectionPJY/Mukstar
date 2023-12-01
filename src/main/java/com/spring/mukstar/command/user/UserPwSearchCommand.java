package com.spring.mukstar.command.user;

import com.spring.mukstar.dao.UserDAO;
import com.spring.mukstar.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class UserPwSearchCommand {

    @Autowired
    private UserDAO dao;

    public String execute(HttpServletRequest request) {
        System.out.println("===== User PW Search Command is Running =====");

        String u_id = request.getParameter("u_id");
        String u_phone = request.getParameter("u_phone");

        UserDTO dto = dao.userPwSearch(u_id, u_phone);
        if (null == dto) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");
            System.out.println(dto.getU_pw());

            return dto.getU_pw();
        }
    }
}
