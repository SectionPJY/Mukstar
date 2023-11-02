package com.spring.mukstar.dao;

import com.spring.mukstar.dto.RestaurantDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class RestaurantDAO {

    @Autowired
    private SqlSession sqlSession;

    public int resInsert(String r_name, String r_address) {
        System.out.println("===== Restaurant Insert DAO =====");

        HashMap<String, String> map = new HashMap<>();
        map.put("r_name", r_name);
        map.put("r_address", r_address);

        return sqlSession.insert("RestaurantMapper.resInsert", map);
    }

    public List<RestaurantDTO> resSearch(String searchWord) {
        System.out.println("===== Restaurant Search DAO =====");

        if (searchWord.isEmpty() || searchWord == null) {
            return null;
        } else {
            searchWord = "%" + searchWord + "%";
            System.out.println("Search Word : " + searchWord);
        }

        return sqlSession.selectList("RestaurantMapper.searchRestaurantAdmin", searchWord);
    }
}
