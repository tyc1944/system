package com.dfby.service.impl;

import com.dfby.dao.TaskMapper;
import com.dfby.pojo.Task;
import com.dfby.pojo.User;
import com.dfby.service.TaskService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {
    @Autowired
    private TaskMapper taskMapper;
    @Override
    public int deleteByPrimaryKey(Integer tid){return taskMapper.deleteByPrimaryKey(tid);}

    @Override
    public int insert(Task record){return taskMapper.insert(record);}

    @Override
    public int insertSelective(Task record){return taskMapper.insertSelective(record);}

    @Override
    public Task selectByPrimaryKey(Integer tid){return taskMapper.selectByPrimaryKey(tid);}

    @Override
    public int updateByPrimaryKeySelective(Task record){return taskMapper.updateByPrimaryKeySelective(record);}

    @Override
    public int updateByPrimaryKey(Task record){return taskMapper.updateByPrimaryKey(record);}

    @Override
    public List<Task> selectByEmpid(String empid){return taskMapper.selectByEmpid(empid);}

    @Override
    public List<Task> selectBystaffid(String staffid){return taskMapper.selectBystaffid(staffid);}

    @Override
    public List<Task> selectByUn(String empid){return taskMapper.selectByUn(empid);}

    @Override
    public List<Task> selectByIng(String empid){return taskMapper.selectByIng(empid);}

    @Override
    public boolean deleteMany(String tid) {
        boolean flag=true;
        String[] ids=tid.split(",");
        System.out.println(tid+"-----");
        for(int i=0;i<ids.length;i++) {
            int a=Integer.parseInt(ids[i]);
            if(taskMapper.deleteByPrimaryKey(a)>0){
                flag=true;
            }else{
                flag=false;
            }
        }
        return flag;
    }

    public PageInfo<Task> selectPageInfo(String username, Integer page, Integer limit){
        PageHelper.startPage(page,limit);//设置页码和每页记录数
        return new PageInfo<Task>(taskMapper.selectByEmpid(username));
    }

    public PageInfo<Task> selectPageInfo2(String username, Integer page, Integer limit){
        PageHelper.startPage(page,limit);//设置页码和每页记录数
        return new PageInfo<Task>(taskMapper.selectByIng(username));
    }

    public PageInfo<Task> selectPageInfo3(String username, Integer page, Integer limit){
        PageHelper.startPage(page,limit);//设置页码和每页记录数
        return new PageInfo<Task>(taskMapper.selectBystaffid(username));
    }
}
