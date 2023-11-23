package com.spring.mukstar.dao;

import com.spring.mukstar.dto.ResBoardDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class ResBoardDAO {

    @Autowired
    private SqlSession sqlSession;

    // Board List
    public List<ResBoardDTO> boardList(String sort) {
        System.out.println("===== Board List DAO =====");
        System.out.println("Sort : " + sort);

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
    public int boardInsert(String r_name, String rb_uid, String rb_sub, int rb_rating, String rb_contents) {
        System.out.println("===== Board Insert DAO =====");

        HashMap<String, Object> map = new HashMap<>();
        map.put("rb_uid", rb_uid);
        map.put("rb_sub", rb_sub);
        map.put("r_name", r_name);
        map.put("rb_contents", rb_contents);
        map.put("rb_rating", rb_rating);

        return sqlSession.insert("ResBoardMapper.boardInsert", map);
    }

    // Board Delete
    public int boardDelete(int rb_id) {
        System.out.println("===== Boar Delete DAO =====");
        System.out.println("게시글 번호 : " + rb_id);

        return sqlSession.delete("ResBoardMapper.boardDelete", rb_id);
    }

    // Update rb_view
    public int Updaterb_view(int rb_id) {
        System.out.println("===== Update rb_view DAO =====");
        System.out.println("게시글 번호 : " + rb_id);

        return sqlSession.update("ResBoardMapper.updaterb_view", rb_id);
    }



    /*
    * Admin Page DAO
    * */

    // Index Page
    // Select ResBoard
    public List<ResBoardDTO> selectBoardAdmin() {
        System.out.println("===== Admin Select Board DAO =====");

        return sqlSession.selectList("ResBoardMapper.adminIndexBoard");
    }

    public List<ResBoardDTO> selectBoardListAdmin(String u_id) {
        System.out.println("===== Admin Select Board DAO =====");
        System.out.println("User ID : " + u_id);

        return sqlSession.selectList("ResBoardMapper.resBoardSelectUser", u_id);
    }

    public List<ResBoardDTO> selectBoardPostDetail(int rb_id) {
        System.out.println("===== Admin Post Detail Page Select Board DAO =====");
        System.out.println("Board ID : " + rb_id);

        return sqlSession.selectList("ResBoardMapper.boardSelectForAdmin", rb_id);
    }

    // Resboard Search Admin
    public List<ResBoardDTO> searchBoardAdmin(String searchWord) {
        System.out.println("===== Board Search in Admin =====");

        if (searchWord.isEmpty() || searchWord == null){
            return null;
        }else {
            searchWord = "%" + searchWord + "%";
            System.out.println("Search Word : " + searchWord);
        }

        return sqlSession.selectList("ResBoardMapper.resBoardSearchAdmin", searchWord);
    }

    // Resboard Select From r_id
    public List<ResBoardDTO> selectBoardFromR_id(int r_id) {
        System.out.println("===== Board Select From r_id DAO =====");
        System.out.println("가게 ID : " + r_id);

        return sqlSession.selectList("ResBoardMapper.boardSelectFromR_id", r_id);
    }

    // Board Update
    public int updateBoard(int rb_id, int rb_rid, String rb_sub, int rb_rating, String rb_contents) {
        System.out.println("===== Board Update DAO =====");
        System.out.println(rb_id + ", " + rb_rid + ", " + rb_sub + ", " + rb_rating + ", " + rb_contents);

        HashMap<String, Object> map = new HashMap<>();
        map.put("rb_id", rb_id);
        map.put("rb_rid", rb_rid);
        map.put("rb_sub", rb_sub);
        map.put("rb_rating", rb_rating);
        map.put("rb_contents", rb_contents);

        return sqlSession.update("ResBoardMapper.updateBoard", map);
    }
}
