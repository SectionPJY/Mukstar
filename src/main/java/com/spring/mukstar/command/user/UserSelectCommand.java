package com.spring.mukstar.command.user;

import com.spring.mukstar.dao.UserDAO;
import com.spring.mukstar.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserSelectCommand {

    @Autowired
    private UserDAO dao;

    public List<UserDTO> execute(HttpServletRequest request) {
        System.out.println("===== User Select Command is Running =====");

        String u_id = request.getParameter("u_id");
        List<UserDTO> dto = new ArrayList<UserDTO>();
        dto.add(dao.userSelect(u_id));

        if (dto.isEmpty() || null == dto) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exits =====");

            return dto;
        }
    }
}
