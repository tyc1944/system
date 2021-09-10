package com.dfby.service.impl;

import com.dfby.dao.PlanMapper;
import com.dfby.pojo.Plan;
import com.dfby.pojo.Task;
import com.dfby.service.PlanService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlanServiceImpl implements PlanService {
    @Autowired
    private PlanMapper planMapper;
    @Override
    public int deleteByPrimaryKey(Integer pid){return planMapper.deleteByPrimaryKey(pid);}

    @Override
    public int insert(Plan record){return planMapper.insert(record);}

    @Override
    public int insertSelective(Plan record){return planMapper.insertSelective(record);}

    @Override
    public Plan selectByPrimaryKey(Integer pid){return planMapper.selectByPrimaryKey(pid);}

    @Override
    public int updateByPrimaryKeySelective(Plan record){return planMapper.updateByPrimaryKeySelective(record);}

    @Override
    public int updateByPrimaryKey(Plan record){return planMapper.updateByPrimaryKey(record);}

    @Override
    public List<Plan> selectBytaskid(Integer taskid){return planMapper.selectBytaskid(taskid);}

    @Override
    public boolean deleteMany(String pid) {
        boolean flag=true;
        String[] ids=pid.split(",");
        for(int i=0;i<ids.length;i++) {
            int a=Integer.parseInt(ids[i]);
            if(planMapper.deleteByPrimaryKey(a)>0){
                flag=true;
            }else{
                flag=false;
            }
        }
        return flag;
    }

    @Override
    public List<Plan> selectByPlan(Plan plan){return planMapper.selectByPlan(plan);}

    public PageInfo<Plan> selectPageInfo(Integer taskid, Integer page, Integer limit){
        PageHelper.startPage(page,limit);//设置页码和每页记录数
        return new PageInfo<Plan>(planMapper.selectBytaskid(taskid));
    }

}
