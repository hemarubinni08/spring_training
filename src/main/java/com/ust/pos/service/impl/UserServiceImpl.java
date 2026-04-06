package com.ust.pos.service.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.ust.pos.service.UserService;

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

    public boolean registerjdbc(UserDto userDto){
        boolean emailExists = userRepository.existsByEmail(userDto.getEmail());

        if (emailExists) {
            return false;
        }

        User user = modelMapper.map(userDto, User.class);
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));
        userDao.registerjdbc(userDto);
        return true;
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
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public UserDto findById(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto findByUserName(String username) {
        User user = userRepository.findByUserName(username);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto update(Long id, UserDto userDto) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));

        modelMapper.map(userDto, user);
        userRepository.save(user);

        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public void deleteById(Long id) {
        userRepository.deleteById(id);
    }
}
