package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
        User user = userRepository.findByUsername(userName);
        modelMapper.map(user, userDto);
        return userDto;
    }

    @Override
    public List<UserDto> findAll() {
        List<User> users = userRepository.findAll();
        List<UserDto> userDtos = new ArrayList<>();

        for (User user : users) {
            UserDto dto = new UserDto();
            modelMapper.map(user, dto);
            userDtos.add(dto);
        }
        return userDtos;
    }

    @Override
    public UserDto findById(Long id) {
        User user = userRepository.findById(id).get();
        UserDto userDto = new UserDto();
        modelMapper.map(user, userDto);
        return userDto;
    }

    @Override
    public void deleteById(Long id) {
        userRepository.deleteById(id);
    }

    @Override
    public UserDto updateById(Long id) {
        User user = userRepository.findById(id).get();
        UserDto userDto = new UserDto();
        modelMapper.map(user, userDto);
        return userDto;
    }

    @Override
    public UserDto updateById(UserDto userDto) {
        User user = new User();
        modelMapper.map(userDto, user);
        user = userRepository.save(user);

        UserDto updatedDto = new UserDto();
        modelMapper.map(user, updatedDto);
        return updatedDto;
    }

    @Override
    public UserDto update(UserDto userDto) {
        User user = new User();
        modelMapper.map(userDto, user);
        user = userRepository.save(user);

        UserDto updatedDto = new UserDto();
        modelMapper.map(user, updatedDto);
        return updatedDto;
    }
}