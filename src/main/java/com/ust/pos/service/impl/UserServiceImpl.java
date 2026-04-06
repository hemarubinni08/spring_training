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
    PasswordEncoder passwordEncoder;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    UserDao userDao;

    @Override
    public String update(UserDto userDto) {
        if (userRepository.existsByEmail(userDto.getEmail())) {
            return "Email already exists";
        } else {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(user);
            return "Successfully created";
        }
    }

    @Override
    public String registerUsingJdbc(UserDto userDto) {
        if (userDao.findByEmailCustom(userDto.getEmail()) != null) {
            return "Email already exists";
        } else {
            userDao.update(userDto);
            return "Successfully created";
        }
    }
}