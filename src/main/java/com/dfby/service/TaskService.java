package com.dfby.service;

import com.dfby.pojo.Plan;
import com.dfby.pojo.Task;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface TaskService {
    int deleteByPrimaryKey(Integer tid);

    int insert(Task record);

    int insertSelective(Task record);

    Task selectByPrimaryKey(Integer tid);

    int updateByPrimaryKeySelective(Task record);


    int updateByPrimaryKey(Task record);

    List<Task> selectByEmpid(String empid);

    List<Task> selectBystaffid(String staffid);

    List<Task> selectByUn(String empid);


    boolean deleteMany(String tid);

    List<Task> selectByIng(String empid);

    PageInfo<Task> selectPageInfo(String username, Integer page, Integer limit);

    PageInfo<Task> selectPageInfo2(String username, Integer page, Integer limit);

    PageInfo<Task> selectPageInfo3(String username, Integer page, Integer limit);
}
