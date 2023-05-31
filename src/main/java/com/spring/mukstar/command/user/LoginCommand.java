package com.spring.mukstar.command.user;

import com.spring.mukstar.dao.UserDAO;
import com.spring.mukstar.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class LoginCommand {

    @Autowired
    private UserDAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== Test Login Command is Running =====");

        String u_id = request.getParameter("u_id");
        String u_pw = request.getParameter("u_pw");
        System.out.println("===== ID : " + u_id + ", PW : " + u_pw + " =====");

        int result = dao.userLogin(u_id, u_pw);
        if (1 == result) {
            System.out.println("===== ID is Exists =====");

            System.out.println("===== Session Create =====");
            HttpSession session = request.getSession();
            UserDTO dto = dao.userInfo(u_id);
                session.setAttribute("u_id", dto.getU_id());
                session.setAttribute("u_pw", dto.getU_pw());
                session.setAttribute("u_nickname", dto.getU_nickname());
                session.setAttribute("u_phone", dto.getU_phone());
                session.setAttribute("u_img", dto.getU_img());
                session.setAttribute("u_drop", dto.getU_drop());
        } else {
            System.out.println("===== ID is Not Exists =====");
        }

        return result;
    }
}
