package com.spring.mukstar.command;

import com.spring.mukstar.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class FindUserIDCommand {

    @Autowired
    private UserDAO dao;

    public String execute(HttpServletRequest request) {
        System.out.println("===== Find User ID Command is Running =====");

        String u_nickname = request.getParameter("u_nickname");
        String u_phone = phoneFormat(request.getParameter("u_phone"));
        System.out.println("닉네임 : " + u_nickname + ", 핸드폰 : " + u_phone);

        String u_id = dao.findID(u_nickname, u_phone);
        if (null == u_id || "" == u_id) {
            System.out.println("===== ID is Not Found =====");

            return null;
        } else {
            System.out.println("===== ID is Found =====");
            System.out.println("ID : " + u_id);

            return u_id;
        }
    }

    public String phoneFormat(String number) {
        String regEx = "(\\d{3})(\\d{3,4})(\\d{4})";

        return number.replaceAll(regEx, "$1-$2-$3");
    }
}
