package com.ust.pos.service.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.RoleRepository;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserServiceInterface;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class UserServiceImpl implements UserServiceInterface {

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    UserDao userDao;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public String update(UserDto userDto) {

        if (userRepository.existsByEmail(userDto.getEmail())) {
            return "Email ALREADY EXISTS";
        }

        User user = modelMapper.map(userDto, User.class);
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));
        user.setRole(userDto.getRole());
        user.setRoles(userDto.getRoles());
        userRepository.save(user);
        return "SUCCESSFULLY REGISTERED";
    }

    @Override
    public String createUserJdbc(UserDto userDto) {

        if (userDao.findByEmail(userDto.getEmail()) != null) {
            return "Email ALREADY EXISTS";
        } else {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userDao.update(userDto);
            return "SUCCESSFULLY REGISTERED";
        }
    }

    @Override
    public List<UserDto> getAllUsers() {

        return userRepository.findAll()
                .stream()
                .map(user -> modelMapper.map(user, UserDto.class))
                .toList();
    }

    @Override
    public List<UserDto> getAllUsersJdbc() {

        return userDao.getAllUsers()
                .stream()
                .map(user -> modelMapper.map(user, UserDto.class))
                .toList();
    }

    @Override
    public UserDto getUserProfileByEmail(String email) {

        User user = userRepository.findByEmail(email);
        UserDto dto = modelMapper.map(user, UserDto.class);
        dto.setRoles(user.getRoles());
        return dto;
    }

    @Override
    public UserDto getUserProfileByEmailJdbc(String email) {

        User user = userDao.getUserByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    @Transactional
    public UserDto deleteByEmailService(String email) {
        return modelMapper.map(userRepository.deleteByEmail(email), UserDto.class);
    }

    @Override
    public UserDto getUserProfileById(long id) {

        User user = userRepository.findById(id);
        UserDto dto = modelMapper.map(user, UserDto.class);
        dto.setRoles(user.getRoles());
        return dto;
    }

    @Override
    public UserDto getUserProfileByIdJdbc(long id) {

        User user = userDao.getUserById(id);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto saveOrUpdateUser(UserDto userDto) {

        User existingUser = userRepository.findById(userDto.getId());
        User userWithSameEmail = userRepository.findByEmail(userDto.getEmail());

        if (userWithSameEmail != null &&
                userWithSameEmail.getId() != existingUser.getId()) {
            return null;
        }

        modelMapper.map(userDto, existingUser);
        existingUser.setRole(userDto.getRole());
        existingUser.setRoles(userDto.getRoles());
        userRepository.save(existingUser);
        return modelMapper.map(existingUser, UserDto.class);
    }

    @Override
    public UserDto saveOrUpdateUserJdbc(UserDto userDto) {

        User existingUser = userDao.getUserById(userDto.getId());
        User userWithSameEmail = userDao.findByEmail(userDto.getEmail());

        if (userWithSameEmail != null &&
                userWithSameEmail.getId() != existingUser.getId()) {
            return null;
        }

        modelMapper.map(userDto, existingUser);
        userRepository.save(existingUser);
        return modelMapper.map(existingUser, UserDto.class);
    }

    @Override
    public UserDto getUserByUsername(String userName) {

        User user = userRepository.findByUserName(userName);
        return modelMapper.map(user, UserDto.class);
    }
}

