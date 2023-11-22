package com.spring.mukstar.command.restaurant;

import com.spring.mukstar.dao.RestaurantDAO;
import com.spring.mukstar.dto.RestaurantDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class RestaurantSelectCommand {

    @Autowired
    private RestaurantDAO dao;

    public List<RestaurantDTO> execute(HttpServletRequest request) {
        System.out.println("===== Restaurant Select Command is Running =====");

        int r_id = Integer.parseInt(request.getParameter("r_id"));

        List<RestaurantDTO> dto = dao.resSelect(r_id);
        if (dto.isEmpty() || null == dto) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");

            return dto;
        }
    }
}
