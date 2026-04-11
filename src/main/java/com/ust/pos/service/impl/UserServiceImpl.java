package com.ust.pos.service.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserServiceRitu;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserServiceRitu {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    UserDao userDao;

    @Override
    public UserDto register(UserDto userDto) {
        User user = userRepository.findByEmail(userDto.getEmail());

        if (user == null) {
            User user2 = modelMapper.map(userDto, User.class);
            user2.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(user2);
            userDto.setSuccess(true);
            return userDto;
        } else {
            userDto.setSuccess(false);
            return userDto;
        }
    }

    @Override
    public UserDto registerJdbc(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null ) {
            boolean success = userDao.register(userDto);
            userDto.setSuccess(success);
            return userDto;
        }
        return userDto;
    }

    @Override
    public UserDto updateJdbc(UserDto userDto) {
        User user = modelMapper.map(userDto, User.class);
        User updateUser = userDao.update(user);
        return modelMapper.map(updateUser, UserDto.class);
    }

    @Override
    public UserDto updateJpa(UserDto userDto) {

        User user = modelMapper.map(userDto, User.class);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        User updateUser = userRepository.save(user);
        return modelMapper.map(updateUser, UserDto.class);
    }

    @Override
    public List<UserDto> fetchAllUsers() {
        List<User> userList = userRepository.findAll();
        return userList.stream().map(user -> modelMapper.map(user, UserDto.class)).toList();
    }

    @Override
    public List<UserDto> fetchAllUsersJdbc() {
        List<User> users = userDao.findAllUsers();
        return users.stream().map(user -> modelMapper.map(user, UserDto.class)).toList();
    }

    @Override
    public UserDto getUserByEmail(String email) {
        User user1 = userDao.findByEmail(email);
        return modelMapper.map(user1, UserDto.class);
    }

    @Override
    public UserDto getUserByIdJdbc(Long id) {
        User user2 = userDao.findById(id);
        return modelMapper.map(user2, UserDto.class);
    }

    @Override
    public UserDto getUserByIdJpa(Long id) {
        Optional<User> user2 = userRepository.findById(id);
        return modelMapper.map(user2, UserDto.class);
    }

    @Override
    public void deleteByEmailJpa(String email) {
        User user = userRepository.findByEmail(email);
        userRepository.deleteById(user.getId());
    }

    @Override
    public void deleteByEmailJdbc(String email) {

        userDao.deleteUserByEmail(email);
    }

}
