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
    public List<ResBoardDTO> boardSelect(int rb_id) {
        System.out.println("===== Board Select DAO =====");
        System.out.println("게시글번호 : " + rb_id);

        return sqlSession.selectList("ResBoardMapper.boardSelect", rb_id);
    }

    public List<ResBoardDTO> boardSelectToUid(String u_id) {
        System.out.println("===== Board Select To Uid DAO =====");
        System.out.println("user : " + u_id);

        return sqlSession.selectList("ResBoardMapper.boardSelectToUid", u_id);
    }

    public List<ResBoardDTO> boardSelectToRname(String rb_name) {
        System.out.println("===== Board Select To Uid DAO =====");
        System.out.println("name : " + rb_name);

        return sqlSession.selectList("ResBoardMapper.boardSelectToRname", rb_name);
    }

    // Board Insert
    public int boardInsert(String rb_uid, String rb_sub, String r_name, String r_address, String rb_contents, int rb_rating) {
        System.out.println("===== Board Insert DAO =====");

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("rb_uid", rb_uid);
        map.put("rb_sub", rb_sub);
        map.put("r_name", r_name);
        map.put("r_address", r_address);
        map.put("rb_contents", rb_contents);
        map.put("rb_rating", rb_rating);

        int result = sqlSession.insert("ResBoardMapper.dupCheck", map);
        if (1 == result) {
            System.out.println("===== Duplication Check Success =====");
            return sqlSession.insert("ResBoardMapper.boardInsert", map);
        } else {
            System.out.println("===== Duplication Check Fail =====");
            return -1;
        }
    }

    // Board Delete
    public int boardDelete(int rb_id) {
        System.out.println("===== Boar Delete DAO =====");
        System.out.println("게시글 번호 : " + rb_id);

        return sqlSession.delete("ResBoardMapper.boardDelete", rb_id);
    }

    // Board Update
    public int boardUpdate(int rb_id, String rb_sub, String rb_name, String rb_address, String rb_contents, int rb_rating) {
        System.out.println("===== Board Update DAO =====");

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("rb_id", rb_id);
        map.put("rb_sub", rb_sub);
        map.put("rb_name", rb_name);
        map.put("rb_address", rb_address);
        map.put("rb_contents", rb_contents);
        map.put("rb_rating", rb_rating);

        return sqlSession.update("ResBoardMapper.boardUpdate", map);
    }

    // Update rb_view
    public int Updaterb_view(int rb_id) {
        System.out.println("===== Update rb_view DAO =====");
        System.out.println("게시글 번호 : " + rb_id);

        return sqlSession.update("ResBoardMapper.updaterb_view", rb_id);
    }
}
