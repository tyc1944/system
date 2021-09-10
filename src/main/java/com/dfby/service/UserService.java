package com.dfby.service;

import com.dfby.pojo.Task;
import com.dfby.pojo.User;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface UserService {
    int deleteByPrimaryKey(String username);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String username);

    int updateByPrimaryKeySelective(User record);


    int updateByPrimaryKey(User record);

    User checkLogin(User var1);

    List<User> selectAll();

    List<User> selectBySuper(User user);

    boolean deleteMany(String username);

    List<User> selectByStaff(String flag);

    List<User> selectByDirector();

    User selectByName(String name);

    PageInfo<User> selectPageInfo(User user, Integer page, Integer limit);

    PageInfo<User> selectPageInfo2(String flag,Integer page, Integer limit);

}
