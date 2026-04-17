package com.ust.pos.service.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    UserRepository userRepository;

    @Autowired
    ModelMapper modelMapper;

    @Override
    public UserDto findByUserName(String userName) {
        User user = userRepository.findByUserName(userName);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto findByIdJpa(long id) {
        Optional<User> userOptional = userRepository.findById(id);
        UserDto userDto = new UserDto();
        if (userOptional.isPresent()) {
            return modelMapper.map(userOptional.get(), UserDto.class);
        }
        return userDto;
    }

    @Override
    public UserDto findById(long id) {
        User users = userDao.findById(id);
        return modelMapper.map(users, UserDto.class);
    }

    @Override
    public UserDto saveData(UserDto userDto) {
        if (!userRepository.findByEmailOrName((userDto.getEmail()), userDto.getName()).isEmpty()) {
            userDto.setSuccess(false);
            return userDto;
        } else {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(user);
            userDto.setSuccess(true);
            return userDto;
        }
    }

    @Override
    public UserDto registerJdbc(UserDto userDto) {
        if (!userDao.findByEmailOrName((userDto.getEmail()), userDto.getName()).isEmpty()) {
            userDto.setSuccess(false);
            return userDto;
        } else {
            boolean success = userDao.saveData(userDto);
            userDto.setSuccess(success);
            return userDto;
        }
    }

    @Override
    public List<UserDto> findAllUser() {
        List<User> users = userDao.findAllUsers();
        return users.stream().map(user -> modelMapper.map(user, UserDto.class)).toList();
    }

    @Override
    public List<UserDto> findAllUsersJpa() {
        List<User> users = userRepository.findAll();
        return users.stream().map(user -> modelMapper.map(user, UserDto.class)).toList();
    }

    @Override
    public UserDto findByEmail(String email) {
        User user1 = userDao.findByEmail(email);
        return modelMapper.map(user1, UserDto.class);
    }

    @Override
    public UserDto findByEmailJpa(String email) {
        User user1 = userRepository.findByEmail(email);
        return modelMapper.map(user1, UserDto.class);
    }

    @Override
    public void deleteUser(String email) {
        userRepository.deleteByEmail(email);
    }

    @Override
    public UserDto UpdateData(UserDto userDto) {
        User user = modelMapper.map(userDto, User.class);
        User updateUser = userDao.updateUser(user);
        return modelMapper.map(updateUser, UserDto.class);
    }

    @Override
    public UserDto UpdateUserJpa(UserDto userDto) {
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

    @Override
    public UserDto getUserbyUserName(String username) {
        User user= userRepository.findByUserName(username);
        return modelMapper.map(user, UserDto.class);
    }
}