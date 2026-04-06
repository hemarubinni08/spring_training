package com.ust.pos.service.Impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    @Autowired
    private final UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private final ModelMapper modelMapper;

    public UserServiceImpl(UserRepository userRepository, ModelMapper modelMapper) {
        this.userRepository = userRepository;
        this.modelMapper = modelMapper;
    }

    @Override
    public UserDto createUser(UserDto userDto) {
        User existingUser = userRepository.findByEmail(userDto.getEmail());
        if (existingUser == null) {
            User usertemp = modelMapper.map(userDto, User.class);
            usertemp.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(usertemp);
//            userDto.setSuccess(true);
            userDto.setMessage("Added Successfully");

        } else {
//            userDto.setSuccess(false);
            userDto.setMessage("Email Already Exist!");
        }
        return userDto;
    }

    @Override
    public UserDto createUserJdbc(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            userDao.createUserJdbc(userDto);
            userDto.setMessage("ADDED SUCCESSFULLY!");
        } else {
            userDto.setMessage("Email Already Exists!");
        }
        return userDto;
    }
}

