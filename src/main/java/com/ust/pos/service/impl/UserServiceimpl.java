package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceimpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public UserDto findById(long id) {
        Optional<User> user = userRepository.findById(id);
        return modelMapper.map(user , UserDto.class);
    }

    @Override
    public List<UserDto> findAll() {
        return null;
    }

    @Override
    public UserDto getbyuserName(String userName) {
        UserDto userDto = new UserDto();
        User user = userRepository.findByUserName(userName);
        userDto.setUserName(user.getUserName());
        userDto.setAge(user.getAge());
        modelMapper.map(user , userDto);
        return userDto;
    }

    @Override
    public void deleteById(long id) {
        userRepository.deleteById(id);
    }

    @Override
    public UserDto update(UserDto userDto) {
        return null;

    }

    @Override
    public UserDto save(UserDto userDto) {
        if (userRepository.findByEmail(userDto.getEmail()) != null) {
            userDto.setSuccess(false);
            return userDto;
        } else {
            User user = modelMapper.map(userDto, User.class);
            User savedUser = userRepository.save(user);
            return modelMapper.map(savedUser, UserDto.class);
        }
    }
}