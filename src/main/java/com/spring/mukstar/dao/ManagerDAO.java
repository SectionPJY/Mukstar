package com.spring.mukstar.dao;

import com.spring.mukstar.dto.ManagerDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;


@Service
public class ManagerDAO {

    @Autowired
    private SqlSession sqlSession;

    // Manager Login
    public ManagerDTO managerLogin(String m_id, String m_pw) {
        System.out.println("===== Manager Login DAO =====");
        System.out.println("ID : " + m_id + ", PW : " + m_pw);

        HashMap<String, String> map = new HashMap<>();
        map.put("m_id", m_id);
        map.put("m_pw", m_pw);

        return sqlSession.selectOne("ManagerMapper.managerLogin", map);
    }
}
