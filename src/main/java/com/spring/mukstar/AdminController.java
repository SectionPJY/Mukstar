package com.spring.mukstar;

import com.spring.mukstar.command.admin.QnAListInAdminIndexCommand;
import com.spring.mukstar.command.admin.BoardListInAdminIndexCommand;
import com.spring.mukstar.command.restaurant.RestaurantSearchCommand;
import com.spring.mukstar.command.user.UserSearchCommand;
import com.spring.mukstar.dto.QnADTO;
import com.spring.mukstar.dto.ResBoardDTO;
import com.spring.mukstar.dto.RestaurantDTO;
import com.spring.mukstar.dto.UserDTO;
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
    public String memManage() {
        System.out.println("회원관리");

        return "admin/adminMemManage";
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

        ModelAndView mv = new ModelAndView("");
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

        return mv;
    }
}
