package com.ust.pos.service.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    JdbcTemplate jdbcTemplate;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private UserDao userDao;

    @Override
    public boolean register(UserDto userDto) {
        if (!existsByEmail(userDto.getEmail())) {
            User user = modelMapper.map(userDto, User.class);

            user.setPassword(passwordEncoder.encode(userDto.getPassword()));

            userRepository.save(user);
            return true;
        } else {
            return false;
        }
    }

    public boolean registerJdbc(UserDto userDto) {
        if (!existsByEmail(userDto.getEmail())) {
            User user = modelMapper.map(userDto, User.class);

            user.setPassword(passwordEncoder.encode(userDto.getPassword()));

            userDao.registerJdbc(userDto);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean existsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }
}
