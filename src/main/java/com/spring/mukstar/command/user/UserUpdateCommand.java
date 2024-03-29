package com.spring.mukstar.command.user;

import com.spring.mukstar.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class UserUpdateCommand {

    @Autowired
    private HttpSession session;

    @Autowired
    private UserDAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== User Update Command is Running =====");

        String u_id;
        if (null == session.getAttribute("u_id")) {
            u_id = request.getParameter("u_id");
        } else {
            u_id = session.getAttribute("u_id").toString();
        }

        String u_pw = request.getParameter("u_pw");
        String u_nickname = request.getParameter("u_nickname");
        String u_phone = phoneFormat(request.getParameter("u_phone"));
        String u_info = request.getParameter("u_info");

        System.out.println("==========");
        System.out.println("ID : " + u_id + ", PW : " + u_pw + ", NickName : " + u_nickname + ", P.H : " + u_phone);
        System.out.println("==========");

        int result = dao.userUpdate(u_id, u_pw, u_nickname, u_phone, u_info);
        if (1 == result) {
            System.out.println("===== Update Success =====");
        } else {
            System.out.println("===== Update Fail =====");
        }

        return result;
    }

    public String phoneFormat(String number) {
        String regEx = "(\\d{3})(\\d{3,4})(\\d{4})";

        return number.replaceAll(regEx, "$1-$2-$3");
    }
}
