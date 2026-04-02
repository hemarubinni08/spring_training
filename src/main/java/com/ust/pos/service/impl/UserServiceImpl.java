package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<UserDto> findAll() {

    }

    @Override
    public UserDto findById(Long id) {
        return userRepository.findById();
    }

    @Override
    public void deleteById(Long id) {
        return userRepository.deleteById();
    }

    @Override
    public UserDto update(Long id) {

        User user=new User();
        UserDto userdto=new UserDto();
        userdto.setName(user.setName);

    }
}
