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

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UserServiceimpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    UserDao userDao;

    @Override
    public UserDto createUser(UserDto userDto) {

        if (userRepository.findByEmail(userDto.getEmail()) != null) {
            userDto.setSuccess(false);
            return userDto;
        } else if (userRepository.findByUserName(userDto.getUserName()) != null) {
            userDto.setUserSuccess(false);
            return userDto;
        } else {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            User savedUser = userRepository.save(user);
            return modelMapper.map(savedUser, UserDto.class);
        }
    }

    @Override
    public boolean createUserJdbc(UserDto userDto) {
        if (userDao.fundByEmail(userDto.getEmail()) == null) {
            userDao.save(userDto);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<UserDto> getData() {
        List<User> users = userRepository.findAll();
        return users.stream().map(user -> modelMapper.map(user, UserDto.class)).toList();
    }

    @Override
    public List<UserDto> getDataJdbc() {
        return userDao.getData().stream().map(user -> modelMapper.map(user, UserDto.class)).toList();
    }

    @Override
    public UserDto getUserDetailsJdbc(String email) {
        User user = userDao.fundByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto getUserDetails(String email) {
        User user = userRepository.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public void deleteUser(String email) {
        userRepository.deleteByEmail(email);
    }

    @Override
    public void deleteUserJdbc(String email) {
        userDao.deleteUserJdbc(email);
    }

    @Override
    public UserDto getUserDetailsById(Long id) {
        Optional<User> userOptional = userRepository.findById(id);
        if (userOptional.isPresent()) {
            return modelMapper.map(userOptional.get(), UserDto.class);
        } else {
            return null;
        }
    }

    @Override
    public UserDto getUserDetailsByIdJdbc(Long id) {
        User user = userDao.findById(id);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto updaterUserJdbc(UserDto userDto) {
        User user = modelMapper.map(userDto, User.class);
        User updateUser = userDao.updateUserJdbc(user);
        return modelMapper.map(updateUser, UserDto.class);
    }

    @Override
    public UserDto updateUserJpa(UserDto userDto) {
        User userWithSameEmail = userRepository.findByEmail(userDto.getEmail());
        if (userWithSameEmail != null && userWithSameEmail.getId() != (userDto.getId())) {
            userDto.setSuccess(false);
            return userDto;
        } else {
            User user = modelMapper.map(userDto, User.class);
            userRepository.save(user);
            userDto.setSuccess(true);
            return modelMapper.map(user, UserDto.class);
        }
    }
}