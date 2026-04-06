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
    ModelMapper modelMapper;
    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDto saveData(UserDto userDto) {
        if (userRepository.findByEmail(userDto.getEmail()) != null) {
            userDto.setSuccess(false);
            return userDto;
        } else {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            User saveduser = userRepository.save(user);
            return modelMapper.map(saveduser, UserDto.class);
        }
    }

    @Override
    public boolean saveDataJdbc(UserDto userDto) {
        User user = userRepository.findByEmail(userDto.getEmail());
        if (user == null) {
            userDao.saveData(userDto);
            return true;
        } else {
            return true;
        }
    }
}