package com.spring.mukstar.dao;

import com.spring.mukstar.dto.ResBoardDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Objects;

@Service
public class ResBoardDAO {

    @Autowired
    private SqlSession sqlSession;

    // Board List
    public List<ResBoardDTO> boardList() {
        System.out.println("===== Board List DAO =====");

        return sqlSession.selectList("ResBoardMapper.boardList");
    }

    // Board Select
    public List<ResBoardDTO> boardSelect(int r_id) {
        System.out.println("===== Board Select DAO =====");
        System.out.println("게시글번호 : " + r_id);

        return sqlSession.selectList("ResBoardMapper.boardSelect", r_id);
    }

    // Board Insert
    public int boardInsert(String r_uid, String r_sub, String r_name, String r_address, String r_contents) {
        System.out.println("===== Board Insert DAO =====");

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("r_uid", r_uid);
        map.put("r_sub", r_sub);
        map.put("r_name", r_name);
        map.put("r_address", r_address);
        map.put("r_contents", r_contents);

        return sqlSession.insert("ResBoardMapper.boardInsert", map);
    }
}
