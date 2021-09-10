package com.dfby.service.impl;

import com.dfby.dao.UserMapper;
import com.dfby.pojo.Plan;
import com.dfby.pojo.User;
import com.dfby.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public int deleteByPrimaryKey(String username){return userMapper.deleteByPrimaryKey(username);}

    @Override
    public int insert(User record){return userMapper.insert(record);}

    @Override
    public int insertSelective(User record){return userMapper.insertSelective(record);}

    @Override
    public User selectByPrimaryKey(String username){return userMapper.selectByPrimaryKey(username);}

    @Override
    public int updateByPrimaryKeySelective(User record){return userMapper.updateByPrimaryKeySelective(record);}

    @Override
    public int updateByPrimaryKey(User record){return userMapper.updateByPrimaryKey(record);}

    @Override
    public User checkLogin(User user) {
        return this.userMapper.checkLogin(user);
    }

    @Override
    public List<User> selectAll(){return userMapper.selectAll();}

    @Override
    public List<User> selectBySuper(User user){return userMapper.selectBySuper(user);}

    @Override
    public boolean deleteMany(String tid) {
        boolean flag=true;
        String[] ids=tid.split(",");
        for(int i=0;i<ids.length;i++) {
            if(userMapper.deleteByPrimaryKey(ids[i])>0){
                flag=true;
            }else{
                flag=false;
            }
        }
        return flag;
    }

    @Override
    public List<User> selectByStaff(String flag){return userMapper.selectByStaff(flag);}


    @Override
    public List<User> selectByDirector(){return userMapper.selectByDirector();}

    @Override
    public User selectByName(String name){return userMapper.selectByName(name);}

    public PageInfo<User> selectPageInfo(User user, Integer page, Integer limit){
        PageHelper.startPage(page,limit);//设置页码和每页记录数
        return new PageInfo<User>(userMapper.selectBySuper(user));
    }

    public PageInfo<User> selectPageInfo2(String flag,Integer page, Integer limit){
        PageHelper.startPage(page,limit);//设置页码和每页记录数
        return new PageInfo<User>(userMapper.selectByStaff(flag));
    }
}
