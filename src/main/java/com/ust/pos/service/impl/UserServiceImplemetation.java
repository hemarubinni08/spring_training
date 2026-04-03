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

public class UserServiceImplemetation implements UserService {

       @Autowired
       private UserRepository userRepository;
       @Autowired
       private ModelMapper modelMapper;


    @Override
    public List<UserDto> findAll() {
        return List.of();
    }

    @Override
    public UserDto getByUsername(String userName) {
        User user= userRepository.findByUsername(userName);
       return modelMapper.map(user,UserDto.class);


    }

    @Override
    public UserDto getById() {
        return null;
    }

    @Override
    public void deleteByUsername(String userName) {
        userRepository.findByUsername(userName);

    }

    @Override
    public UserDto UpdateByUsername(UserDto userDto) {
        return null;
    }
}
