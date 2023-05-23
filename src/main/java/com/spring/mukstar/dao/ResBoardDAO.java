package com.spring.mukstar.dao;

import com.spring.mukstar.dto.ResBoardDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
}
