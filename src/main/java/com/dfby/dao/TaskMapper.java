package com.dfby.dao;

import com.dfby.pojo.Task;

import java.util.List;

public interface TaskMapper {
    int deleteByPrimaryKey(Integer tid);

    int insert(Task record);

    int insertSelective(Task record);

    Task selectByPrimaryKey(Integer tid);

    int updateByPrimaryKeySelective(Task record);


    int updateByPrimaryKey(Task record);

    List<Task> selectByEmpid(String empid);

    List<Task> selectBystaffid(String staffid);

    List<Task> selectByUn(String empid);

    List<Task> selectByIng(String empid);

}