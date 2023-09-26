package com.spring.mukstar.dao;

import com.spring.mukstar.dto.SubscribeDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class SubscribeDAO {

    @Autowired
    private SqlSession sqlSession;

    // Subscribe Insert
    public int subInsert(String s_channel, String s_subscriber) {
        System.out.println("===== Sub Insert DAO =====");

        HashMap<String, String> map = new HashMap<>();
        map.put("s_channel", s_channel);
        map.put("s_subscriber", s_subscriber);

        return sqlSession.insert("SubMapper.subInsert", map);
    }

    // Subscribe Delete
    public int subDelete(String s_channel, String s_subscriber) {
        System.out.println("===== Sub Delete DAO =====");

        HashMap<String, String> map = new HashMap<>();
        map.put("s_channel", s_channel);
        map.put("s_subscriber", s_subscriber);

        return sqlSession.delete("SubMapper.subDelete", map);
    }

    // Channel List
    public List<SubscribeDTO> channelList(String s_subscriber) {
        System.out.println("===== Channel List DAO =====");

        HashMap<String, String> map = new HashMap<>();
        map.put("s_subscriber", s_subscriber);

        return sqlSession.selectList("SubMapper.channelList", map);
    }
}
