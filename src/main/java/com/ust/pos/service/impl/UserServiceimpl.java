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
public class UserServiceimpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    UserDao userDao;

    @Override
    public UserDto save(UserDto userDto) {

        if (userRepository.findByEmail(userDto.getEmail()) != null) {
            userDto.setSuccess(false);
            return userDto;
        } else if (userRepository.findByUserName(userDto.getUserName()) != null) {
            userDto.setUserSuccess(false);
            return userDto;
        } else {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            User savedUser = userRepository.save(user);

            return modelMapper.map(savedUser, UserDto.class);
        }
    }

    @Override
    public boolean createUserJdbc(UserDto userDto) {
        if (userDao.fundByEmail(userDto.getEmail()) == null) {
            userDao.save(userDto);
            return true;
        } else {
            return false;
        }
    }
}