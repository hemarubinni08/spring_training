package com.ust.pos.service.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private UserDao userDao;

//    public boolean registerjdbc(UserDto userDto) {
//       boolean emailExists = userRepository.existsByEmail(userDto.getEmail());
//
//        if (emailExists) {
//            return false;
//        }
//
//        User user = modelMapper.map(userDto, User.class);
//        user.setPassword(passwordEncoder.encode(userDto.getPassword()));
//        userDao.registerjdbc(userDto);
//        return true;
//    }

    public boolean saveDataJdbc(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            userDao.registerjdbc(userDto);
            return true;
        } else {
            return false;
        }
    }

    public boolean register(UserDto userDto) {

        boolean emailExists = userRepository.existsByEmail(userDto.getEmail());

        if (emailExists) {
            return false;
        }

        User user = modelMapper.map(userDto, User.class);
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));
        userRepository.save(user);
        return true;
    }

    @Override
    public List<UserDto> printAllUsers() {
        List<User> users = userRepository.findAll();
        List<UserDto> userDto = new ArrayList<>();
        for (User user1 : users) {
            userDto.add(modelMapper.map(user1, UserDto.class));
        }
        return userDto;
    }
    @Transactional
    public void deleteByEmail(String email){
        userRepository.deleteByEmail(email);
    }
    public void deleteByEmailJdbc(String email){
        userDao.deleteByEmailJdbc(email);
    }

    @Override
    public List<UserDto> printAllUsersJdbc() {
        List<User> users = userDao.printAllUsersJdbc();
        List<UserDto> userDtoJdbc = new ArrayList<>();
        for (User user : users) {
            userDtoJdbc.add(modelMapper.map(user, UserDto.class));
        }
        return userDtoJdbc;
    }

    public UserDto getProfile(String email) {
        User user1 = userRepository.findByEmail(email);
        UserDto user2 = modelMapper.map(user1, UserDto.class);
        return user2;
    }

    public UserDto getProfileJdbc(String email) {
        User user1 = userDao.findByEmail(email);
        UserDto userProfile = modelMapper.map(user1, UserDto.class);
        return userProfile;
    }
}
