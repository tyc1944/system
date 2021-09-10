package com.dfby.Controller;

import com.dfby.pojo.Plan;
import com.dfby.pojo.Task;
import com.dfby.pojo.User;
import com.dfby.service.PlanService;
import com.dfby.service.TaskService;
import com.dfby.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class DtaskControl {
    @Autowired
    private TaskService taskService;

    @Autowired
    private PlanService planService;

    @Autowired
    private UserService userService;
    @RequestMapping("/task-list")
    public String list(Model model,Integer page,Integer limit, HttpSession session) {
        User user1=(User)session.getAttribute("User");
        if(limit==null){
            limit=5;
        }
        if(page==null){
            page=1;
        }
        PageInfo<Task> pageInfo=taskService.selectPageInfo(user1.getUsername(),page,limit);
        model.addAttribute("pageInfo",pageInfo);
        return "task-list";
    }

    @RequestMapping("/task-details")
    public String list3(int tid,Model model, HttpSession session) {
        model.addAttribute("Task",taskService.selectByPrimaryKey(tid));
        model.addAttribute("Plan",planService.selectBytaskid(tid));
        return "task-details";
    }

    @RequestMapping("/taskadd")
    @ResponseBody
    public String list4(Task task) {
        int n=taskService.insertSelective(task);
        if(n>0){
            return "ok";
        }else{
            return "error";
        }
    }
    @RequestMapping("/task-add")
    public String list1(Model model, HttpSession session) {
        User user1=(User)session.getAttribute("User");
        model.addAttribute("staff",userService.selectBySuper(user1));
        return "task-add";
    }

    @RequestMapping("/task-update")
    public String list5(Model model,HttpSession session) {
        User user1=(User)session.getAttribute("User");
        model.addAttribute("Task",taskService.selectByUn(user1.getUsername()));
        return "task-update";
    }

    @RequestMapping("/plan-details")
    public String list2(int pid,Model model) {
        model.addAttribute("plan",planService.selectByPrimaryKey(pid));
        return "plan-details";
    }


    @RequestMapping("/taskdeleteAll")
    @ResponseBody
    public String list1(String tid) {
        System.out.println(tid+"~~~~~~~========");
        if(taskService.deleteMany(tid)) {
            return "ok";
        }else {
            return "error";
        }
    }

    @RequestMapping("/task-doupdate")
    public String list(Integer tid,Model model, HttpSession session) {
        User user1=(User)session.getAttribute("User");
        model.addAttribute("staff",userService.selectBySuper(user1));
        model.addAttribute("Task",taskService.selectByPrimaryKey(tid));
        return "task-doupdate";
    }

    @RequestMapping("/taskdoupdate")
    @ResponseBody
    public String list6(Task task) {
        int n = taskService.updateByPrimaryKeySelective(task);
        if (n > 0) {
            return "ok";
        } else {
            return "error";
        }
    }

    @RequestMapping("/task-track")
    public String list7(Model model,Integer page,Integer limit, HttpSession session) {
        User user1=(User)session.getAttribute("User");
        if(limit==null){
            limit=5;
        }
        if(page==null){
            page=1;
        }
        PageInfo<Task> pageInfo=taskService.selectPageInfo2(user1.getUsername(),page,limit);
        model.addAttribute("pageInfo",pageInfo);
        return "task-track";
    }

    @RequestMapping("/task-detailstrack")
    public String list8(int tid,Model model, HttpSession session) {
        User user1=(User)session.getAttribute("User");
        model.addAttribute("Task",taskService.selectByPrimaryKey(tid));
        model.addAttribute("Plan",planService.selectBytaskid(tid));
        return "task-detailstrack";
    }

    @RequestMapping("/taskdetailstrack")
    @ResponseBody
    public String list(Task task) {


        if (taskService.updateByPrimaryKeySelective(task)>=0){
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/emp-list")
    public String list2(Model model,Integer page,Integer limit,HttpSession session) {
        User user1=(User)session.getAttribute("User");
        if(limit==null){
            limit=5;
        }
        if(page==null){
            page=1;
        }
        PageInfo<User> pageInfo=userService.selectPageInfo(user1,page,limit);
        model.addAttribute("pageInfo",pageInfo);
        return "emp-list";
    }

    @RequestMapping("/emp-details")
    public String list3(String username,Model model) {

        model.addAttribute("Staff",userService.selectByPrimaryKey(username));
        return "emp-details";
    }
}
