package com.spring.mukstar;

import com.spring.mukstar.command.*;
import com.spring.mukstar.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private HttpSession session;

    @Autowired
    private TestCommand testCommand;
    @Autowired
    private TestLoginCommand testLoginCommand;
    @Autowired
    private TestSignUpCommand testSignUpCommand;
    @Autowired
    private TestUpdateCommand testUpdateCommand;
    @Autowired
    private TestUserInfoCommand testUserInfoCommand;

    @RequestMapping("/")
    public String home(Model model) {
        model.addAttribute("data", "Hello, Spring from IntelliJ! : )");

        return "index";
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

        int result = testLoginCommand.execute(request);
        if (1 == result) {
            System.out.println("===== Login Success =====");
            String u_id = request.getParameter("u_id");
            model.addAttribute("u_id", u_id);

            System.out.println("===== Page Loading =====");
            return "testLoginSuccess";
        } else {
            System.out.println("===== Login Fail =====");

            System.out.println("===== Page Loading =====");
            return "testLoginFail";
        }
    }

    @RequestMapping("testSignup")
    public String testSignup() {
        System.out.println("===== SignUp Test Page =====");

        System.out.println("===== Page Loading =====");
        return "testSignup";
    }

    @RequestMapping("signupCheck")
    public String signupCheck(HttpServletRequest request, Model model) {
        System.out.println("===== SignUp Check =====");

        if (null == request) {
            System.out.println("===== Error =====");

            request.setAttribute("msg", "오류가 발생했습니다.");
            request.setAttribute("url", "index");

            return "alert";
        }

        int result = testSignUpCommand.execute(request);
        if (1 == result) {
            System.out.println("===== SignUp Success =====");

            request.setAttribute("msg", "회원가입이 완료되었습니다.");
            request.setAttribute("url", "testLogin");
        } else {
            System.out.println("===== SignUp Fail =====");

            request.setAttribute("msg", "회원가입에 실패하였습니다,");
            request.setAttribute("url", "index");
        }

        return "alert";
    }

    @RequestMapping("testUpdate")
    public ModelAndView testUpdate(HttpServletRequest request, Model model) {
        System.out.println("===== Update Test Page =====");

        List<UserDTO> dto = testUserInfoCommand.execute(model);
        ModelAndView mv = new ModelAndView("testUpdate");
        mv.addObject("data", dto);

        System.out.println("===== Page Loading =====");
        return mv;
    }

    @RequestMapping("userUpdate")
    public String userUpdate(HttpServletRequest request) {
        System.out.println("===== Update User =====");

        int result = testUpdateCommand.execute(request);
        if (1 == result) {
            request.setAttribute("msg", "수정이 완료되었습니다.");
            request.setAttribute("url", "testLoginSuccess");
        } else {
            request.setAttribute("msg", "수정에 실패하였습니다.");
            request.setAttribute("url", "testLogin");
        }

        return "alert";
    }

    @RequestMapping("logout")
    public String logout() {
        System.out.println("===== User LogOut =====");

        session.invalidate();

        return "index";
    }

    @RequestMapping("/index")
    public String index() {

        return "index";
    }
}
