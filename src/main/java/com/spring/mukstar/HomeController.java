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

        return "index";
    }
}
