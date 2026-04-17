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
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    UserDao userDao;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public String register(UserDto userDto) {
        if (userRepository.existsByEmail(userDto.getEmail())) {
            userDto.setSuccess(false);
            return "Email already exists";
        } else {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(user);
            userDto.setSuccess(true);
            return "Successfully created";
        }
    }

    @Override
    public String registerUsingJdbc(UserDto userDto) {
        if (userDao.findByEmailCustom(userDto.getEmail()) != null) {
            userDto.setSuccess(false);
            return "Email already exists";
        } else {
            userDao.register(userDto);
            return "Successfully created";
        }
    }

    @Override
    public List<UserDto> getAllUsers() {
        List<User> users = userRepository.findAll();
        List<UserDto> usersDto = new ArrayList<>();
        for (User user : users) {
            usersDto.add(modelMapper.map(user, UserDto.class));
        }
        return usersDto;
    }

    @Override
    public List<UserDto> getUsersJdbc() {
        List<User> users = userDao.getUsersJdbc();
        List<UserDto> usersDto = new ArrayList<>();
        for (User user : users) {
            usersDto.add(modelMapper.map(user, UserDto.class));
        }
        return usersDto;
    }

    @Override
    public UserDto findDetails(String email) {
        User user = userRepository.findByEmail(email);
        if (user != null) {
            return modelMapper.map(user, UserDto.class);
        } else {
            return null;
        }
    }

    @Override
    public UserDto findDetailsJdbc(String email) {
        User user = userDao.findByEmailCustom(email);
        if (user != null) {
            return modelMapper.map(user, UserDto.class);
        }
        return null;
    }

    @Override
    @Transactional
    public void deleteDetails(String email) {
        User user = userRepository.deleteByEmail(email);
        userRepository.delete(user);
    }

    @Override
    public void deleteDetailsJdbc(String email) {
        userDao.deleteByEmail(email);
    }

    @Override
    public UserDto updateValueJdbc(UserDto userDto) {
        Optional<User> userOptional = userRepository.findById(userDto.getId());
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            if (!user.getEmail().equals(userDto.getEmail())) {
                if (userRepository.existsByEmail(userDto.getEmail())) {
                    userDto.setSuccess(false);
                    userDto.setMessage("user already exists");
                    return userDto;
                }
            }
            userDao.updateValue(userDto);
            userDto.setSuccess(true);
            userDto.setMessage("successful");
        }
        return userDto;
    }

    @Override
    public UserDto updateValue(UserDto userDto) {
        Optional<User> userOptional = userRepository.findById(userDto.getId());
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            String password = user.getPassword();
            if (!user.getEmail().equals(userDto.getEmail())) {
                if (userRepository.existsByEmail(userDto.getEmail())) {
                    userDto.setSuccess(false);
                    userDto.setMessage("user already exists");
                    return userDto;
                }
            }

            userDto.setMessage("Modified");
            userDto.setSuccess(true);
            modelMapper.map(userDto, user);
            if (userDto.getPassword() == null) {
                user.setPassword(password);
            }
            userRepository.save(user);
        }
        return userDto;
    }
}