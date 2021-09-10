package com.dfby.Controller;


import com.dfby.pojo.User;
import com.dfby.service.PlanService;
import com.dfby.service.TaskService;
import com.dfby.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class IndexControl {
    @Autowired
    private UserService userService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private PlanService planService;

    @RequestMapping("/index")
    public String list(Model model, HttpSession session) {
        User user1 = (User) session.getAttribute("User");
        if(user1==null){
            return "login";
        } else {
            if (user1.getFlag().equals("1")) {
                return "Mmain";
            } else if (user1.getFlag().equals("2")) {
                return "Dmain";
            } else{
                return "main";
            }
        }
    }
}
