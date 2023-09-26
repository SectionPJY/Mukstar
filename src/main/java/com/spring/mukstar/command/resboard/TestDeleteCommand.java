package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class TestDeleteCommand {

    @Autowired
    private ResBoardDAO dao;

    public int execute(HttpServletRequest request) {
        System.out.println("===== Test Delete Command is Running =====");

        String[] values = request.getParameterValues("chBox");
        int[] intValues = new int[values.length];

        // 선택된 rb_id값 int로 변환
        for (int i = 0; i < values.length; i++) {
            intValues[i] = Integer.parseInt(values[i]);
        }
        for (int rb_id : intValues) {
            // 삭제 결과 담는 result
            int result = dao.boardDelete(rb_id);

            if (1 == result) {
                // 삭제가 됐으면 for문 계속 진행
                continue;
            } else {
                // 삭제에 실패했으면 -1 반환
                return -1;
            }
        }
        // for문이 정상작동 됐으면 1 반환
        return 1;
    }
}
