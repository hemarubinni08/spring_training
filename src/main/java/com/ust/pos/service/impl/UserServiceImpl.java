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
    PasswordEncoder passwordEncoder;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserDao userDao;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public Boolean register(UserDto userDto) {
        User checkUser = userRepository.findByEmail(userDto.getEmail());
        if (checkUser == null) {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(user);
        } else {
            return false;
        }
        return true;
    }

    @Override
    public boolean createUserJdbc(UserDto userDto) {
//        User user= userRepository.findByEmail(userDto.getEmail());
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            userDao.createUserJdbc(userDto);
            return true;
        } else {
            return false;
        }
    }
}