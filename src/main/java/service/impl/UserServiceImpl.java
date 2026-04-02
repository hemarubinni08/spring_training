package service.impl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import org.springframework.stereotype.Service;
import service.UserService;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private UserRepository userrepository;

    @Override
    public List<User> findAll() {
        return userrepository.findAll();
    }

    @Override
    public UserDto findById(long id) {
        return userrepository.findById();

    }

    @Override
    public UserDto findByUserName(String username) {
        return userrepository.findByUsername();
    }

    @Override
    public UserDto update(UserDto userdto) {
        User presentuser=userrepository.findById(userdto.getId())
    }

    @Override
    public void deletedById(long id) {
        userrepository.deleteById();
    }
}
