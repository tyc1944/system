package com.dfby.Controller;

import com.dfby.pojo.User;
import com.dfby.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class LoginControl {

    @Autowired
    private UserService userService;
    @RequestMapping("/login")
    @ResponseBody
    public String list(User user, HttpSession httpSession) {

        User user1 = userService.checkLogin(user);
        if (user1 != null) {
            httpSession.setAttribute("User", user1);
            return "ok";
        } else {
            return "error";
        }
    }

    @RequestMapping("/logOut")
    public String logOut(HttpSession session){
        session.removeAttribute("User");
        return "login";
    }
}
