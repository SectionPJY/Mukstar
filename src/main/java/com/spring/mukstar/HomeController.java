package com.spring.mukstar;

import com.spring.mukstar.command.resboard.BoardDeleteCommand;
import com.spring.mukstar.command.resboard.BoardInsertCommand;
import com.spring.mukstar.command.resboard.BoardListCommand;
import com.spring.mukstar.command.resboard.BoardSelectCommand;
import com.spring.mukstar.command.user.*;
import com.spring.mukstar.dto.ResBoardDTO;
import com.spring.mukstar.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;

@Controller
public class HomeController {

    @Autowired
    private HttpSession session;

    @Autowired
    private TestCommand testCommand;
    @Autowired
    private LoginCommand loginCommand;
    @Autowired
    private SignUpCommand signUpCommand;
    @Autowired
    private UpdateCommand updateCommand;
    @Autowired
    private UserInfoCommand userInfoCommand;
    @Autowired
    private UserSearchCommand userSearchCommand;
    @Autowired
    private BoardListCommand boardListCommand;
    @Autowired
    private BoardSelectCommand boardSelectCommand;
    @Autowired
    private BoardInsertCommand boardInsertCommand;
    @Autowired
    private BoardDeleteCommand boardDeleteCommand;

    @RequestMapping("/")
    public String home() {

        return "index";
    }

    @RequestMapping("/login")
    public String testLogin() {
        System.out.println("===== Login Test Page =====");

        return "login";
    }

    @RequestMapping("loginCheck")
    public String loginCheck(HttpServletRequest request, Model model) {
        System.out.println("===== Login Checking =====");

        int result = loginCommand.execute(request);
        if (1 == result) {
            System.out.println("===== Login Success =====");
            String u_id = request.getParameter("u_id");
            model.addAttribute("u_id", u_id);

            System.out.println("===== Page Loading =====");
            return "index";
        } else {
            System.out.println("===== Login Fail =====");

            System.out.println("===== Page Loading =====");
            return "loginFail";
        }
    }

    @RequestMapping(value = "/pwCheck")
    private String pwCheck(HttpServletRequest request){
        String spw = session.getAttribute("u_pw").toString();
        String rpw = request.getParameter("u_pw");

        if(Objects.equals(spw, rpw)){
            return "userInfo_edit";
        } else{
            return "index";
        }
    }

    @RequestMapping("/signup")
    public String testSignup() {
        System.out.println("===== SignUp Test Page =====");

        System.out.println("===== Page Loading =====");
        return "signup";
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

        int result = signUpCommand.execute(request);
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

    @RequestMapping("update")
    public ModelAndView testUpdate(HttpServletRequest request, Model model) {
        System.out.println("===== Update Test Page =====");

        UserDTO dto = userInfoCommand.execute(model);
        ModelAndView mv = new ModelAndView("Update");

        System.out.println("===== Page Loading =====");
        return mv;
    }

    @RequestMapping("userUpdate")
    public String userUpdate(HttpServletRequest request) {
        System.out.println("===== Update User =====");

        int result = updateCommand.execute(request);
        if (1 == result) {
            request.setAttribute("msg", "수정이 완료되었습니다.");
            request.setAttribute("url", "logout");
        } else {
            request.setAttribute("msg", "수정에 실패하였습니다.");
            request.setAttribute("url", "logout");
        }

        return "alert";
    }

    @RequestMapping("testSearch")
    public String testSearch() {
        System.out.println("===== Search Test Page =====");

        System.out.println("===== Page Loading =====");
        return "testSearch";
    }

    @RequestMapping("userSearch")
    public ModelAndView userSearch(HttpServletRequest request, Model model) {
        System.out.println("===== User Searching =====");

        ModelAndView mv = null;
        List<UserDTO> dtos = userSearchCommand.execute(request, model);
        if (null == dtos) {
            model.addAttribute("msg", "검색결과를 불러오지 못했습니다.");
            model.addAttribute("url", "testSearch");

            mv = new ModelAndView("alert");
        } else {
            mv = new ModelAndView("testSearchResult");
        }

        System.out.println("===== Page Loading =====");
        return mv;
    }

    @RequestMapping("logout")
    public String logout() {
        System.out.println("===== User LogOut =====");

        session.invalidate();

        return "index";
    }

    @RequestMapping("testBoardList")
    public ModelAndView testBoardList(HttpServletRequest request, Model model) {
        System.out.println("===== Test Board List Page =====");

        ModelAndView mv = new ModelAndView("testBoardList");
        List<ResBoardDTO> dtos = boardListCommand.execute(request);
        model.addAttribute("boardList", dtos);

        return mv;
    }

    @RequestMapping("boardSelect")
    public ModelAndView boardSelect(HttpServletRequest request, Model model) {
        System.out.println("===== Select Board Page =====");

        ModelAndView mv = null;
        List<ResBoardDTO> dto = boardSelectCommand.execute(request);
        if (null == dto) {
            model.addAttribute("msg", "게시글을 불러오는데 실패했습니다.");
            model.addAttribute("url", "testBoardList");
            mv = new ModelAndView("alert");
        } else {
            mv = new ModelAndView("boardDetail");
            model.addAttribute("boardData", dto);
        }

        return mv;
    }

    @RequestMapping("boardWriting")
    public String boardWriting() {

        return "boardWriting";
    }

    @RequestMapping("insertBoard")
    public String insertBoard(HttpServletRequest request, Model model) {
        System.out.println("===== Insert Board =====");

        int result = boardInsertCommand.execute(request);
        if (1 == result) {
            model.addAttribute("msg", "게시글이 작성되었습니다.");
        } else {
            model.addAttribute("msg", "게시글 작성에 실패하였습니다.");
        }
        model.addAttribute("url", "testBoardList");

        return "alert";
    }

    @RequestMapping("boardDelete")
    public String boardDelete(HttpServletRequest request, Model model) {
        System.out.println("===== Board Delete =====");

        int result = boardDeleteCommand.execute(request);
        if (1 == result) {
            model.addAttribute("msg", "게시글이 삭제되었습니다.");
            model.addAttribute("url", "testBoardList");
        } else {
            model.addAttribute("msg", "게시글 삭제에 실패하였습니다.");
            model.addAttribute("url", "testBoardList");
        }

        return "alert";
    }
}
