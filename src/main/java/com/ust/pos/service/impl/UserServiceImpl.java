package com.ust.pos.service.impl;


import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository userrepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public boolean updateUserDetailsById(UserDto userDto) {
        if (existsByEmail(userDto.getEmail())) {
            return false;
        } else {
            User updated = modelMapper.map(userDto, User.class);
            updated.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userrepository.save(updated);
            return true;
        }
    }

    @Override
    public boolean existsByEmail(String email) {
        return userrepository.existsByEmail(email);
    }

    @Override
    public boolean createUserJdbc(UserDto userDto) {
        User user = userDao.findUserByEmailJdbc(userDto.getEmail());
        if (user == null) {
            userDao.createUserJdbc(userDto);
            return true;
        } else {
            return false;
        }
    }
}


