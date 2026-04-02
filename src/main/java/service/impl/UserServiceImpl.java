package service.impl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import org.springframework.stereotype.Service;
import service.UserService;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Override
    public List<User> findAll() {
        return List.of();
    }

    @Override
    public UserDto findById(long id) {
        return null;
    }

    @Override
    public UserDto findByUserName(String username) {
        return null;
    }

    @Override
    public UserDto update(UserDto userdto) {
        return null;
    }

    @Override
    public void deleteById(long id) {

    }
}
