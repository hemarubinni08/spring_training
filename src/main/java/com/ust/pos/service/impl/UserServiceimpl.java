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
    PasswordEncoder passwordEncoder;
    @Autowired
    UserDao userDao;

    @Override
    public UserDto registerUser(UserDto userDto) {
        if ((userRepository.findByEmail(userDto.getEmail()) != null) || (userRepository.findByUserName(userDto.getUserName()) != null)) {
            userDto.setSuccess(false);
            return userDto;
        } else {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            User savedUser = userRepository.save(user);
            return modelMapper.map(savedUser, UserDto.class);
        }
    }

    @Override
    public UserDto registerUserJdbc(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            boolean success = userDao.save(userDto);
            userDto.setSuccess(success);
            return userDto;
        }
        return userDto;
    }

    @Override
    public List<UserDto> getUsersJpa() {
        List<User> usersList = userRepository.findAll();
        List<UserDto> userDtoList = usersList.stream().map(user -> modelMapper.map(user, UserDto.class)).toList();
        return userDtoList;
    }

    @Override
    public List<UserDto> getUsersJdbc() {
        List<User> usersList = userDao.findAllUsersDao();
        List<UserDto> userDtoList = usersList.stream().map(user -> modelMapper.map(user, UserDto.class)).toList();
        return userDtoList;
    }

    @Override
    public UserDto getUserByEmail(String email) {
        User user = userRepository.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto getUserByEmailJdbc(String email) {
        User user = userDao.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public void deleteUserByEmailJpa(String email) {
        userRepository.deleteByEmail(email);
    }

    @Override
    public void deleteUserByEmailJdbc(String email) {
        userDao.deleteByEmailDao(email);
    }

    @Override
    public UserDto getUserByIdJpa(Long id) {
        Optional<User> user = userRepository.findById(id);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto getUserByIdJdbc(Long id) {
        User user = userDao.findByIdDao(id);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto updateUserJdbc(UserDto userDto) {
        boolean success = userDao.updateUser(userDto);
        userDto.setSuccess(success);
        return userDto;
    }

    @Override
    public UserDto updateUserJpa(UserDto userDto) {
        User user = modelMapper.map(userDto, User.class);
        User updateUser = userRepository.save(user);
        return modelMapper.map(updateUser, UserDto.class);
    }

    @Override
    public UserDto getUserByUserName(String userName) {
        User user = userRepository.findByUserName(userName);
        return modelMapper.map(user, UserDto.class);
    }
}