package com.springapp.mvc.Controller;

import com.springapp.mvc.entity.User;
import com.springapp.mvc.service.UserManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * Created by Administrator on 2015/5/8.
 */
@SessionAttributes(value = {"user"},types = {String.class})
@Controller
@RequestMapping("/user")
@Transactional
public class UserController {
    @Autowired
    private UserManager userManager;


    @RequestMapping("/add")
    public String addUser(User user, HttpServletRequest request, HttpServletResponse response) {
        userManager.add(user);
        System.out.println("添加用户成功");
        return "forward:/user/list";

    }

    @RequestMapping("/list")
    public String listUser(User user, HttpServletRequest request, HttpServletResponse response) {
        List list = userManager.getList();
        request.setAttribute("message", list);
        System.out.println("查询用户成功");
        return "/success";

    }

    @RequestMapping("/del")
    public String del(HttpServletRequest request, HttpServletResponse response, @RequestParam("delid") String sid) {
        boolean s = userManager.del(sid);
        if (s) {
            System.out.println("删除用户成功");
            return "forward:/user/list";
        }
        System.out.println("删除用户失败");
        return "/add";
    }

    @RequestMapping("/getUser")
    public String getUser(HttpServletRequest request, HttpServletResponse response, @RequestParam("getid") String sid) {
        User user = userManager.getUser(sid);
        request.setAttribute("user", user);
        return "forward:/user/edit";
    }

    @RequestMapping("/edit")
    public String edit(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getAttribute("user");
        request.setAttribute("user", user);
        return "/add";
    }

    @RequestMapping("/update")
    public String update(HttpServletRequest request, HttpServletResponse response, User user) {
        boolean ss = userManager.updateUser(user);
        if (ss) {
            return "forward:/user/list";
        }

        return "forward:/user/list";
    }

    /**
     * 常用：使用method属性来指定请求方式
     */
    @RequestMapping(value = "/testMethod", method = RequestMethod.POST)
    public String testMethod() {
        System.out.println("testMethod");
        return "ok";
    }

    /**
     * init页面
     */
    @RequestMapping(value = "/init")
    public String init() {
        System.out.println("init");
        return "init";
    }

    /**
     * testParamsAndHeaders
     */
    @RequestMapping(value = "/testParamsAndHeaders", params = {"username", "age!=10"})
    public String testParamsAndHeaders() {
        System.out.println("testParamsAndHeaders");
        return "ok";
    }

    /**
     * testParamsAndHeaders
     */
    @RequestMapping(value = "/testAntPath/*/abc")
    public String testAntPath() {
        System.out.println("testAntPath");
        return "ok";
    }

    /**
     * testPathVariable
     */
    @RequestMapping(value = "/testPathVariable/{id}")
    public String testPathVariable(@PathVariable("id") Integer id) {
        System.out.println("testPathVariable" + id);
        return "ok";
    }

    /**
     * testRest get
     * <p/>
     * Rest 风格的URL。
     * 以CRUD为例：
     * 新增：/order POST
     * 修改：/order PUT   update?id=1
     * 获取：/order GET   get?id=1
     * 删除：/order DELETE   delete?id=1
     * 如何发送PUT和DELETE请求？
     * 1. 需要配置HiddenHttpMethodFilter
     * 2.需要发送POST请求
     * 3.需要发送POST请求是需要携带一个"name=_method"的隐藏域，值为DELETE或PUT
     * <p/>
     * 在springMVC的目标方法中如何得到id呢
     * 使用@PathVariable注解
     */
    @RequestMapping(value = "/testRest/{id}", method = RequestMethod.GET)
    public String testRest(@PathVariable("id") Integer id) {
        System.out.println("testRest Get:" + id);
        return "ok";
    }

    /**
     * testRest post
     */
    @RequestMapping(value = "/testRest", method = RequestMethod.POST)
    public String testRest() {
        System.out.println("testRest Post");
        return "ok";
    }

    /**
     * testRest delete
     */
    @RequestMapping(value = "/testRest/{id}", method = RequestMethod.DELETE)
    public String testRestDelete(@PathVariable("id") Integer id) {
        System.out.println("testRest Delete" + id);
        return "ok";
    }

    /**
     * testRest put
     */
    @RequestMapping(value = "/testRest/{id}", method = RequestMethod.PUT)
    public String testRestPut(@PathVariable("id") Integer id) {
        System.out.println("testRest Put" + id);
        return "ok";
    }

    @RequestMapping(value = "/testRequestParam")
    public String testRequestParam(@RequestParam(value = "username") String username, @RequestParam(value = "age", required = false, defaultValue = "0") Integer age) {
        System.out.println(username + "  " + age);
        return "ok";
    }

    /**
     * 目标方法的返回值可以是ModelAndView类型
     * 其中可以包含视图和模型信息
     * SpringMVC会把ModelAndView的model中的数据放入request域对象中。
     *
     * @return
     */
    @RequestMapping("/testModelAndView")
    public ModelAndView testModelAndView() {
        String viewName = "ok";
        ModelAndView modelAndView = new ModelAndView(viewName);
        //添加模型数据到modelAndView中
        modelAndView.addObject("time", new Date());
        return modelAndView;
    }

    @RequestMapping("/testMap")
    public String testMap(Map<String, Object> map) {
        map.put("names", Arrays.asList("tom", "jock"));

        return "ok";
    }

    @RequestMapping("/testSessionAttributes")
    public String testSessionAttributes(Map<String ,Object> map) {
        User user = new User();
        user.setId("45");
        user.setUsername("xiaotian");
        user.setPassword("4564");
        map.put("user" ,user);
        map.put("school","kmxy");
        return "ok";
    }
}
