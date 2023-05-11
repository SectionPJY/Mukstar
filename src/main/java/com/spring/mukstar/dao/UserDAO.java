package com.spring.mukstar.dao;

import com.spring.mukstar.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Mapper
@Service
public class UserDAO {

    @Autowired
    private SqlSession sqlSession;

    // User List
    public List<UserDTO> userList() {
        System.out.println("========== User List DAO ==========");
        System.out.println(sqlSession.getConfiguration());
        System.out.println(sqlSession.getConnection());

        System.out.println(sqlSession.selectList("UserMapper.userList"));

        return sqlSession.selectList("UserMapper.userList");
    }
}
