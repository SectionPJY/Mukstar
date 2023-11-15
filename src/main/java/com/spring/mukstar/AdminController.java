package com.spring.mukstar;

import com.spring.mukstar.command.admin.QnAListInAdminIndexCommand;
import com.spring.mukstar.command.admin.BoardListInAdminIndexCommand;
import com.spring.mukstar.command.reply.ReplySearchCommand;
import com.spring.mukstar.command.resboard.BoardListCommand;
import com.spring.mukstar.command.resboard.BoardSearchCommand;
import com.spring.mukstar.command.restaurant.RestaurantSearchCommand;
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
        if (userData.isEmpty() || null == userData) {
            mv.setViewName("admin/admin404Page");
        } else {
            mv.addObject("userData", userData);
        }

        // 작성한 게시글
        List<ResBoardDTO> boardData = boardListCommand.executeAdmin(request);
        if (boardData.isEmpty() || null == boardData) {
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
    public String shopManage() {
        System.out.println("가게관리");

        return "admin/adminShopManage";
    }

    @RequestMapping("/postManage")
    public String postManage() {
        System.out.println("게시글관리");

        return "admin/adminPostManage";
    }

    @RequestMapping("/search")
    public ModelAndView search(HttpServletRequest request) {
        System.out.println("통합검색");

        ModelAndView mv = new ModelAndView("test/searchTest");
        // 유저 검색
        List<UserDTO> userData = userSearchCommand.execute(request);
        if (userData.isEmpty() || userData == null) {
            mv.setViewName("admin/admin404Page");
        } else {
            mv.addObject("userData", userData);
        }

        // 가게 검색
        List<RestaurantDTO> resData = restaurantSearchCommand.execute(request);
        if (resData.isEmpty() || resData == null) {
            mv.setViewName("admin/admin404Page");
        } else {
            mv.addObject("resData", resData);
        }

        // 게시글 검색
        List<ResBoardDTO> boardData = boardSearchCommand.execute(request);
        if (boardData.isEmpty() || boardData == null) {
            mv.setViewName("admin/admin404Page");
        } else {
            mv.addObject("boardData", boardData);
        }

        // 댓글 검색
        List<ReplyDTO> replyData = replySearchCommand.execute(request);
        if (replyData.isEmpty() || replyData == null) {
            mv.setViewName("admin/admin404Page");
        } else {
            mv.addObject("replyData", replyData);
        }

        return mv;
    }
}
