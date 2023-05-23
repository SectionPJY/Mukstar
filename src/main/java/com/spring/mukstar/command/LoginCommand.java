package com.spring.mukstar.command;

import com.spring.mukstar.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
            session.setAttribute("u_id", u_id);
            session.setAttribute("u_pw", u_pw);
        } else {
            System.out.println("===== ID is Not Exists =====");
        }

        return result;
    }
}
