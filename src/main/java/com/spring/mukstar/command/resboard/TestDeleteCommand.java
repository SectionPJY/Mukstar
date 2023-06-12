package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestDeleteCommand {

    @Autowired
    private ResBoardDAO dao;

    public int execute() {
        System.out.println("===== Test Delete Command is Running =====");

        int[] values = {10, 11, 12};
        for (int r_id : values) {
            // 삭제 결과 담는 result
            int result = dao.boardDelete(r_id);

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
