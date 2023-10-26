package com.spring.mukstar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping("/index")
    public String index() {
        System.out.println("시작페이지");

        return "admin/adminIndex";
    }

    @RequestMapping("/memManage")
    public String memManage() {
        System.out.println("회원관리");

        return "admin/adminMemManage";
    }

    @RequestMapping("/response")
    public String response() {
        System.out.println("응대로그");

        return "admin/adminResponLog";
    }

    @RequestMapping("/shopManage")
    public String shopManage() {
        System.out.println("가게관리");

        return "admin/adminShopManage";
    }

    @RequestMapping("/postManage")
    public String postManage() {
        System.out.println("게시글관리");

        return "admin/adminPostManage";
    }
}
