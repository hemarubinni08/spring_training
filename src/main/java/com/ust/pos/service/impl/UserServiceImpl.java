package com.ust.pos.service.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.ust.pos.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public boolean saveAUSer(UserDto userDto) {

        if (existsByEmail(userDto.getEmail()) || existsByUserName(userDto.getUserName())) {

            return false;

        }

        userDto.setPassword(passwordEncoder.encode(userDto.getPassword()));
        userRepository.save(modelMapper.map(userDto, User.class));

        return true;
    }

    @Override
    public boolean saveAUserJdbc(UserDto userDto) {

        if (existsByEmailJdbc(userDto.getEmail())) {

            return false;

        }

        userDto.setPassword(passwordEncoder.encode(userDto.getPassword()));
        userDao.saveAUser(userDto);

        return true;
    }

    @Override
    public boolean existsByEmailJdbc(String email) {

        return userDao.existsByEmail(email);
    }


    @Override
    public boolean existsByEmail(String email) {

        return userRepository.existsByEmail(email);

    }

    @Override
    public boolean existsByUserName(String userName) {

        return userRepository.existsByUserName(userName);

    }
}
