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
import org.springframework.ui.Model;

import java.lang.reflect.Type;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    UserRepository userRepository;

    @Autowired
    ModelMapper modelMapper;

    @Override
    public UserDto findByUserName(String userName) {
        User user = new User();
        UserDto userDto = new UserDto();
        userRepository.findByUserName(userName);
        userDto.setUserName(user.getUserName());
        modelMapper.map(user, userDto);
        return userDto;
    }

    @Override
    public UserDto findById(Long id) {
        Optional<User> user = userRepository.findById(id);
        UserDto userDto = new UserDto();
        if (user.isPresent()) {
            modelMapper.map(user, userDto);
        }
        return userDto;
    }

    @Override
    public UserDto saveData(UserDto userDto) {
        if (!userRepository.findByEmailOrName((userDto.getEmail()), userDto.getName()).isEmpty()) {
            userDto.setSuccess(false);
            return userDto;
        } else {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(user);
            userDto.setSuccess(true);
            return userDto;
        }
    }

    @Override
    public UserDto registerJdbc(UserDto userDto) {
        if (!userDao.findByEmailOrName((userDto.getEmail()), userDto.getName()).isEmpty()) {
            userDto.setSuccess(false);
            return userDto;
        } else {
            boolean success = userDao.saveData(userDto);
            userDto.setSuccess(success);
            return userDto;
        }
    }
}