package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import com.spring.mukstar.dto.ResBoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class BoardSelectCommand extends DateCast {

    @Autowired
    private ResBoardDAO dao;
    @Autowired
    private UpdateR_view update;

    public List<ResBoardDTO> execute(HttpServletRequest request) {
        System.out.println("===== Board Select Command is Running =====");

        int r_id = Integer.parseInt(request.getParameter("r_id"));
        // 데이터 들고 오기 전에 조회수 올리기
        update.execute(r_id);

        List<ResBoardDTO> dto = dao.boardSelect(r_id);
        if (null == dto) {
            System.out.println("===== DTO is Empty =====");

            return null;
        } else {
            System.out.println("===== DTO is Exists =====");
            Timestamp temp = Timestamp.valueOf(dto.get(0).getR_date());
            dto.get(0).setR_date(changeDate(temp));

            return dto;
        }
    }
}
