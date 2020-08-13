package com.dd.dao;

import com.dd.pojo.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {

    @Select("select * from user")
    List<User> findAll();

    @Delete("delete from user where id = #{id}")
    void deleteUser(Integer id);

    @Insert("insert into user (mobile,password,sex,birthdate,address,email,state,create_time,update_time)" +
            " values (#{mobile},#{password},#{sex},#{birthdate},#{address},#{email},#{state},#{create_time},#{update_time})")
    void addUser(User user);

    @Select("select * from user where id = #{id}")
    User findById(Integer id);

    @Update("update user set mobile=#{mobile},password=#{password},sex=#{sex},birthdate=#{birthdate},address=#{address}," +
            "email=#{email},state=#{state},update_time=#{update_time}" +
            "where id=#{id}")
    void modifyUser(User user);
}
