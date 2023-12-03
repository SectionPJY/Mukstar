package com.spring.mukstar;

import com.spring.mukstar.dto.ResBoardDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class SubController {

    @RequestMapping("/pwSearch")
    private String pwSearch() { return "pwSearch"; }

    @RequestMapping(value = "/infoPW")
    private String pwCheck(){
        return "user/userInfo_pw";
    }

    @RequestMapping(value = "/userFind")
    private String userFind(){
        return "user/userFind";
    }

    @RequestMapping(value = "/wPost")
    private String wPost(){ return "user/writePost"; }

    @RequestMapping(value = "/adminLogin")
    private String adminLogin(){ return "admin/adminLogin"; }
}
