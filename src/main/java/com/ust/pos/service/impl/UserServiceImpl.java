package com.ust.pos.service.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    UserRepository userRepository;
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    UserDao userDao;

    @Override
    public UserDto register(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            User user1 = modelMapper.map(userDto, User.class);
            user1.setPassword(passwordEncoder.encode(userDto.getPassword()));
            user1.setEmail(userDto.getUserName());
            userRepository.save(user1);
            userDto.setSuccess(true);
            return userDto;
        } else {
            userDto.setSuccess(false);
            return userDto;
        }
    }

    @Override
    public UserDto registerJDBC(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            if (userDao.update(userDto)) {
                userDto.setSuccess(true);
                return userDto;
            }
        } else {
            userDto.setSuccess(false);
            return userDto;
        }
        return userDto;
    }

    @Override
    public List<UserDto> display() {
            List<User> users = userRepository.findAll();
            return users.stream().map(user1->modelMapper.map(user1, UserDto.class)).collect(Collectors.toList());
    }

    @Override
    public List<UserDto> displayJDBC() {
        List<User> users = userDao.displayUser();
        return users.stream().map(user1->modelMapper.map(user1, UserDto.class)).collect(Collectors.toList());
    }

    @Override
    public UserDto getProfile(String email) {
        User user = userDao.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public void deleteProfile(String email) {
        userRepository.deleteByEmail(email);
    }

    @Override
    public UserDto getProfileById(long id) {
        Optional<User> user = userRepository.findById(id);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto getUserByUserEmail(String email) {
        User user = userRepository.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto getProfileByIdJDBC(long id) {
        User user = userDao.findById(id);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto updateprofileJDBC(UserDto userDto) {
        User user = userDao.findById(userDto.getId());
        if (user != null) {
            if (userDao.updateprofileJDBC(userDto)) {
                userDto.setSuccess(true);
                return userDto;
            }
        } else {
            userDto.setSuccess(false);
            return userDto;
        }
        return userDto;
    }

    @Override
    public UserDto updateprofileJpa(UserDto userDto)
    {
        User user1 = modelMapper.map(userDto, User.class);
        userRepository.save(user1);
        return userDto;
    }
}