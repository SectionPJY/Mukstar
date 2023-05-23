package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import com.spring.mukstar.dto.ResBoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class BoardListCommand {

    @Autowired
    private ResBoardDAO dao;

    public List<ResBoardDTO> execute(HttpServletRequest request) {
        System.out.println("===== Board List Command is Running =====");

        List<ResBoardDTO> dtos = dao.boardList();
        if (null == dtos || dtos.isEmpty()) {
            System.out.println("===== List is Empty =====");

            return null;
        } else {
            System.out.println("===== List is Exists =====");

            return dtos;
        }
    }

    private Date dateFormat(Date r_date) {
        System.out.println("===== Date Format Parse =====");
        System.out.println("Before : " + r_date);

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        return null;
    }
}
