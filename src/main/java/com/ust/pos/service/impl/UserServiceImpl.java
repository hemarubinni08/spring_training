package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    ModelMapper modelMapper;

    @Override
    public List<User> findAll() {
        return List.of();
    }

    @Override
    public UserDto getByUsername(String userName) {
        User user = userRepository.findByUsername(userName);
        UserDto userDto = modelMapper.map(user, UserDto.class);
        return null;
    }

    @Override
    public UserDto deleteByUsername(String userName) {
        userRepository.deleteByUserName(userName);
        return null;
    }

    @Override
    public void deleteById(long id) {
        userRepository.deleteById(id);
    }

    @Override
    public UserDto updateByUsername(UserDto userDto) {
        return null;
    }
}
