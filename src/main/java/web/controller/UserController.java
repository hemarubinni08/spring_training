package web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import service.impl.UserServiceImpl;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserServiceImpl userService;

    @RequestMapping("/allusers")
    public List<User> getAllUsers() {
        return userService.findAll();
    }

    @RequestMapping("/findid")
    public UserDto getById(@PathVariable Long id) {
        return userService.findById();
    }

    @RequestMapping("/username")
    public UserDto getByUserName(@PathVariable String username) {
        return userService.findByUserName();
    }

    @RequestMapping("/update")
    public UserDto updateUser(UserDto, @PathVariable Long id) {
        return userService.update();
    }

    @RequestMapping("/delete")
    public void deleteUser(@PathVariable Long id) {
        userService.deletedById();
    }
}
