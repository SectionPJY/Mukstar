package com.spring.mukstar.command.restaurant;

import com.spring.mukstar.dao.RestaurantDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class RestaurantInsertCommand {

    @Autowired
    private RestaurantDAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== Restaurant Insert Command is Running =====");

        String r_name = request.getParameter("r_name");
        String r_address = request.getParameter("r_address");
        System.out.println(r_name + ", " + r_address);

        int result = dao.resInsert(r_name, r_address);
        if (1 == result) {
            System.out.println("===== Insert Success =====");

            return result;
        } else {
            System.out.println("===== Insert Fail : " + result + " =====");

            return -1;
        }
    }
}
