package com.spring.mukstar.command;

import com.spring.mukstar.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestLoginCommand {

    @Autowired
    private UserDAO dao;

    public int execute(String u_id, String u_pw) {
        System.out.println("===== Test Login Command is Running =====");
        System.out.println("===== ID : " + u_id + ", PW : " + u_pw + " =====");

        int result = dao.userLogin(u_id, u_pw);
        if (1 == result) {
            System.out.println("===== ID is Exists =====");
        } else {
            System.out.println("===== ID is Not Exists =====");
        }

        return result;
    }
}
