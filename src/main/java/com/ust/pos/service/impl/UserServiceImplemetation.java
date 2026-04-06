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

public class UserServiceImplemetation implements UserService {

    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    UserDao userDao;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public boolean UpdateByUserName(UserDto userDto) {

        if (existsByEmail(userDto.getEmail())) {
            return false;
        } else {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword((passwordEncoder.encode(userDto.getPassword())));
            userRepository.save(user);
            return true;
        }
    }

    @Override
    public boolean registerJdbc(UserDto userDto) {

        if (userRepository.existsByEmail(userDto.getEmail())) {
            return false;
        } else {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword((passwordEncoder.encode(userDto.getPassword())));
            userDao.registerJdbc(userDto);
            return true;
        }
    }


    @Override
    public boolean existsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }

    @Override
    public boolean createUserJdbc(UserDto userDto) {
        User user = userDao.existsByEmailJdbc(userDto.getEmail());
        if (user == null) {
            userDao.registerJdbc(userDto);
            return true;
        } else {
            return false;
        }
//        if (userRepository.existsByEmail(userDto.getEmail())) {
//            return false;
//        } else {
//            userDao.registerJdbc(userDto);
//            return true;
    }
}



