package com.springapp.mvc.service;

import com.springapp.mvc.dao.UserDao;
import com.springapp.mvc.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2015/5/8.
 */
@Service
public class UserManager {

    private UserDao userDao;

    public UserDao getUserDao() {
        return userDao;
    }

    @Resource
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public void add(User user) {
        userDao.addUser(user);
    }

    public List<User> getList() {
        return userDao.getAllUser();
    }

    public boolean  del(String id) {


       return userDao.del(id);


    }
    public User getUser(String id) {


        return userDao.getUser(id);


    }
    public User editUser(String id) {


        return userDao.editUser(id);


    }
    public boolean  updateUser(User user) {


       return userDao.updateUser(user);


    }
}
