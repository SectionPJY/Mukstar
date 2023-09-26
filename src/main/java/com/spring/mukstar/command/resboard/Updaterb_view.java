package com.spring.mukstar.command.resboard;

import com.spring.mukstar.dao.ResBoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Updaterb_view {

    @Autowired
    private ResBoardDAO dao;

    public void execute(int rb_id) {
        System.out.println("===== rb_view Update =====");

        int result = dao.Updaterb_view(rb_id);
        if (1 == result) {
            System.out.println("Success");
        } else {
            System.out.println("Fail");
        }
    }
}
