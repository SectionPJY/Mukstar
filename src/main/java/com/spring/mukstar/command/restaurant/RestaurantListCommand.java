package com.spring.mukstar.command.restaurant;

import com.spring.mukstar.dao.RestaurantDAO;
import com.spring.mukstar.dto.RestaurantDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RestaurantListCommand {

    @Autowired
    private RestaurantDAO dao;

    public List<RestaurantDTO> execute() {
        System.out.println("===== Restaurant List Command is Running =====");

        List<RestaurantDTO> dtos = dao.resList();
        if (dtos.isEmpty() || null == dtos) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");

            return dtos;
        }
    }
}
