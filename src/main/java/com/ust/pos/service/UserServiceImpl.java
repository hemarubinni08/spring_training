package com.ust.pos.service;

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
    private UserRepository userRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserDao userDao;

    @Override
    public UserDto update(UserDto userDto) {

        User user = userRepository.findByEmail(userDto.getEmail());
        if (user == null) {
            User usertemp = modelMapper.map(userDto, User.class);
            usertemp.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(usertemp);
            userDto.setMessage("✅ Added Successfully");
            userDto.setColour("green");
            userDto.setMessage2("Your account has been created successfully!");
        } else {
            userDto.setMessage("❌ Email Already Exist!");
            userDto.setColour("red");
            userDto.setMessage2("Please use a different email id");
        }

        return userDto;
    }

    @Override
    public UserDto createUserUsingJdbc(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {

            userDao.update(userDto);
            userDto.setMessage("✅ Added Successfully");
            userDto.setColour("green");
            userDto.setMessage2("Your account has been created successfully!");

        } else {

            userDto.setMessage("❌ Email Already Exist!");
            userDto.setColour("red");
            userDto.setMessage2("Please use a different email id");
        }

        return userDto;
    }
}