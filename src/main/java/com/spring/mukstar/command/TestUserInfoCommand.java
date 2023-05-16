package com.spring.mukstar.command;

import com.spring.mukstar.dao.UserDAO;
import com.spring.mukstar.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class TestUserInfoCommand {

    @Autowired
    private UserDAO dao;

    public List<UserDTO> execute(HttpServletRequest request) {
        System.out.println("===== Test User Information Command is Running =====");

        return null;
    }
}
