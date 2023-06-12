package com.spring.mukstar.dao;

import com.spring.mukstar.dto.QnADTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnADAO {

    @Autowired
    private SqlSession sqlSession;

    // QnA List
    public List<QnADTO> qnaList() {
        System.out.println("===== QnA List DAO =====");

        return sqlSession.selectList("QnAMapper.qnaList");
    }
}
