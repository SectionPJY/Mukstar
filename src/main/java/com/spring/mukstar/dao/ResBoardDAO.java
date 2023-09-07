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
    public List<ResBoardDTO> boardList(String sort) {
        System.out.println("===== Board List DAO =====");
        System.out.println("Sort : " + sort);

        if (sort == null) {

        } else {
            System.out.println("Sort : " + sort.getClass().getName());
        }

        return sqlSession.selectList("ResBoardMapper.boardList", sort);
    }

    // Board Select
    public List<ResBoardDTO> boardSelect(int r_id) {
        System.out.println("===== Board Select DAO =====");
        System.out.println("게시글번호 : " + r_id);

        return sqlSession.selectList("ResBoardMapper.boardSelect", r_id);
    }

    public List<ResBoardDTO> boardSelectToUid(String u_id) {
        System.out.println("===== Board Select To Uid DAO =====");
        System.out.println("user : " + u_id);

        return sqlSession.selectList("ResBoardMapper.boardSelectToUid", u_id);
    }

    public List<ResBoardDTO> boardSelectToRname(String r_name) {
        System.out.println("===== Board Select To Uid DAO =====");
        System.out.println("name : " + r_name);

        return sqlSession.selectList("ResBoardMapper.boardSelectToRname", r_name);
    }

    // Board Insert
    public int boardInsert(String r_uid, String r_sub, String r_name, String r_address, String r_contents, int r_rating) {
        System.out.println("===== Board Insert DAO =====");

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("r_uid", r_uid);
        map.put("r_sub", r_sub);
        map.put("r_name", r_name);
        map.put("r_address", r_address);
        map.put("r_contents", r_contents);
        map.put("r_rating", r_rating);

        return sqlSession.insert("ResBoardMapper.boardInsert", map);
    }

    // Board Delete
    public int boardDelete(int r_id) {
        System.out.println("===== Boar Delete DAO =====");
        System.out.println("게시글 번호 : " + r_id);

        return sqlSession.delete("ResBoardMapper.boardDelete", r_id);
    }

    // Board Update
    public int boardUpdate(int r_id, String r_sub, String r_name, String r_address, String r_contents, int r_rating) {
        System.out.println("===== Board Update DAO =====");

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("r_id", r_id);
        map.put("r_sub", r_sub);
        map.put("r_name", r_name);
        map.put("r_address", r_address);
        map.put("r_contents", r_contents);
        map.put("r_rating", r_rating);

        return sqlSession.update("ResBoardMapper.boardUpdate", map);
    }

    // Update r_view
    public int UpdateR_view(int r_id) {
        System.out.println("===== Update r_view DAO =====");
        System.out.println("게시글 번호 : " + r_id);

        return sqlSession.update("ResBoardMapper.updateR_view", r_id);
    }
}
