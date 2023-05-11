package com.spring.mukstar;

import com.spring.mukstar.command.TestCommand;
import com.spring.mukstar.command.TestLoginCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

    @Autowired
    private TestCommand testCommand;
    @Autowired
    private TestLoginCommand testLoginCommand;

    @RequestMapping("/")
    public String home(Model model) {
        model.addAttribute("data", "Hello, Spring from IntelliJ! : )");

        return "home";
    }

    @RequestMapping("test")
    public ModelAndView test(Model model) {
        System.out.println("===== Test Page =====");

        ModelAndView mv = new ModelAndView("test");
        mv.addObject("data", testCommand.execute(model));

        System.out.println("===== Page Loading =====");
        return mv;
    }

    @RequestMapping("testLogin")
    public String testLogin() {
        System.out.println("===== Login Test Page =====");

        return "testLogin";
    }

    @RequestMapping("loginCheck")
    public String loginCheck(HttpServletRequest request, Model model) {
        System.out.println("===== Login Checking =====");

        String u_id = request.getParameter("u_id");
        String u_pw = request.getParameter("u_pw");
        System.out.println("===== ID : " + u_id + ", PW : " + u_pw + " =====");

        int result = testLoginCommand.execute(u_id, u_pw);
        if (1 == result) {
            System.out.println("===== Login Success =====");
            model.addAttribute("u_id", u_id);

            System.out.println("===== Page Loading =====");
            return "testLoginSuccess";
        } else {
            System.out.println("===== Login Fail =====");

            System.out.println("===== Page Loading =====");
            return "testLoginFail";
        }
    }

    @RequestMapping("/index")
    public String index() {

        return "index";
    }
}
