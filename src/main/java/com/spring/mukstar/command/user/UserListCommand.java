package com.spring.mukstar.command.user;

import com.spring.mukstar.dao.UserDAO;
import com.spring.mukstar.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class UserListCommand {

    @Autowired
    private UserDAO dao;

    public List<UserDTO> execute(Model model) {
        System.out.println("===== User List Command is Running =====");

        List<UserDTO> uList = dao.userList();

        if (uList.isEmpty()) {
            System.out.println("===== List is Empty =====");
        }
        System.out.println("===== List is Not Empty =====");

        return uList;
    }
}
