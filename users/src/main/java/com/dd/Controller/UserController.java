package com.dd.Controller;

import com.dd.Service.impl.UserServiceImpl;
import com.dd.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    private final UserServiceImpl userService;

    @Autowired
    public UserController(UserServiceImpl userService) {
        this.userService = userService;
    }

    @RequestMapping("/hello")
    @ResponseBody
    public String hello() {
        return "hello";
    }

    /**
     * 查询所有
     *
     * @return
     */
    @RequestMapping("/select")
    public ModelAndView selectUser() {
        ModelAndView modelAndView = new ModelAndView();

        List<User> userList = userService.findAll();

        modelAndView.addObject("userList", userList);
        modelAndView.setViewName("userList");

        return modelAndView;

    }

    /**
     * 删除用户
     *
     * @param id
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam(name = "id") Integer id) {

        try {
            userService.deleteUser(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/user/select";
    }

    /**
     * 页面跳转
     *
     * @return
     */
    @RequestMapping("/toAddUser")
    public String toAddUser() {
        return "forward:/WEB-INF/jsp/addUser.jsp";
    }

    /**
     * 添加用户
     *
     * @param user
     * @return
     */
    @RequestMapping("/addUser")
    public String AddUser(User user) {
        //未使用mp，mybatis自动注入时间的策略过于麻烦，直接在controller中new 一个 date

        Date date = new Date();
        user.setCreate_time(date);
        user.setUpdate_time(date);

        try {
            userService.addUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/user/select";
    }

    /**
     * 转发到修改页面
     *
     * @return
     */
    @RequestMapping("/modifyPage")
    public ModelAndView modifyPage(@RequestParam(name = "id") Integer id) {
        ModelAndView modelAndView = new ModelAndView();

        User user = userService.selectById(id);

        modelAndView.addObject("user", user);
        modelAndView.setViewName("modifyUser");
        return modelAndView;

    }


    /**
     * 修改用户信息
     */
    @RequestMapping("/modifyUser")
    public String modifyUser(User user) {
        Date date = new Date();
        user.setUpdate_time(date);

        try {
            userService.modifyUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/user/select";

    }

}
