package com.springapp.mvc.dao;

import com.springapp.mvc.entity.User;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by Administrator on 2015/5/8.
 */
@Component
@Transactional
public class UserDao{
    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addUser(User user) {

        sessionFactory.getCurrentSession().save(user);
    }
    public List<User> getAllUser() {
       String hlq="from User";
        Query query=sessionFactory.getCurrentSession().createQuery(hlq);
        sessionFactory.getCurrentSession();
        return query.list();
    }
    public boolean del(String id) {
        String hql="delete User u where u.id=?";
        Query query=sessionFactory.getCurrentSession().createQuery(hql).setString(0,id);
        return query.executeUpdate()>0;
    }
    public User getUser(String id) {
        String hql="from User u where u.id=?";
        Query query=sessionFactory.getCurrentSession().createQuery(hql).setString(0,id);
        return (User)query.uniqueResult();
    }
    public User editUser(String id) {
        String hql="from User u where u.id=?";
        Query query=sessionFactory.getCurrentSession().createQuery(hql).setString(0,id);
        return (User)query.uniqueResult();
    }
    public boolean updateUser(User user) {
        String hql="update User  u set u.username=?,u.password=? where u.id=?";
        Query query=sessionFactory.getCurrentSession().createQuery(hql).setString(0,user.getUsername()).setString(1,user.getPassword()).setString(2,user.getId());
        return query.executeUpdate()>0;
    }
}
