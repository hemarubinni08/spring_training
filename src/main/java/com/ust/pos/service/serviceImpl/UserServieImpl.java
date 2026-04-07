package com.ust.pos.service.serviceImpl;

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
public class UserServieImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDto updateUniqueUser(UserDto userDto) {
        User user = userRepository.findByEmail(userDto.getEmail());
        if (user == null) {
            User usertemp = modelMapper.map(userDto, User.class);
            usertemp.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(usertemp);
            userDto.setMessage("User Registered Successfully....!");
            userDto.setColour("green");
            userDto.setMessage2("Your account has been created successfully.");

        } else {
            userDto.setMessage("User With This Email Already Exists...!");
            userDto.setColour("red");
            userDto.setMessage2("Please try to use a different Email.");
        }
        return userDto;
    }

    @Override
    public boolean createUserUsingDao(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            userDao.createUser(userDto);
            userDto.setMessage("User Registered Successfully....!");
            userDto.setColour("green");
            userDto.setMessage2("Your account has been created successfully.");

        } else {
            userDto.setMessage("User With This Email Already Exists...!");
            userDto.setColour("red");
            userDto.setMessage2("Please try to use a different Email.");
        }
        return false;
    }

}
