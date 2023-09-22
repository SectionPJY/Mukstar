package com.spring.mukstar.command.subscribe;

import com.spring.mukstar.dao.SubscribeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class SubInsertCommand {

    @Autowired
    private SubscribeDAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== Sub Insert Command is Running =====");

        String s_channel = request.getParameter("s_channel");
        String s_subscriber = request.getParameter("s_subscriber");

        int result = dao.subInsert(s_channel, s_subscriber);
        if (1 == result) {
            System.out.println("===== Insert Success =====");
        } else {
            System.out.println("===== Insert Fail =====");
        }

        return result;
    }
}
