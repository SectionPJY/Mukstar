package com.spring.mukstar.dao;

import com.spring.mukstar.dto.SearchDTO;
import com.spring.mukstar.dto.UserDTO;
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
    public UserDTO userSelect(String u_id) {
        System.out.println("===== User Information DAO =====");

        return sqlSession.selectOne("UserMapper.userInfo", u_id);
    }

    // User Update
    public int userUpdate(String u_id, String u_pw, String u_nickname, String u_phone, String u_info) {
        System.out.println("===== User Update DAO =====");

        HashMap<String, String> map = new HashMap<String, String>();
        map.put("u_id", u_id);
        map.put("u_pw", u_pw);
        map.put("u_nickname", u_nickname);
        map.put("u_phone", u_phone);
        map.put("u_info", u_info);

        return sqlSession.update("UserMapper.userUpdate", map);
    }

    // User Search
    public List<SearchDTO> userSearch(String searchWord) {
        System.out.println("===== User Search DAO =====");

        if (searchWord.isEmpty()){
            return null;
        }else {
            searchWord = "%" + searchWord + "%";
            System.out.println("Search Word : " + searchWord);
        }

        return sqlSession.selectList("UserMapper.userSearch", searchWord);
    }

    public List<UserDTO> userSearchAdmin(String searchWord) {
        System.out.println("===== User Search in Admin =====");

        if (searchWord.isEmpty()){
            return null;
        }else {
            searchWord = "%" + searchWord + "%";
            System.out.println("Search Word : " + searchWord);
        }

        return sqlSession.selectList("UserMapper.userSearchAdmin", searchWord);
    }

    public UserDTO userPwSearch(String u_id, String u_phone) {
        System.out.println("===== User PW Search DAO =====");
        System.out.println("User ID : " + u_id + ", Phone : " + u_phone);

        HashMap<String, String> map = new HashMap<>();
        map.put("u_id", u_id);
        map.put("u_phone", u_phone);

        return sqlSession.selectOne("UserMapper.userPwSearch", map);
    }
}
