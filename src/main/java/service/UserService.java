package service;


import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserService {
    List<User> findAll();

    UserDto findById(long id);

    UserDto findByUserName(String username);

    UserDto update(UserDto userdto);

    void deletedById(long id);
}
