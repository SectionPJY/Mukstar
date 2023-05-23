package com.spring.mukstar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubController {
    @RequestMapping("/userPage")
    public String userPage() {

        return "userPage";
    }

    @RequestMapping("/pwSearch")
    public String pwSearch() {

        return "pwSearch";
    }
}
