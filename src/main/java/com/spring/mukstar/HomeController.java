package com.spring.mukstar;

import com.spring.mukstar.command.qna.QnAListCommand;
import com.spring.mukstar.command.resboard.*;
import com.spring.mukstar.command.subscribe.ChannelListCommand;
import com.spring.mukstar.command.subscribe.SubDeleteCommand;
import com.spring.mukstar.command.subscribe.SubInsertCommand;
import com.spring.mukstar.command.subscribe.SubscriberListCommand;
import com.spring.mukstar.command.user.*;
import com.spring.mukstar.dto.QnADTO;
import com.spring.mukstar.dto.ResBoardDTO;
import com.spring.mukstar.dto.SubscribeDTO;
import com.spring.mukstar.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private HttpSession session;

    @Autowired
    private UserListCommand userListCommand;
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
    @Autowired
    private BoardUpdateCommand boardUpdateCommand;
    @Autowired
    private BoardInfoCommand boardInfoCommand;
    @Autowired
    private TestDeleteCommand testDeleteCommand;
    @Autowired
    private QnAListCommand qnAListCommand;
    @Autowired
    private SubInsertCommand subInsertCommand;
    @Autowired
    private SubDeleteCommand subDeleteCommand;
    @Autowired
    private ChannelListCommand channelListCommand;
    @Autowired
    private SubscriberListCommand subscriberListCommand;

    private ModifiableHttpServletRequest modifyRequest;

    @RequestMapping("/")
    public ModelAndView home(HttpServletRequest request, Model model) {
        ModelAndView mv = new ModelAndView("index");
        List<ResBoardDTO> dtos = boardListCommand.execute(request);
        model.addAttribute("boardList", dtos);
        return mv;
    }

    @RequestMapping("/login")
    public String login() {
        System.out.println("===== Login Page =====");

        return "login";
    }

    @RequestMapping("/signup")
    public String signup() {
        System.out.println("===== SignUp Page =====");

        System.out.println("===== Page Loading =====");
        return "signup";
    }

    @RequestMapping("userList")
    public ModelAndView userList(Model model) {
        System.out.println("===== Test Page =====");

        ModelAndView mv = new ModelAndView("userList");
        mv.addObject("data", userListCommand.execute(model));

        System.out.println("===== Page Loading =====");
        return mv;
    }

    @RequestMapping("logout")
    public String logout() {
        System.out.println("===== User LogOut =====");

        session.invalidate();

        return "redirect:/";
    }

    @RequestMapping("loginCheck")
    public ModelAndView loginCheck(HttpServletRequest request, Model model) {
        System.out.println("===== Login Checking =====");
        ModelAndView mv;

        int result = loginCommand.execute(request);
        if (1 == result) {
            System.out.println("===== Login Success =====");
            String u_id = request.getParameter("u_id");
            model.addAttribute("u_id", u_id);

            System.out.println("===== Page Loading =====");
            mv = new ModelAndView("index");
            List<ResBoardDTO> dtos = boardListCommand.execute(request);
            model.addAttribute("boardList", dtos);

        } else {
            System.out.println("===== Login Fail =====");
            mv = new ModelAndView("alert");
            request.setAttribute("msg", "오류가 발생했습니다.");
            request.setAttribute("url", "login");
        }
        return mv;
    }

    @RequestMapping(value = "/pwCheck")
    private String pwCheck(HttpServletRequest request){
        String spw = session.getAttribute("u_pw").toString();
        String rpw = request.getParameter("u_pw");

        if(Objects.equals(spw, rpw)){
            return "userInfo_edit";
        } else{
            return "redirect:/";
        }
    }

    @RequestMapping("/signupCheck")
    public String signupCheck(HttpServletRequest request, Model model) {
        System.out.println("===== SignUp Check =====");

        if (null == request) {
            System.out.println("===== Error =====");

            request.setAttribute("msg", "오류가 발생했습니다.");
            request.setAttribute("url", "redirect:/");

            return "alert";
        }

        int result = signUpCommand.execute(request);
        if (1 == result) {
            System.out.println("===== SignUp Success =====");

            request.setAttribute("msg", "회원가입이 완료되었습니다.");
            request.setAttribute("url", "login");
        } else {
            System.out.println("===== SignUp Fail =====");

            request.setAttribute("msg", "회원가입에 실패하였습니다,");
            request.setAttribute("url", "redirect:/");
        }

        return "alert";
    }

    @RequestMapping("update")
    public ModelAndView update(HttpServletRequest request, Model model) {
        System.out.println("===== Update Page =====");

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

    @RequestMapping(value = "/myPage")
    private ModelAndView myPage(HttpServletRequest request, Model model){
        System.out.println("===== Select Board Page =====");
        ModelAndView mv = null;
        List<ResBoardDTO> dto = boardSelectCommand.uidToContents(request);
        if (null == dto) {
            model.addAttribute("msg", "내 게시글을 불러오는데 실패했습니다.");
            model.addAttribute("url", "redirect:/");
            mv = new ModelAndView("alert");
        } else {
            mv = new ModelAndView("myPage");
            model.addAttribute("boardData", dto);
        }

        return mv;
    }

    @RequestMapping(value = "/pManage")
    private ModelAndView pManage(HttpServletRequest request, Model model) {
        System.out.println("===== Select Board Page =====");
        ModelAndView mv = null;
        List<ResBoardDTO> dto = boardSelectCommand.uidToContents(request);
        if (null == dto) {
            model.addAttribute("msg", "내 게시글을 불러오는데 실패했습니다.");
            model.addAttribute("url", "redirect:/");
            mv = new ModelAndView("alert");
        } else {
            mv = new ModelAndView("postManage");
            model.addAttribute("boardData", dto);
        }

        return mv;
    }

    @RequestMapping(value = "/userPage")
    private ModelAndView userPage(HttpServletRequest request, Model model){
        System.out.println("===== Select Board Page =====");
        ModelAndView mv = null;
        List<ResBoardDTO> dto = boardSelectCommand.uidToUserContents(request);
        if (null == dto) {
            model.addAttribute("msg", "게시글을 불러오는데 실패했습니다.");
            model.addAttribute("url", "redirect:/");
            mv = new ModelAndView("alert");
        } else {
            mv = new ModelAndView("userPage");
            model.addAttribute("boardData", dto);
        }

        return mv;
    }

    @RequestMapping("/userSearch")
    public ModelAndView userSearch(HttpServletRequest request, Model model) {
        System.out.println("===== User Searching =====");

        ModelAndView mv = null;
        List<SearchDTO> dtos = userSearchCommand.execute(request, model);
        if (null == dtos) {
            model.addAttribute("msg", "검색결과를 불러오지 못했습니다.");
            model.addAttribute("url", "userFind");

            mv = new ModelAndView("alert");
        } else {
            model.addAttribute("userData", dtos);
            mv = new ModelAndView("userFind");
        }

        System.out.println("===== Page Loading =====");
        return mv;
    }

    @RequestMapping("/boardSearch")
    public ModelAndView boardSearch(HttpServletRequest request, Model model) {

        ModelAndView mv = null;
        List<ResBoardDTO> dtos = boardSelectCommand.rnameToContents(request);
        if (null == dtos) {
            model.addAttribute("msg", "검색결과를 불러오지 못했습니다.");
            model.addAttribute("url", "redirect:/mapFind");

            mv = new ModelAndView("alert");
        } else {
            model.addAttribute("postData", dtos);
            mv = new ModelAndView("findPost");
        }

        System.out.println("===== Page Loading =====");
        return mv;
    }

    @RequestMapping("/pSelect")
    public ModelAndView boardSelect(HttpServletRequest request, Model model) {
        System.out.println("===== Select Board Page =====");

        ModelAndView mv = null;
        List<ResBoardDTO> dto = boardSelectCommand.execute(request);
        if (null == dto) {
            model.addAttribute("msg", "게시글을 불러오는데 실패했습니다.");
            model.addAttribute("url", "redirect:/");
            mv = new ModelAndView("alert");
        } else {
            mv = new ModelAndView("postDetail");
            model.addAttribute("boardData", dto);
        }

        return mv;
    }

    @RequestMapping(value = "/mapFind")
    private ModelAndView mapFind(HttpServletRequest request, Model model) {

        System.out.println("===== Select Board Page =====");

        ModelAndView mv = null;
        List<ResBoardDTO> dtos = boardListCommand.execute(request);
        if (null == dtos) {
            model.addAttribute("msg", "게시글을 불러오는데 실패했습니다.");
            model.addAttribute("url", "redirect:/");
            mv = new ModelAndView("alert");
        } else {
            mv = new ModelAndView("findMap");
            model.addAttribute("boardData", dtos);
        }

        return mv;
    }

    @RequestMapping("/pWrite")
    public String insertBoard(HttpServletRequest request, Model model) {
        System.out.println("===== Insert Board =====");

        int result = boardInsertCommand.execute(request);
        if (1 == result) {
            model.addAttribute("msg", "게시글이 작성되었습니다.");
        } else {
            model.addAttribute("msg", "게시글 작성에 실패하였습니다.");
        }
        model.addAttribute("url", "pManage");

        return "alert";
    }

    @RequestMapping("pDelete")
    public String boardDelete(HttpServletRequest request, Model model) {
        System.out.println("===== Board Delete =====");

        int result = boardDeleteCommand.execute(request);
        if (1 == result) {
            model.addAttribute("msg", "게시글이 삭제되었습니다.");
            model.addAttribute("url", "pManage");
        } else {
            model.addAttribute("msg", "게시글 삭제에 실패하였습니다.");
            model.addAttribute("url", "pManage");
        }

        return "alert";
    }

    @RequestMapping("/pUpdatePage")
    public ModelAndView boardUpdatePage(HttpServletRequest request, Model model) {
        System.out.println("===== Board Update Page =====");

        ModelAndView mv = null;
        List<ResBoardDTO> dto = boardInfoCommand.execute(request);
        if (null == dto) {
            model.addAttribute("msg", "게시글을 불러오는데 실패했습니다.");
            model.addAttribute("url", "myPage");
            mv = new ModelAndView("alert");
        } else {
            mv = new ModelAndView("updatePost");
            model.addAttribute("boardData", dto);
        }

        return mv;
    }

    @RequestMapping("/pUpdate")
    public String boarUpdate(HttpServletRequest request, Model model) {
        System.out.println("===== Board Update =====");

        modifyRequest = new ModifiableHttpServletRequest(request);
        modifyRequest.setParameter("searchWord", session.getAttribute("u_nickname").toString());
        request = modifyRequest;
        List<SearchDTO> dtos = userSearchCommand.execute(request, model);
        modifyRequest.setParameter("r_uid", dtos.get(0).getU_id());
        request = modifyRequest;
        int result = boardUpdateCommand.execute(request);
        if (result == 1) {
            model.addAttribute("msg", "수정이 완료되었습니다.");
        } else {
            model.addAttribute("msg", "수정에 실패하였습니다.");
        }
        model.addAttribute("url", "/myPage");

        return "alert";
    }

    @RequestMapping("qnaList")
    public ModelAndView qnaList(HttpServletRequest request, Model model) {
        System.out.println("===== QnA List Page =====");

        ModelAndView mv = new ModelAndView("qnaList");
        List<QnADTO> dtos = qnAListCommand.execute();
        model.addAttribute("qnaList", dtos);

        return mv;
    }

    @RequestMapping("addSub")
    public String addSub(HttpServletRequest request, Model model) {
        System.out.println("===== Add Subscribe =====");

        int result = subInsertCommand.execute(request);
        if (1 == result) {
            model.addAttribute("msg", "구독되었습니다.");
            model.addAttribute("url", "userList");
        } else {
            model.addAttribute("msg", "오류가 발생했습니다.");
            model.addAttribute("url", "userList");
        }

        return "alert";
    }

    @RequestMapping("delSub")
    public String delSub(HttpServletRequest request, Model model) {
        System.out.println("===== Delete Subscribe =====");

        int result = subDeleteCommand.execute(request);
        if (1 == result) {
            model.addAttribute("msg", "구독취소되었습니다.");
            model.addAttribute("url", "userList");
        } else {
            model.addAttribute("msg", "오류가 발생했습니다.");
            model.addAttribute("url", "userList");
        }

        return "alert";
    }

    @RequestMapping("channelList")
    public ModelAndView channelList(Model model) {
        System.out.println("===== Channel List =====");

        String s_subscriber = session.getAttribute("u_id").toString();
        System.out.println("User : " + s_subscriber);

        ModelAndView mv = new ModelAndView("channelList");
        List<SubscribeDTO> dtos = channelListCommand.execute(s_subscriber);
        model.addAttribute("channelList", dtos);

        return mv;
    }

    @RequestMapping("subList")
    public ModelAndView subList(Model model) {
        System.out.println("===== Subscriber List =====");

        String s_channel = session.getAttribute("u_id").toString();
        System.out.println("Channel : " + s_channel);

        ModelAndView mv = new ModelAndView("subList");
        List<SubscribeDTO> dtos = subscriberListCommand.execute(s_channel);
        model.addAttribute("subList", dtos);

        return mv;
    }
}
