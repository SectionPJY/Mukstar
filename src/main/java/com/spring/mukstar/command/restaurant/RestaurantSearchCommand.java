package com.spring.mukstar.command.restaurant;

import com.spring.mukstar.dao.RestaurantDAO;
import com.spring.mukstar.dto.RestaurantDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class RestaurantSearchCommand {

    @Autowired
    private RestaurantDAO dao;

    public List<RestaurantDTO> execute(HttpServletRequest request) {
        System.out.println("===== Restaurant Search Command is Running =====");

        String searchWord = request.getParameter("searchWord");
        System.out.println("Search Word : " + searchWord);

        List<RestaurantDTO> dtos = dao.resSearch(searchWord);
        if (dtos.isEmpty() || dtos == null) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");

            return dtos;
        }
    }

    public List<RestaurantDTO> executeAddress(HttpServletRequest request) {
        System.out.println("===== Restaurant Search Command is Running =====");

        String searchWord = request.getParameter("searchWord");
        System.out.println("Search Word : " + searchWord);

        List<RestaurantDTO> dtos = dao.resSearch(searchWord);
        if (dtos.isEmpty() || dtos == null) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");

            return dtos;
        }
    }
}
