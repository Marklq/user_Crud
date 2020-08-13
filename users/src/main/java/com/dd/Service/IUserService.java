package com.dd.Service;

import com.dd.pojo.User;

import java.util.List;

public interface IUserService {

    List<User> findAll();


    void deleteUser(Integer id );

    void addUser(User user);

    User selectById(Integer id);

    void modifyUser(User user);
}
