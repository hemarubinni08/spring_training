package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
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
    public UserDto findById(Long id) {
        User user = userRepository.findById(id).get();
        UserDto userDto = new UserDto();
        userDto.setUserName(user.getUserName());
        userDto.setAge(user.getAge());
        return userDto;

    }

    @Override
    public UserDto findByUserName(String userName) {
//        User user = userRepository.findByUsername(userName);
//        UserDto userDto = new UserDto();
//        userDto.setAge(user.getAge());
//        userDto.setUserName(user.getUserName());
//        userDto.setEmail(user.getEmail());
//        return userDto;

        User user = userRepository.findByUserName(userName);
        return modelMapper.map(user, UserDto.class);

    }

    @Override
    public List<UserDto> findAllUsers() {
        return List.of();
    }

    @Override
    public UserDto update(UserDto userDto) {
        return null;
    }

    @Override
    public void deleteById(Long id) {

    }

//    @Override
//    public UserDto update(UserDto userDto) {
//        User user = modelMapper.map(userDto, User.class);
//        userRepository.save(user);
//        return UserDto;
//    }

//    @Override
//    public UserDto register(UserDto userDto) {
//        User user = modelMapper.map(userDto, User.class);
//        userRepository.save(user);
//        return UserDto;
//    }

    @Override
    public boolean register(UserDto userDto) {
        if (!existsByEmail(userDto.getEmail())) {
            User user = modelMapper.map(userDto, User.class);
            userRepository.save(user);
            return true;
        }
        else {
            return false;
        }
    }

    @Override
    public boolean existsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }
}
