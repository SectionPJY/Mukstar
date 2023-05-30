package com.spring.mukstar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubController {
    @RequestMapping("/userPage")
    private String userPage() {

        return "userPage";
    }

    @RequestMapping(value = "/myPage")
    private String myPage(){
        return "myPage";
    }

    @RequestMapping("/pwSearch")
    private String pwSearch() {

        return "pwSearch";
    }

    @RequestMapping(value = "/infoPW")
    private String pwCheck(){
        return "userInfo_pw";
    }

    @RequestMapping(value = "/userFind")
    private String userFind(){
        return "userFind";
    }
}
