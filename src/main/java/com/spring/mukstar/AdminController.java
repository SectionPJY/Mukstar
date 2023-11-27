package com.spring.mukstar;

import com.spring.mukstar.command.admin.QnAListInAdminIndexCommand;
import com.spring.mukstar.command.admin.BoardListInAdminIndexCommand;
import com.spring.mukstar.command.qna.QnAListCommand;
import com.spring.mukstar.command.qna.QnASelectCommand;
import com.spring.mukstar.command.reply.ReplySearchCommand;
import com.spring.mukstar.command.reply.ReplySelectCommand;
import com.spring.mukstar.command.reply.ReplySelectRidCommand;
import com.spring.mukstar.command.resboard.BoardListCommand;
import com.spring.mukstar.command.resboard.BoardSearchCommand;
import com.spring.mukstar.command.resboard.BoardSelectCommand;
import com.spring.mukstar.command.restaurant.RestaurantListCommand;
import com.spring.mukstar.command.restaurant.RestaurantSearchCommand;
import com.spring.mukstar.command.restaurant.RestaurantSelectCommand;
import com.spring.mukstar.command.subscribe.ChannelListCommand;
import com.spring.mukstar.command.subscribe.SubscriberListCommand;
import com.spring.mukstar.command.user.UserListCommand;
import com.spring.mukstar.command.user.UserSearchCommand;
import com.spring.mukstar.command.user.UserInfoCommand;
import com.spring.mukstar.command.user.UserSelectCommand;
import com.spring.mukstar.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private BoardListInAdminIndexCommand boardListInAdminIndexCommand;
    @Autowired
    private QnAListInAdminIndexCommand qnAListInAdminIndexCommand;
    @Autowired
    private UserSearchCommand userSearchCommand;
    @Autowired
    private RestaurantSearchCommand restaurantSearchCommand;
    @Autowired
    private BoardSearchCommand boardSearchCommand;
    @Autowired
    private ReplySearchCommand replySearchCommand;
    @Autowired
    private UserListCommand userListCommand;
    @Autowired
    private UserSelectCommand userSelectCommand;
    @Autowired
    private BoardListCommand boardListCommand;
    @Autowired
    private BoardSelectCommand boardSelectCommand;
    @Autowired
    private ReplySelectCommand replySelectCommand;
    @Autowired
    private ChannelListCommand channelListCommand;
    @Autowired
    private SubscriberListCommand subscriberListCommand;
    @Autowired
    private RestaurantListCommand restaurantListCommand;
    @Autowired
    private RestaurantSelectCommand restaurantSelectCommand;
    @Autowired
    private QnAListCommand qnAListCommand;
    @Autowired
    private QnASelectCommand qnaSelectCommand;
    @Autowired
    private ReplySelectRidCommand replySelectRidCommand;


    @RequestMapping("/index")
    public ModelAndView index() {
        System.out.println("시작페이지");
        ModelAndView mv = new ModelAndView("admin/adminIndex");

        // 최근 게시물
        System.out.println("===== Recent Posts =====");
        List<ResBoardDTO> boardData = boardListInAdminIndexCommand.execute();
        if (boardData.isEmpty() || boardData == null) {
            mv.setViewName("admin/admin404page");
        } else {
            mv.addObject("boardList", boardData);
        }

        // 최근 문의
        System.out.println("===== Recent QnA =====");
        List<QnADTO> qnaData = qnAListInAdminIndexCommand.execute();
        if (qnaData.isEmpty() || qnaData == null) {
            mv.setViewName("admin/admin404page");
        } else {
            mv.addObject("qnaList", qnaData);
        }

        return mv;
    }

    @RequestMapping("/memManage")
    public ModelAndView memManage() {
        System.out.println("회원관리");

        ModelAndView mv = new ModelAndView("admin/adminMemManage");
        List<UserDTO> userData = userListCommand.execute();
        if (userData.isEmpty() || null == userData) {
            mv.setViewName("admin/admin404Page");
        } else {
            mv.addObject("userData", userData);
        }

        return mv;
    }

    @RequestMapping("/userSelect")
    public ModelAndView userSelect(HttpServletRequest request) {
        System.out.println("===== User Select =====");

        ModelAndView mv = new ModelAndView("admin/adminMemManage2");

        // 유저 정보
        List<UserDTO> userData = userSelectCommand.execute(request);
        mv.addObject("userData", userData);

        // 작성한 게시글
        List<ResBoardDTO> boardData = boardListCommand.executeAdmin(request);
        mv.addObject("boardData", boardData);

        // 작성한 댓글
        List<ReplyDTO> replyData = replySelectCommand.execute(request);
        mv.addObject("replyData", replyData);

        // 구독한 유저 목록
        List<SubscribeDTO> channelData = channelListCommand.execute(request);
        mv.addObject("channelData", channelData);

        // 구독자 목록
        List<SubscribeDTO> subscriberData = subscriberListCommand.execute(request);
        mv.addObject("subData", subscriberData);

        // 응대 목록
        List<QnADTO> qnaData = qnAListCommand.executeUid(request);
        mv.addObject("qnaData", qnaData);

        return mv;
    }

    @RequestMapping("/boardSelect")
    public ModelAndView boardSelect(HttpServletRequest request) {
        System.out.println("===== Board Select =====");

        ModelAndView mv = new ModelAndView("admin/adminPostDetail");
        List<ResBoardDTO> boardData = boardSelectCommand.executeAdmin(request);
        if (boardData.isEmpty()) {
            mv.setViewName("admin/admin404Page");
        } else {
            mv.addObject("boardData", boardData);
        }

        return mv;
    }

    @RequestMapping("/response")
    public String response() {
        System.out.println("응대로그");

        return "admin/adminResponLog";
    }

    @RequestMapping("/shopManage")
    public ModelAndView shopManage() {
        System.out.println("가게관리");
        ModelAndView mv = new ModelAndView("admin/adminShopManage");

        List<RestaurantDTO> boardData = restaurantListCommand.execute();
        mv.addObject("boardData", boardData);

        return mv;
    }

    @RequestMapping("/shopSelect")
    public ModelAndView shopSelect(HttpServletRequest request) {
        System.out.println("===== Post Select =====");

        ModelAndView mv = new ModelAndView("admin/adminShopDe");

        // 작성한 게시글
        List<RestaurantDTO> boardData = restaurantSelectCommand.execute(request);
        List<ResBoardDTO> resData = boardSelectCommand.executeR_id(request);
        mv.addObject("boardData", boardData);
        mv.addObject("resData", resData);

        return mv;
    }

    @RequestMapping("/postManage")
    public ModelAndView postManage() {
        System.out.println("게시글관리");
        ModelAndView mv = new ModelAndView("admin/adminPostManage");

        List<ResBoardDTO> boardData = boardListInAdminIndexCommand.execute();
        mv.addObject("boardData", boardData);

        return mv;
    }

    @RequestMapping("/postSelect")
    public ModelAndView postSelect(HttpServletRequest request) {
        System.out.println("===== Post Select =====");

        ModelAndView mv = new ModelAndView("admin/adminPostManageDe");

        // 작성한 게시글
        List<ResBoardDTO> boardData = boardSelectCommand.executeAdmin(request);
        mv.addObject("boardData", boardData);

        return mv;
    }

    @RequestMapping("/customerManage")
    public String customerManage() {
        System.out.println("게시글관리");

        return "admin/adminCusManage";
    }

    @RequestMapping("/search")
    public ModelAndView search(HttpServletRequest request) {
        System.out.println("통합검색");

        ModelAndView mv = new ModelAndView("test/searchTest");
        // 유저 검색
        List<UserDTO> userData = userSearchCommand.execute(request);
        mv.addObject("userData", userData);

        // 가게 검색
        List<RestaurantDTO> resData = restaurantSearchCommand.execute(request);
        mv.addObject("resData", resData);

        // 게시글 검색
        List<ResBoardDTO> boardData = boardSearchCommand.execute(request);
        mv.addObject("boardData", boardData);


        // 댓글 검색
        List<ReplyDTO> replyData = replySearchCommand.execute(request);
        mv.addObject("replyData", replyData);


        return mv;
    }

    @RequestMapping("/adminModalRespon")
    public ModelAndView adminModalRespon(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("admin/adminModalRespon");
        List<QnADTO> qnaData = qnaSelectCommand.execute(request);
        mv.addObject("qnaData", qnaData);
        return mv;
    }

    @RequestMapping("/adminModalReplie")
    public ModelAndView adminModalReplie(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("admin/adminModalReplie");

        List<ReplyDTO> replyData = replySelectRidCommand.execute(request);
        mv.addObject("replyData", replyData);
        return mv;
    }

}
