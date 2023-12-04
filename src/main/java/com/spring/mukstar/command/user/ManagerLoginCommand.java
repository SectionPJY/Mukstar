package com.spring.mukstar.command.user;

import com.spring.mukstar.dao.ManagerDAO;
import com.spring.mukstar.dto.ManagerDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class ManagerLoginCommand {

    @Autowired
    private ManagerDAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== Manager Login Command is Running =====");

        String m_id = request.getParameter("m_id");
        String m_pw = request.getParameter("m_pw");
        System.out.println("ID : " + m_id + ", PW : " + m_pw);

        ManagerDTO dto = dao.managerLogin(m_id, m_pw);
        if (null != dto) {
            System.out.println("===== ID is Exists =====");

            HttpSession session = request.getSession();
            session.setAttribute("m_id", dto.getM_id());
            session.setAttribute("m_pw", dto.getM_pw());
            System.out.println("===== Session Create Success =====");

            return 1;
        } else {
            System.out.println("===== ID is not Found =====");

            return -1;
        }
    }
}
