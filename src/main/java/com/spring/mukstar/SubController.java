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

    @RequestMapping(value = "/sInfo")
    private String sInfo(){ return "subscribeInfo"; }
}
