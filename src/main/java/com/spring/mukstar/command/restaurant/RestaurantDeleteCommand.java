package com.spring.mukstar.command.restaurant;

import com.spring.mukstar.dao.RestaurantDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class RestaurantDeleteCommand {

    @Autowired
    private RestaurantDAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== Restaurant Delete Command is Running =====");

        int r_id = Integer.parseInt(request.getParameter("r_id"));

        int result = dao.resDelete(r_id);
        if (1 == result) {
            System.out.println("===== Delete Success =====");

            return result;
        } else {
            System.out.println("===== Delete Fail =====");

            return -1;
        }
    }
}
