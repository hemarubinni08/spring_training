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
    ModelMapper modelMapper;
    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    UserDao userDao;
    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean register(UserDto userDto) {

        User existingUser = userRepository.findByEmail(userDto.getEmail());
        if (existingUser != null) {
            return false;
        }
        User user = modelMapper.map(userDto, User.class);
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));
        userRepository.save(user);
        return true;
    }

    @Override
    public boolean registerJdbc(UserDto userDto) {

        User existingUser = userDao.findByEmail(userDto.getEmail());
        if (existingUser != null) {
            return false;
        } else {
            userDao.register(userDto);
            return true;
        }
    }
}
