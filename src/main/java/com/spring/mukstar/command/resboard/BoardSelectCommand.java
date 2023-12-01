package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import com.spring.mukstar.dto.ResBoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class BoardSelectCommand extends DateCast {

    @Autowired
    private ResBoardDAO dao;
    @Autowired
    private Updaterb_view update;

    public List<ResBoardDTO> execute(HttpServletRequest request) {
        System.out.println("===== Board Select Command is Running =====");

        int rb_id = Integer.parseInt(request.getParameter("rb_id"));

        // 데이터 들고 오기 전에 조회수 올리기
        update.execute(rb_id);

        List<ResBoardDTO> dto = dao.boardSelect(rb_id);
        if (null == dto) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");
            Timestamp temp = Timestamp.valueOf(dto.get(0).getRb_date());
            dto.get(0).setRb_date(changeDate(temp));

            return dto;
        }
    }

    public List<ResBoardDTO> executeAdmin(HttpServletRequest request) {
        System.out.println("===== Board Select Command is Running =====");

        int rb_id = Integer.parseInt(request.getParameter("rb_id"));

        List<ResBoardDTO> dto = dao.selectBoardPostDetail(rb_id);
        if (dto.isEmpty()) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");
            Timestamp temp = Timestamp.valueOf(dto.get(0).getRb_date());
            dto.get(0).setRb_date(changeDate(temp));

            return dto;
        }
    }

    public List<ResBoardDTO> uidToContents(HttpServletRequest request) {
        System.out.println("===== Board Select To Uid Command is Running =====");
        HttpSession session = request.getSession();
        String u_id = session.getAttribute("u_id").toString();
        List<ResBoardDTO> dto = dao.boardSelectToUid(u_id);
        if (null == dto) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else if(dto.isEmpty()){

            return  dto;
        }
        else{
            System.out.println("===== DTO is Exists =====");
            Timestamp temp = Timestamp.valueOf(dto.get(0).getRb_date());
            dto.get(0).setRb_date(changeDate(temp));

            return dto;
        }
    }

    public List<ResBoardDTO> uidToUserContents(HttpServletRequest request) {
        System.out.println("===== Board Select To Uid Command is Running =====");
        String u_id = request.getParameter("uid");
        List<ResBoardDTO> dto = dao.boardSelectToUid(u_id);
        if (null == dto || dto.isEmpty()) {
            System.out.println("===== DTO is Empty =====");

            return dto;
        } else {
            System.out.println("===== DTO is Exists =====");
            Timestamp temp = Timestamp.valueOf(dto.get(0).getRb_date());
            dto.get(0).setRb_date(changeDate(temp));

            return dto;
        }
    }

    public List<ResBoardDTO> rnameToContents(HttpServletRequest request) {
        String rb_sub = request.getParameter("searchBox");
        List<ResBoardDTO> dto = dao.boardSelectToContents(rb_sub);
        if (null == dto) {
            System.out.println("===== DTO is Empty =====");
            return null;
        } else {
            System.out.println("===== DTO is Exists =====");
            return dto;
        }
    }

    public List<ResBoardDTO> executeR_id(HttpServletRequest request) {
        System.out.println("===== Board Select Command is Running from r_id =====");

        int r_id = Integer.parseInt(request.getParameter("r_id"));

        List<ResBoardDTO> dto = dao.selectBoardFromR_id(r_id);
        if (dto.isEmpty()) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");

            return dto;
        }
    }
}
