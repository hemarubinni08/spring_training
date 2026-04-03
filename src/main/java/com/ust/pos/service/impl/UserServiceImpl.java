package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    ModelMapper modelMapper;

    @Override
    public UserDto getById(Long id) {
        User user = userRepository.findById(id).orElseThrow(()->new RuntimeException("not found"));
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public List<UserDto> getAllUser() {
        List<User> user=userRepository.findAll();
        return Collections.singletonList(modelMapper.map(user, UserDto.class));
    }

    @Override
    public void update(UserDto userDto) {
        long id= userDto.getId();
        User existingUser= userRepository.findById(id)
                .orElseThrow(()->new RuntimeException("not found"));
        existingUser = modelMapper.map(userDto, User.class);
         userRepository.save(existingUser);
    }

    @Override
    public void deleteById(Long id) {
        userRepository.deleteById(id);
    }
}
