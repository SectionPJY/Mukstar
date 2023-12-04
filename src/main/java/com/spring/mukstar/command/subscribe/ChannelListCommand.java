package com.spring.mukstar.command.subscribe;

import com.spring.mukstar.command.resboard.DateCast;
import com.spring.mukstar.dao.SubscribeDAO;
import com.spring.mukstar.dto.SubscribeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.List;

@Service
public class ChannelListCommand extends DateCast {

    @Autowired
    private SubscribeDAO dao;

    public List<SubscribeDTO> execute(String s_subscriber) {
        System.out.println("===== Channel List Command is Running =====");
        System.out.println("subscriber : " + s_subscriber);

        List<SubscribeDTO> dtos = dao.channelList(s_subscriber);
        if (null == dtos || dtos.isEmpty()) {
            System.out.println("===== List is Empty =====");

        } else {
            System.out.println("===== List is Exists =====");
            for (SubscribeDTO sub : dtos) {
                System.out.println("===== s_date 수정 =====");
                Timestamp tmp = Timestamp.valueOf(sub.getS_date());
                sub.setS_date(changeDate(tmp));
            }

        }
        return dtos;
    }

    public List<SubscribeDTO> execute(HttpServletRequest request) {
        System.out.println("===== Channel List Command is Running =====");
        String s_subscriber = request.getParameter("u_id");

        List<SubscribeDTO> dtos = dao.channelList(s_subscriber);
        if (null == dtos || dtos.isEmpty()) {
            System.out.println("===== List is Empty =====");

            return null;
        } else {
            System.out.println("===== List is Exists =====");
            for (SubscribeDTO sub : dtos) {
                System.out.println("===== s_date 수정 =====");
                Timestamp tmp = Timestamp.valueOf(sub.getS_date());
                sub.setS_date(changeDate(tmp));
            }

            return dtos;
        }
    }
}
