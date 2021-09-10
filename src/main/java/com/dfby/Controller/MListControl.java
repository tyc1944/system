package com.dfby.Controller;


import com.dfby.pojo.Task;
import com.dfby.pojo.User;
import com.dfby.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class MListControl {

    @Autowired
    private UserService userService;
    @RequestMapping("/user-list")
    public String list(String flag,Integer page,Integer limit,Model model) {
        if(limit==null){
            limit=5;
        }
        if(page==null){
            page=1;
        }
        PageInfo<User> pageInfo=userService.selectPageInfo2(flag,page,limit);
        model.addAttribute("pageInfo",pageInfo);
        return "user-list";
    }
    @RequestMapping("/userdeleteAll")
    @ResponseBody
    public String list1(String username) {
       // String newsIds=request.getParameter("newsIds");//1,3,5
        if(userService.deleteMany(username)) {
            return "ok";
        }else {
            return "error";
        }
    }
    @RequestMapping("/user-details")
    public String list2(String username,Model model) {
        model.addAttribute("User",userService.selectByPrimaryKey(username));
        return "user-details";
    }



    @RequestMapping("/emp-Dlist")
    public String list9(Integer page,Integer limit, Model model) {
        if(limit==null){
            limit=5;
        }
        if(page==null){
            page=1;
        }
        PageInfo<User> pageInfo=userService.selectPageInfo2("3",page,limit);
        model.addAttribute("pageInfo",pageInfo);
        return "emp-Dlist";
    }

    @RequestMapping("/emp-Ddetails")
    public String list3(String username,Model model) {
        model.addAttribute("Staff",userService.selectByPrimaryKey(username));
        model.addAttribute("Director",userService.selectByDirector());
        return "emp-Ddetails";
    }

    @RequestMapping("/update-emp")
    @ResponseBody
    public String list(User user) {


        if (userService.updateByPrimaryKeySelective(user)>0){
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/add-user")
    @ResponseBody
    public String list4(User user) {
        if (userService.insertSelective(user)>0){
            return "success";
        } else {
            return "error";
        }
    }




}
