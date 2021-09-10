package com.dfby.service;

import com.dfby.pojo.Plan;
import com.dfby.pojo.Task;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface PlanService {
    int deleteByPrimaryKey(Integer pid);

    int insert(Plan record);

    int insertSelective(Plan record);

    Plan selectByPrimaryKey(Integer pid);

    int updateByPrimaryKeySelective(Plan record);

    int updateByPrimaryKey(Plan record);

    List<Plan> selectBytaskid(Integer taskid);
    boolean deleteMany(String pid);

    List<Plan> selectByPlan(Plan plan);

    PageInfo<Plan> selectPageInfo(Integer taskid, Integer page, Integer limit);
}
