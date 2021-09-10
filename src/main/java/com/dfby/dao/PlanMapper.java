package com.dfby.dao;

import com.dfby.pojo.Plan;
import com.dfby.pojo.Task;

import java.util.List;

public interface PlanMapper {
    int deleteByPrimaryKey(Integer pid);

    int insert(Plan record);

    int insertSelective(Plan record);

    Plan selectByPrimaryKey(Integer pid);

    int updateByPrimaryKeySelective(Plan record);

    int updateByPrimaryKey(Plan record);

    List<Plan> selectBytaskid(Integer taskid);
    List<Plan> selectByPlan(Plan plan);

    List<Plan> selectByCon(Plan plan);
}