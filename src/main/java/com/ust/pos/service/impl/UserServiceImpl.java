package com.ust.pos.service.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserServiceInterface;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service

public class UserServiceImpl implements UserServiceInterface {

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    UserDao userDao;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public String update(UserDto userDto) {

        if (userRepository.existsByEmail(userDto.getEmail())) {
            return "Email ALREADY EXISTS";
        }

        User user = modelMapper.map(userDto, User.class);
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));
        userRepository.save(user);
        return "SUCCESSFULLY REGISTERED";
    }

    @Override
    public String createUserJdbc(UserDto userDto) {

        if (userDao.findByEmail(userDto.getEmail()) != null) {
            return "Email ALREADY EXISTS";
        } else {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userDao.update(userDto);
            return "SUCCESSFULLY REGISTERED";
        }
    }
}
