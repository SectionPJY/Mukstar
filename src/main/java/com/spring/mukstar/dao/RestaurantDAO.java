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

        if (searchWord.isEmpty()) {
            return null;
        } else {
            searchWord = "%" + searchWord + "%";
            System.out.println("Search Word : " + searchWord);
        }

        return sqlSession.selectList("RestaurantMapper.searchRestaurantAdmin", searchWord);
    }

    public List<RestaurantDTO> resSearchAddress(String searchWord) {
        System.out.println("===== Restaurant Search DAO =====");

        if (searchWord.isEmpty()) {
            return null;
        } else {
            searchWord = "%" + searchWord + "%";
            System.out.println("Search Word : " + searchWord);
        }

        return sqlSession.selectList("RestaurantMapper.searchRestaurantAddress", searchWord);
    }

    public List<RestaurantDTO> resList() {
        System.out.println("===== Restaurant List DAO =====");

        return sqlSession.selectList("RestaurantMapper.restaurantList");
    }

    public List<RestaurantDTO> resSelect(int r_id) {
        System.out.println("===== Restaurant Select DAO =====");
        System.out.println("가게 ID : " + r_id);

        return sqlSession.selectList("RestaurantMapper.selectRestaurantWithR_rating", r_id);
    }

    public int resUpdate(int r_id, String r_name, String r_address, int r_mark) {
        System.out.println("===== Restaurant Update DAO =====");
        System.out.println(r_id + ", " + r_name + ", " + r_address + ", " + r_mark);

        HashMap<String, Object> map = new HashMap<>();
        map.put("r_id", r_id);
        map.put("r_name", r_name);
        map.put("r_address", r_address);
        map.put("r_mark", r_mark);

        return sqlSession.update("RestaurantMapper.updateRestaurant", map);
    }

    public int resDelete(int r_id) {
        System.out.println("===== Restaurant Delete DAO =====");
        System.out.println("ID : " + r_id);

        return sqlSession.delete("RestaurantMapper.deleteRestaurant", r_id);
    }
}
