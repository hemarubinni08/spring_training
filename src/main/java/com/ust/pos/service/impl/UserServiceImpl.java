package com.ust.pos.service.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    UserDao userDao;
    @Autowired
    JdbcTemplate jdbcTemplate;
    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean registration(UserDto userDto) {
        if (userDao.existsByEmail(userDto.getEmail())) {
            userDao.createUser(userDto);
            return true;
        } else {
            return false;
        }
    }

    public boolean createUser(UserDto userDto) {
        boolean user = userRepository.existsByEmail(userDto.getEmail());

        if (user) {
            User user2 = modelMapper.map(userDto, User.class);
            user2.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(user2);
            return true;
        } else {
            return false;
        }
    }

    public boolean createUserJdbc(UserDto userDto) {
        if (userDao.existsByEmail(userDto.getEmail())) {
            boolean success = userDao.createUser(userDto);
            userDto.setSuccess(success);
            return true;

        }
        return false;
    }

}




