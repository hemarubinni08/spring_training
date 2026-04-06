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
    private UserRepository userRepository;
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    UserDao userDao;

    @Override
    public UserDto update(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            User user1 = modelMapper.map(userDto, User.class);
            user1.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(user1);
            userDto.setSuccess(true);
            return userDto;
        } else {
            userDto.setSuccess(false);
            return userDto;
        }
    }

    @Override
    public UserDto updateJDBC(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            if (userDao.update(userDto)) {
                userDto.setSuccess(true);
                return userDto;
            }
        } else {
            userDto.setSuccess(false);
            return userDto;
        }
        return userDto;
    }
}