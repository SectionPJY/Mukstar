package com.spring.mukstar.command;

import com.spring.mukstar.dao.UserDAO;
import com.spring.mukstar.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class TestUserSearchCommand {

    @Autowired
    private UserDAO dao;

    public List<UserDTO> execute(HttpServletRequest request, Model model) {
        System.out.println("===== Test User Search Command is Running =====");

        String searchWord = request.getParameter("searchWord");
        System.out.println("Search Word : " + searchWord);

        List<UserDTO> dtos = dao.userSearch(searchWord);
        if (dtos.isEmpty() || null == dtos) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");
            model.addAttribute("searchResult", dtos);

            return dtos;
        }
    }
}
