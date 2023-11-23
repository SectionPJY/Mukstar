package com.spring.mukstar.command.restaurant;

import com.spring.mukstar.dao.RestaurantDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class RestaurantUpdateCommand {

    @Autowired
    private RestaurantDAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== Restaurant Update Command is Running =====");

        int r_id = Integer.parseInt(request.getParameter("r_id"));
        String r_name = request.getParameter("r_name");
        String r_address = request.getParameter("r_address");
        int r_mark = Integer.parseInt(request.getParameter("r_mark"));
        System.out.println(r_id + ", " + r_name + ", " + r_address + ", " + r_mark);

        int result = dao.resUpdate(r_id, r_name, r_address, r_mark);
        if (1 == result) {
            System.out.println("===== Update Success =====");

            return result;
        } else {
            System.out.println("===== Update Fail =====");

            return -1;
        }
    }
}
