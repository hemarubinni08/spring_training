package service.impl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import org.modelmapper.ModelMapper;
import org.springframework.boot.webmvc.autoconfigure.WebMvcProperties;
import org.springframework.stereotype.Service;
import service.UserService;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    private UserRepository userrepository;
private ModelMapper modelMapper;
    @Override
    public List<User> findAll() {
        return userrepository.findAll();
    }

    @Override
    public UserDto findById(long id) {
        Optional<User> user= userrepository.findById(id);
      return  modelMapper.map(user, UserDto.class);

    }

    @Override
    public UserDto findByUserName(String username) {
        Optional<User> user = Optional.ofNullable(userrepository.findByUsername(username));
        return modelMapper.map(user,UserDto.class);
    }

    @Override
    public UserDto update(UserDto userdto,Long id) {
        User presentuser=userrepository.findById(userdto.getId())
    }

    @Override
    public void deletedById(long id) {
        userrepository.deleteById();
    }
}
