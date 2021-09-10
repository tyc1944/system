package com.dfby.dao;

import com.dfby.pojo.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(String username);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String username);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User checkLogin(User var1);

    List<User> selectAll();

    List<User> selectBySuper(User user);

    List<User> selectByStaff(String flag);

    List<User> selectByDirector();

    User selectByName(String name);


}