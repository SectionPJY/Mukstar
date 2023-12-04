package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import com.spring.mukstar.dto.ResBoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.List;

@Service
public class BoardSearchCommand extends DateCast {

    @Autowired
    private ResBoardDAO dao;

    public List<ResBoardDTO> execute(HttpServletRequest request) {
        System.out.println("===== Board Search Command is Running =====");

        String searchWord = request.getParameter("searchWord");
        System.out.println("Search Word : " + searchWord);

        List<ResBoardDTO> dtos = dao.searchBoardAdmin(searchWord);
        if (dtos.isEmpty() || dtos == null) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exits =====");

            System.out.println("rb_date Change");
            for (ResBoardDTO res : dtos) {
                Timestamp tmp = Timestamp.valueOf(res.getRb_date());
                res.setRb_date(changeDate(tmp));
            }

            return dtos;
        }
    }

    public List<ResBoardDTO> executeSub(HttpServletRequest request) {
        System.out.println("===== Board Search Sub Command is Running =====");

        String searchWord = request.getParameter("searchWord");
        System.out.println("Search Word : " + searchWord);

        List<ResBoardDTO> dtos = dao.searchBoardSub(searchWord);
        if (dtos.isEmpty() || dtos == null) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exits =====");

            System.out.println("rb_date Change");
            for (ResBoardDTO res : dtos) {
                Timestamp tmp = Timestamp.valueOf(res.getRb_date());
                res.setRb_date(changeDate(tmp));
            }

            return dtos;
        }
    }

    public List<ResBoardDTO> executeContents(HttpServletRequest request) {
        System.out.println("===== Board Search Contents Command is Running =====");

        String searchWord = request.getParameter("searchWord");
        System.out.println("Search Word : " + searchWord);

        List<ResBoardDTO> dtos = dao.searchBoardContents(searchWord);
        if (dtos.isEmpty() || dtos == null) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exits =====");

            System.out.println("rb_date Change");
            for (ResBoardDTO res : dtos) {
                Timestamp tmp = Timestamp.valueOf(res.getRb_date());
                res.setRb_date(changeDate(tmp));
            }

            return dtos;
        }
    }
}
