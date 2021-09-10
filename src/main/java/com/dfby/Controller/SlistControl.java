package com.dfby.Controller;

import com.dfby.pojo.Plan;
import com.dfby.pojo.Task;
import com.dfby.pojo.User;
import com.dfby.service.PlanService;
import com.dfby.service.TaskService;
import com.dfby.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SlistControl {
    @Autowired
    private TaskService taskService;

    @Autowired
    private PlanService planService;

    @Autowired
    private UserService userService;

    @RequestMapping("/task-mlist")
    public String list(Model model,Integer page,Integer limit,HttpSession session) {
        User user1 = (User) session.getAttribute("User");
        if(limit==null){
            limit=5;
        }
        if(page==null){
            page=1;
        }
        PageInfo<Task> pageInfo=taskService.selectPageInfo3(user1.getUsername(),page,limit);
        model.addAttribute("pageInfo", pageInfo);
        return "task-mlist";
    }

    @RequestMapping("/task-mdetails")
    public String list3(int tid,Integer page,Integer limit, Model model, HttpSession session) {
        if(limit==null){
            limit=5;
        }
        if(page==null){
            page=1;
        }
        PageInfo<Plan> pageInfo=planService.selectPageInfo(tid,page,limit);
        model.addAttribute("Task", taskService.selectByPrimaryKey(tid));
        model.addAttribute("pageInfo", pageInfo);
        return "task-mdetails";
    }

    @RequestMapping("/plan-add")
    public String list4(int taskid, Model model, HttpSession session) {
        model.addAttribute("tid", taskid);
        return "plan-add";
    }

    @RequestMapping("/planadd")
    @ResponseBody
    public String list4(Plan plan) {
        int n = planService.insertSelective(plan);
        if (n > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/taskmdeleteAll")
    @ResponseBody
    public String list1(@PathVariable("pid") String pid) {
        // String newsIds=request.getParameter("newsIds");//1,3,5
        if (planService.deleteMany(pid)) {
            return "ok";
        } else {
            return "error";
        }
    }

    @RequestMapping("/plan-update")
    public String list5(int pid, Model model) {
        model.addAttribute("plan", planService.selectByPrimaryKey(pid));
        return "plan-update";
    }

    @RequestMapping("/planupdate")
    @ResponseBody
    public String list5(Plan plan) {
        int n = planService.updateByPrimaryKeySelective(plan);
        if (n > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/plan-list")
    public String  list6(Model model, HttpSession session) {
        User user1=(User)session.getAttribute("User");
        List<Task> taskList=taskService.selectBystaffid(user1.getUsername());
        List<Plan> planList=new ArrayList<>();
        for(Task task:taskList) {
            for(Plan plan:planService.selectBytaskid(task.getTid())){
                planList.add(plan);
            }

        }
        model.addAttribute("Task",taskList);
        model.addAttribute("Plan",planList);
        return "plan-list";
    }

    @RequestMapping("/planlist")
    public String list6(Plan plan,Model model,HttpSession session) {
        User user1 = (User) session.getAttribute("User");
        List<Task> taskList = taskService.selectBystaffid(user1.getUsername());
        List<Plan> planList = new ArrayList<>();
        if (plan != null) {
           planList = planService.selectByPlan(plan);
        } else {
            for (Task task : taskList) {
                for (Plan plan1 : planService.selectBytaskid(task.getTid())) {
                    planList.add(plan1);
                }
            }
        }
        Map<String,Object> map=new HashMap<>();
        model.addAttribute("Task",taskList);
        model.addAttribute("Plan",planList);
        return "plan-list";

    }
}
