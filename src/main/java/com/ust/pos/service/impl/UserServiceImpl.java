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
    ModelMapper modelMapper;

    @Override
    public UserDto findByUserName(String userName) {
        UserDto userDto = new UserDto();
        User user = userRepository.findByUserName(userName);
        modelMapper.map(user, userDto);
        return userDto;
    }

    @Override
    public UserDto findById(Long id) {
        User user = userRepository.findById(id).orElseThrow();
        return modelMapper.map(user, UserDto.class);

    }

    @Override
    public List<UserDto> findAllUsers() {
        return List.of();
    }

    @Override
    public void deleteById(Long id) {
        userRepository.deleteById(id);
    }

    @Override
    public UserDto update(UserDto userDto) {
        User user = userRepository.findByEmail(userDto.getEmail());
        if (user == null) {
            User user1 = modelMapper.map(userDto, User.class);
            userRepository.save(user1);
            userDto.setSuccess(true);
            return userDto;
        } else {
            userDto.setSuccess(false);
            return userDto;
        }

    }
}