package com.spring.mukstar.command.subscribe;

import com.spring.mukstar.dao.SubscribeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class SubDeleteCommand {

    @Autowired
    private SubscribeDAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== Sub Delete Command is Running =====");

        String s_channel = request.getParameter("s_channel");
        String s_subscriber = request.getParameter("s_subscriber");

        int result = dao.subDelete(s_channel, s_subscriber);
        if (1 == result) {
            System.out.println("===== Delete Complete =====");

            return result;
        } else {
            System.out.println("===== Delete Fail =====");

            return -1;
        }
    }
}
