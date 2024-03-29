package com.spring.mukstar;

import com.spring.mukstar.Class.ModifiableHttpServletRequest;
import com.spring.mukstar.command.qna.QnAInsertCommand;
import com.spring.mukstar.command.qna.QnAListCommand;
import com.spring.mukstar.command.reply.ReplyDeleteCommand;
import com.spring.mukstar.command.reply.ReplyInsertCommand;
import com.spring.mukstar.command.reply.ReplySelectRidCommand;
import com.spring.mukstar.command.reply.ReplySelectRbIdCommand;
import com.spring.mukstar.command.resboard.*;
import com.spring.mukstar.command.restaurant.RestaurantListCommand;
import com.spring.mukstar.command.subscribe.ChannelListCommand;
import com.spring.mukstar.command.subscribe.SubDeleteCommand;
import com.spring.mukstar.command.subscribe.SubInsertCommand;
import com.spring.mukstar.command.subscribe.SubscriberListCommand;
import com.spring.mukstar.command.user.*;
import com.spring.mukstar.dto.*;
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
    private UserListCommand userListCommand;
    @Autowired
    private LoginCommand loginCommand;
    @Autowired
    private SignUpCommand signUpCommand;
    @Autowired
    private UserUpdateCommand userUpdateCommand;
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
    @Autowired
    private ReplySelectRbIdCommand replySelectRbIdCommand;
    @Autowired
    private ReplySelectRidCommand replySelectRidCommand;
    @Autowired
    private UserPwSearchCommand userPwSearchCommand;
    @Autowired
    private ReplyDeleteCommand replyDeleteCommand;
    @Autowired
    private RestaurantListCommand restaurantListCommand;
    @Autowired
    private ReplyInsertCommand replyInsertCommand;
    @Autowired
    private QnAInsertCommand qnaInsertCommand;

    private ModifiableHttpServletRequest modifyRequest;

    @RequestMapping("/")
    public ModelAndView home(HttpServletRequest request, Model model) {
        ModelAndView mv = new ModelAndView("user/index");
        List<ResBoardDTO> dtos = boardListCommand.executeUser(request);
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

        ModelAndView mv = new ModelAndView("test/userList");
        mv.addObject("userList", userListCommand.execute());

        String s_subscriber = session.getAttribute("u_id").toString();
        mv.addObject("channelList", channelListCommand.execute(s_subscriber));

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
            mv = new ModelAndView("user/index");
            List<ResBoardDTO> dtos = boardListCommand.executeUser(request);
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
            return "user/userInfo_edit";
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
            request.setAttribute("url", "/");

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
            request.setAttribute("url", "/");
        }

        return "alert";
    }

    @RequestMapping("userUpdate")
    public String userUpdate(HttpServletRequest request) {
        System.out.println("===== Update User =====");

        int result = userUpdateCommand.execute(request);
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
            model.addAttribute("url", "/");
            mv = new ModelAndView("alert");
        } else {
            mv = new ModelAndView("user/myPage");
            model.addAttribute("boardData", dto);
            model.addAttribute("nickname", session.getAttribute("u_nickname"));
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
            model.addAttribute("url", "/");
            mv = new ModelAndView("alert");
        } else {
            mv = new ModelAndView("user/postManage");
            model.addAttribute("boardData", dto);
        }

        return mv;
    }

    @RequestMapping(value = "/userPage")
    private ModelAndView userPage(HttpServletRequest request, Model model){
        System.out.println("===== Select Board Page =====");
        ModelAndView mv = null;
        List<ResBoardDTO> dto = boardSelectCommand.uidToUserContents(request);
        modifyRequest = new ModifiableHttpServletRequest(request);
        modifyRequest.setParameter("id", request.getParameter("uid").toString());
        request = modifyRequest;
        UserDTO usr = userInfoCommand.execute(request);
        if (null == dto) {
            model.addAttribute("msg", "게시글을 불러오는데 실패했습니다.");
            model.addAttribute("url", "/");
            mv = new ModelAndView("alert");
        } else {
            mv = new ModelAndView("user/userPage");
            if (null != session.getAttribute("u_id")){
                List<SubscribeDTO> dtos = channelListCommand.execute(session.getAttribute("u_id").toString());
                if (dtos.isEmpty()){
                    model.addAttribute("channelData", null);
                }else {
                    for (SubscribeDTO subscribeDTO : dtos) {
                        boolean test = subscribeDTO.getS_channel().equals(request.getParameter("uid"));
                        System.out.println(test);
                        if (test) {
                            model.addAttribute("channelData", "yes");
                        } else {
                            model.addAttribute("channelData", null);
                        }
                    }
                }
            }
            model.addAttribute("name", usr.getU_nickname());
            model.addAttribute("boardData", dto);

        }

        return mv;
    }

    @RequestMapping("/userSearch")
    public ModelAndView userSearch(HttpServletRequest request, Model model) {
        System.out.println("===== User Searching =====");

        ModelAndView mv;
        List<SearchDTO> dtos = userSearchCommand.execute(request, model);
        if (null == dtos) {
            model.addAttribute("msg", "검색결과를 불러오지 못했습니다.");
            model.addAttribute("url", "userFind");

            mv = new ModelAndView("alert");
        } else {
            model.addAttribute("userData", dtos);
            mv = new ModelAndView("user/userFind");
        }

        System.out.println("===== Page Loading =====");
        return mv;
    }

    @RequestMapping("/boardSearch")
    public ModelAndView boardSearch(HttpServletRequest request, Model model) {

        ModelAndView mv;
        
        List<ResBoardDTO> dtos = boardSelectCommand.executeR_id(request);
        if (null == dtos) {
            model.addAttribute("msg", "검색결과를 불러오지 못했습니다.");
            model.addAttribute("url", "/mapFind");

            mv = new ModelAndView("alert");
        } else {
            model.addAttribute("postData", dtos);
            mv = new ModelAndView("user/findPost");
        }

        System.out.println("===== Page Loading =====");
        return mv;
    }

    @RequestMapping("/SearchAll")
    public ModelAndView SearchAll(HttpServletRequest request, Model model) {

        ModelAndView mv;

        List<SearchDTO> udtos = userSearchCommand.execute(request, model);
        List<ResBoardDTO> dtos = boardSelectCommand.rnameToContents(request);

        mv = new ModelAndView("user/findAll");
        if (null == udtos) {
            if (null == dtos){
                model.addAttribute("msg", "검색결과를 불러오지 못했습니다.");
                model.addAttribute("url", "/");
                mv = new ModelAndView("alert");
            } else {
                model.addAttribute("postData", dtos);
            }
        } else {
            model.addAttribute("userData", udtos);
            if (null == dtos){
                model.addAttribute("msg", "검색결과를 불러오지 못했습니다.");
                model.addAttribute("url", "/");
            }else {
                model.addAttribute("postData", dtos);
            }
        }

        System.out.println("===== Page Loading =====");
        return mv;
    }

    @RequestMapping("/searchMain")
    public ModelAndView searchMain(HttpServletRequest request, Model model) {

        ModelAndView mv = null;
        List<ResBoardDTO> dtos = boardSelectCommand.rnameToContents(request);
        if (null == dtos) {
            model.addAttribute("msg", "검색결과를 불러오지 못했습니다.");
            model.addAttribute("url", "/");

            mv = new ModelAndView("alert");
        } else {
            model.addAttribute("postData", dtos);
            mv = new ModelAndView("user/findPost");
        }

        System.out.println("===== Page Loading =====");
        return mv;
    }

    @RequestMapping("/pSelect")
    public ModelAndView boardSelect(HttpServletRequest request, Model model) {
        System.out.println("===== Select Board Page =====");

        ModelAndView mv = null;
        ResBoardDTO boardData = boardSelectCommand.execute(request);
        if (boardData == null) {
            model.addAttribute("msg", "게시글을 불러오는데 실패했습니다.");
            model.addAttribute("url", "/");
            mv = new ModelAndView("alert");
        } else {
            mv = new ModelAndView("user/postDetail");
            mv.addObject("boardData", boardData);
        }

        List<ReplyDTO> replyData = replySelectRbIdCommand.execute(request);
        mv.addObject("replyData", replyData);

        return mv;
    }

    @RequestMapping(value = "/mapFind")
    private ModelAndView mapFind(HttpServletRequest request, Model model) {

        System.out.println("===== Select Board Page =====");

        ModelAndView mv = null;
        List<RestaurantDTO> dtos = restaurantListCommand.execute();
        if (null == dtos) {
            model.addAttribute("msg", "게시글을 불러오는데 실패했습니다.");
            model.addAttribute("url", "/");
            mv = new ModelAndView("alert");
        } else {
            mv = new ModelAndView("user/findMap");
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
        ResBoardDTO dto = boardInfoCommand.execute(request);
        if (null == dto) {
            model.addAttribute("msg", "게시글을 불러오는데 실패했습니다.");
            model.addAttribute("url", "/myPage");
            mv = new ModelAndView("alert");
        } else {
            mv = new ModelAndView("/updatePost");
            model.addAttribute("boardData", dto);
        }

        return mv;
    }

    @RequestMapping("/pUpdate")
    public String boarUpdate(HttpServletRequest request, Model model) {
        System.out.println("===== Board Update =====");

        modifyRequest = new ModifiableHttpServletRequest(request);
        modifyRequest.setParameter("searchWord", session.getAttribute("u_nickname").toString());
        modifyRequest.setParameter("rb_uid", session.getAttribute("u_id").toString());
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

    @RequestMapping("/addSub")
    public String addSub(HttpServletRequest request, Model model) {
        System.out.println("===== Add Subscribe =====");
        if (null == session.getAttribute("u_id")){
            model.addAttribute("msg", "로그인후 이용해주세요.");
            model.addAttribute("url", "userPage?uid=" + request.getParameter("s_channel"));
        }else {
            modifyRequest = new ModifiableHttpServletRequest(request);
            modifyRequest.setParameter("s_subscriber", session.getAttribute("u_id").toString());
            request = modifyRequest;
            int result = subInsertCommand.execute(request);
            if (1 == result) {
                model.addAttribute("msg", "구독되었습니다.");
                model.addAttribute("url", "userPage?uid=" + request.getParameter("s_channel"));
            } else {
                model.addAttribute("msg", "오류가 발생했습니다.");
                model.addAttribute("url", "userPage?uid=" + request.getParameter("s_channel"));
            }

        }
        return "alert";
    }

    @RequestMapping("delSub")
    public String delSub(HttpServletRequest request, Model model) {
        System.out.println("===== Delete Subscribe =====");

        modifyRequest = new ModifiableHttpServletRequest(request);
        modifyRequest.setParameter("s_subscriber", session.getAttribute("u_id").toString());
        request = modifyRequest;
        int result = subDeleteCommand.execute(request);
        if (1 == result) {
            model.addAttribute("msg", "구독취소되었습니다.");
            model.addAttribute("url", "userPage?uid=" + request.getParameter("s_channel"));
        } else {
            model.addAttribute("msg", "오류가 발생했습니다.");
            model.addAttribute("url", "userPage?uid=" + request.getParameter("s_channel"));
        }

        return "alert";
    }

    @RequestMapping("channelList")
    public ModelAndView channelList(Model model) {
        System.out.println("===== Channel List =====");

        String s_subscriber = session.getAttribute("u_id").toString();
        System.out.println("User : " + s_subscriber);

        ModelAndView mv = new ModelAndView("test/channelList");
        List<SubscribeDTO> dtos = channelListCommand.execute(s_subscriber);
        model.addAttribute("channelList", dtos);

        return mv;
    }

    @RequestMapping("subList")
    public ModelAndView subList(Model model) {
        System.out.println("===== Subscriber List =====");

        String s_channel = session.getAttribute("u_id").toString();
        System.out.println("Channel : " + s_channel);

        ModelAndView mv = new ModelAndView("test/subList");
        List<SubscribeDTO> dtos = subscriberListCommand.execute(s_channel);
        model.addAttribute("subList", dtos);

        return mv;
    }

    @RequestMapping(value = "/sInfo")
    private ModelAndView sInfo(){
        ModelAndView mv = new ModelAndView("user/subscribeInfo");
        String s_subscriber = session.getAttribute("u_id").toString();
        System.out.println("User : " + s_subscriber);
        List<SubscribeDTO> dtos = channelListCommand.execute(s_subscriber);
        mv.addObject("channelList", dtos);
        return mv;
    }

    @RequestMapping("userPageToName")
    public String userPageToName(HttpServletRequest request, Model model) {
        System.out.println("===== to Name =====");

        UserDTO dto = userInfoCommand.execute(request);
        if (null != dto.getU_id()) {
            model.addAttribute("msg", dto.getU_id());
            model.addAttribute("url", "userPage?uid=" + dto.getU_id());
        } else {
            model.addAttribute("msg", "오류가 발생했습니다.");
            model.addAttribute("url", "sInfo");
        }

        return "alert";
    }

    // Reply Delete
    @RequestMapping("replyDelete")
    public String replyDelete(HttpServletRequest request, Model model) {
        System.out.println("===== Reply Delete =====");

        int result = replyDeleteCommand.execute(request);
        if(1 == result) {
            return "redirect:/pSelect?rb_id=" + request.getParameter("rb_id");
        } else {
            model.addAttribute("msg", "삭제에 실패하였습니다.");
            model.addAttribute("url", "/pSelect?rb_id=" + request.getParameter("rb_id"));
            return "alert";
        }
    }

    // PW Search
    @RequestMapping("pwSearchFunction")
    public String pwSearch(HttpServletRequest request, Model model) {
        System.out.println("===== Password Search =====");

        String u_pw = userPwSearchCommand.execute(request);
        if (null == u_pw) {
            model.addAttribute("msg", "회원 정보를 찾을 수 없습니다.");
            model.addAttribute("url", "pwSearch");
        } else {
            String msg = "회원님의 비밀번호는 " + u_pw + " 입니다.";
            model.addAttribute("msg", msg);
            model.addAttribute("url", "login");
        }

        return "alert";
    }

    @RequestMapping("replyInsert")
    public String replyInsert(HttpServletRequest request) {
        System.out.println("===== Reply Insert =====");

        int result = replyInsertCommand.execute(request);
        if (1 == result) {

            return "redirect:/pSelect?rb_id=" + request.getParameter("rb_id");
        } else {

            return "/";
        }
    }

    @RequestMapping("/csPage")
    private String csPage(Model model) {
    if (session.getAttribute("u_id") == null){
        model.addAttribute("msg", "로그인해주세요.");
        model.addAttribute("url", "login");
        return "alert";
    }else{
        return "user/cs";
    }
    }

    @RequestMapping("qnaInsert")
    public String qnaInsert(HttpServletRequest request, Model model) {
        System.out.println("===== QnA Insert =====");

        int result = qnaInsertCommand.execute(request);
        if (1 == result) {
            model.addAttribute("msg", "문의내용이 접수되었습니다.");
            model.addAttribute("url", "/");
        } else {
            model.addAttribute("msg", "문의 접수에 실패하였습니다.");
            model.addAttribute("url", "csPage");
        }

        return "alert";
    }
}
