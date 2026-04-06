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
    private UserRepository userRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public Boolean save(UserDto userDto) {
        User existingUser = userRepository.findByEmail(userDto.getEmail());
        if (existingUser != null) {
            return false;
        }
        User user = modelMapper.map(userDto, User.class);
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));
        User result = userRepository.save(user);
        return true;
    }

    @Override
    public Boolean createUserJdbc(UserDto userDto) {
//        User existingUser = userRepository.findByEmail(userDto.getEmail());
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            userDao.save(userDto);
            return true;
        } else {
            return false;
        }
    }
}