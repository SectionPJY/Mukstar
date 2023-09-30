package com.spring.mukstar;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home(Model model) {
        model.addAttribute("data", "Hello, Spring from IntelliJ! : )");

        return "home";
    }

    @RequestMapping("/index")
    public String index() {

        return "user/index";
    }

    @RequestMapping("/test")
    public String test() {

        return "test";
    }

    @RequestMapping("/userPage")
    public String userPage() {

        return "user/userPage";
    }

  @RequestMapping("/header")
  public String header() {

    return "user/header";
  }

  @RequestMapping("/userFind")
  public String userFind() {

    return "user/userFind";
  }

  @RequestMapping("/postManage")
  public String postManage() {

    return "user/postManage";
  }

  @RequestMapping("/findMap")
  public String findMap() {

    return "user/findMap";
  }

  @RequestMapping("/postDetail")
  public String postDetail() {

    return "user/postDetail";
  }

  @RequestMapping("/writePost")
  public String writePost() {

    return "user/writePost";
  }
}
