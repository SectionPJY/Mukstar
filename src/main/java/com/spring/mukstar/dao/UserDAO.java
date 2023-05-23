package com.spring.mukstar.dao;

import com.spring.mukstar.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class UserDAO {

    @Autowired
    private SqlSession sqlSession;

    // User List
    public List<UserDTO> userList() {
        System.out.println("===== User List DAO =====");

        return sqlSession.selectList("UserMapper.userList");
    }

    // User Login
    public int userLogin(String u_id, String u_pw) {
        System.out.println("===== User Login DAO =====");
        System.out.println("===== ID : " + u_id + ", PW : " + u_pw + " =====");

        HashMap<String, String> map = new HashMap<String, String>();
        map.put("u_id", u_id);
        map.put("u_pw", u_pw);

        return sqlSession.selectOne("UserMapper.userLogin", map);
    }

    // User SignUp
    public int userSignup(String u_id, String u_pw, String u_nickname, String u_phone) {
        System.out.println("===== User SignUp DAO =====");

        HashMap<String, String> map = new HashMap<String, String>();
        map.put("u_id", u_id);
        map.put("u_pw", u_pw);
        map.put("u_nickname", u_nickname);
        map.put("u_phone", u_phone);

        return sqlSession.insert("UserMapper.userSignup", map);
    }

    // User Information
    public List<UserDTO> userInfo(String u_id) {
        System.out.println("===== User Information DAO =====");

        return sqlSession.selectList("UserMapper.userInfo", u_id);
    }

    // User Update
    public int userUpdate(String u_id, String u_pw, String u_nickname, String u_phone) {
        System.out.println("===== User Update DAO =====");

        HashMap<String, String> map = new HashMap<String, String>();
        map.put("u_id", u_id);
        map.put("u_pw", u_pw);
        map.put("u_nickname", u_nickname);
        map.put("u_phone", u_phone);

        return sqlSession.update("UserMapper.userUpdate", map);
    }

    // User Search
    public List<UserDTO> userSearch(String searchWord) {
        System.out.println("===== User Search DAO =====");

        searchWord = "%" + searchWord + "%";
        System.out.println("Search Word : " + searchWord);

        return sqlSession.selectList("UserMapper.userSearch", searchWord);
    }

    // Find User ID
//    public String findID(String u_nickname, String u_phone) {
//        System.out.println("===== Find User ID DAO =====");
//        System.out.println("닉네임 : " + u_nickname + ", 핸드폰 : " + u_phone);
//
//        return "";
//    }
}
