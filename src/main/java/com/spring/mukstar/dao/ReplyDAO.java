package com.spring.mukstar.dao;

import com.spring.mukstar.dto.ReplyDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class ReplyDAO {

    @Autowired
    SqlSession sqlSession;

    // Search Reply Admin
    public List<ReplyDTO> searchReplyAdmin(String searchWord) {
        System.out.println("===== Reply Search in Admin =====");

        if (searchWord.isEmpty() || searchWord == null){
            return null;
        }else {
            searchWord = "%" + searchWord + "%";
            System.out.println("Search Word : " + searchWord);
        }

        return sqlSession.selectList("ReplyMapper.searchReplyAdmin", searchWord);
    }

    // Select User's Reply
    public List<ReplyDTO> selectUserReply(String u_id) {
        System.out.println("===== Select User's Reply DAO =====");
        System.out.println("User ID : " + u_id);

        return sqlSession.selectList("ReplyMapper.selectUserReply", u_id);
    }

    // Update Reply
    public int updateReply(int r_id, String r_bid, String r_uid, String r_contents) {
        System.out.println("===== Update Reply DAO =====");
        System.out.println(r_id + ", " + r_bid + ", " + r_uid + ", " + r_contents);

        HashMap<String, Object> map = new HashMap<>();
        map.put("r_id", r_id);
        map.put("r_bid", r_bid);
        map.put("r_uid", r_uid);
        map.put("r_contents", r_contents);

        return sqlSession.update("ReplyMapper.updateReply", map);
    }

    // Delete Reply
    public int deleteReply(int r_id) {
        System.out.println("===== Delete Reply DAO =====");
        System.out.println("ID : " + r_id);

        return sqlSession.delete("ReplyMapper.deleteReply", r_id);
    }
}
