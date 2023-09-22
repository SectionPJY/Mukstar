package com.spring.mukstar.command.subscribe;

import com.spring.mukstar.dao.SubscribeDAO;
import com.spring.mukstar.dto.SubscribeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class ChannelListCommand {

    @Autowired
    private SubscribeDAO dao;

    public List<SubscribeDTO> execute(String s_subscriber) {
        System.out.println("===== Channel List Command is Running =====");
        System.out.println("User : " + s_subscriber);

        List<SubscribeDTO> dtos = dao.channelList(s_subscriber);
        if (null == dtos || dtos.isEmpty()) {
            System.out.println("===== List is Empty =====");

            return null;
        } else {
            System.out.println("===== List is Exists =====");

            return dtos;
        }
    }
}
