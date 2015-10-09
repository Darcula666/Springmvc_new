package com.springapp.mvc.Controller;

import com.springapp.mvc.entity.User;
import com.springapp.mvc.service.UserManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.print.DocFlavor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


/**
 * Created by Administrator on 2015/5/8.
 */
@Controller
@RequestMapping("/user")
@Transactional
public class UserController {
    @Autowired
    private UserManager userManager;


    @RequestMapping("/add")
    public String addUser(User user ,HttpServletRequest request , HttpServletResponse response){
        userManager.add(user);
        System.out.println("添加用户成功");
        return "forward:/user/list";

    }
    @RequestMapping("/list")
    public String listUser(User user ,HttpServletRequest request , HttpServletResponse response){
        List list= userManager.getList();
        request.setAttribute("message",list);
        System.out.println("查询用户成功");
        return "/success";

    }
    @RequestMapping("/del")
    public String del(HttpServletRequest request , HttpServletResponse response,@RequestParam("delid")String sid){
       boolean s= userManager.del(sid);
       if(s){
           System.out.println("删除用户成功");
           return "forward:/user/list";
       }
        System.out.println("删除用户失败");
        return "/add";
    }
    @RequestMapping("/getUser")
    public String  getUser(HttpServletRequest request , HttpServletResponse response,@RequestParam("getid")String sid){
        User user= userManager.getUser(sid);
        request.setAttribute("user",user);
        return "forward:/user/edit";
    }
    @RequestMapping("/edit")
    public String  edit(HttpServletRequest request , HttpServletResponse response){
        User  user=(User)request.getAttribute("user");
        request.setAttribute("user",user);
        return "/add";
    }
    @RequestMapping("/update")
    public String  update(HttpServletRequest request , HttpServletResponse response,User user){
       boolean ss= userManager.updateUser(user);
        if(ss){
            return "forward:/user/list";
        }

        return "forward:/user/list";
    }

}
