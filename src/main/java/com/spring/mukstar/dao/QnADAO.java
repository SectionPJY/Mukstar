package com.spring.mukstar.dao;

import com.spring.mukstar.dto.QnADTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Objects;

@Service
public class QnADAO {

    @Autowired
    private SqlSession sqlSession;

    // QnA List
    public List<QnADTO> qnaList() {
        System.out.println("===== QnA List DAO =====");

        return sqlSession.selectList("QnAMapper.qnaList");
    }

    // QnA List - u_id
    public List<QnADTO> qnaList(String u_id) {
        System.out.println("===== QnA List DAO =====");
        System.out.println("User ID : " + u_id);

        return sqlSession.selectList("QnAMapper.qnaListUid", u_id);
    }

    // QnA Update
    public int updateQna(int q_id, String q_uid, String q_sub, String q_contents) {
        System.out.println("===== QnA Update DAO =====");
        System.out.println(q_id + ", " + q_uid + ", " + q_sub + ", " + q_contents);

        HashMap<String, Object> map = new HashMap<>();
        map.put("q_id", q_id);
        map.put("q_uid", q_uid);
        map.put("q_sub", q_sub);
        map.put("q_contents", q_id);

        return sqlSession.update("QnAMapper.updateQna", map);
    }

    // QnA Delete
    public int deleteQna(int q_id) {
        System.out.println("===== QnA Delete DAO =====");
        System.out.println("ID : " + q_id);

        return sqlSession.delete("QnAMapper.deleteQna", q_id);
    }

    // QnA Select
    public List<QnADTO> selectQna(int q_id) {
        System.out.println("===== QnA Select DAO =====");
        System.out.println("ID : " + q_id);

        return sqlSession.selectList("QnAMapper.selectQna", q_id);
    }

    // QnA Insert
    public int insertQna(String q_uid, String q_sub, String q_contents) {
        System.out.println("===== Insert QnA DAO =====");
        System.out.println("유저 ID : " + q_uid + ", 제목 : " + q_sub);

        HashMap<String, String> map = new HashMap<>();
        map.put("q_uid", q_uid);
        map.put("q_sub", q_sub);
        map.put("q_contents", q_contents);

        return sqlSession.insert("QnAMapper.insertQna", map);
    }

    /*
    * Admin
    * */
    // QnA List in Admin Index
    public List<QnADTO> qnaListAdminIndex() {
        System.out.println("===== QnA List Admin Index DAO =====");

        return sqlSession.selectList("QnAMapper.qnaListAdminIndex");
    }
}
