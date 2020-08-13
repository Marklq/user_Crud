package com.dd.Service.impl;

import com.dd.Service.IUserService;
import com.dd.dao.UserDao;
import com.dd.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {


    private UserDao userDao;

    @Autowired
    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    public UserServiceImpl() {

    }

    //查询用户
    @Override
    public List<User> findAll() {

        return userDao.findAll();
    }

    //删除用户
    @Override
    public void deleteUser(Integer id) {
      userDao.deleteUser(id);
    }

    //新增用户
    public void addUser(User user) {
        userDao.addUser(user);
    }

    //根据id进行查询
    @Override
    public User selectById(Integer id) {
        return userDao.findById(id);
    }

    @Override
    public void modifyUser(User user) {
        userDao.modifyUser(user);
    }
}
