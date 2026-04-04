package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public UserDto findById(long id) {
        User user = userRepository.findById(id).orElseThrow();
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public void deleteById(long id) {
        userRepository.deleteById(id);
    }

    @Override
    public User updateById(UserDto userDto) {
        return userRepository.save(modelMapper.map(userDto, User.class));
    }

    @Override
    public Boolean register(UserDto userDto) {
        User checkUser = userRepository.findByEmail(userDto.getEmail());
        if (checkUser == null) {
            User user = modelMapper.map(userDto, User.class);
            userRepository.save(user);
        } else {
            return false;
        }
        return true;
    }

    @Override
    public Boolean login(UserDto userDto) {
        User checkUser = userRepository.findByEmail(userDto.getEmail());
        // will return true or false depending on whether the password matches
        System.out.println(checkUser.getPassword());
        return checkUser.getPassword().equals(userDto.getPassword());
    }
}