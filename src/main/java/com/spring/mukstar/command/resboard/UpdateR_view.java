package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UpdateR_view {

    @Autowired
    private ResBoardDAO dao;

    public void execute(int r_id) {
        System.out.println("===== r_view Update =====");

        int result = dao.UpdateR_view(r_id);
        if (1 == result) {
            System.out.println("Success");
        } else {
            System.out.println("Fail");
        }
    }
}
