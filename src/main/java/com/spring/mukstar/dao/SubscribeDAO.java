package com.spring.mukstar.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class SubscribeDAO {

    @Autowired
    private SqlSession sqlSession;

    // Subscribe Insert
    public int subInsert(String s_channel, String s_subscriber) {
        System.out.println("===== Sub Insert DAO =====");

        HashMap<String, Object> map = new HashMap<>();
        map.put("s_channel", s_channel);
        map.put("s_subscriber", s_subscriber);

        return sqlSession.insert("SubMapper.subInsert", map);
    }
}
