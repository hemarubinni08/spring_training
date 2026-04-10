package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.ust.pos.dao.UserDao;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDto createUser(UserDto userDto) {
        User user = modelMapper.map(userDto, User.class);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        User savedUser = userRepository.save(user);
        return modelMapper.map(savedUser, UserDto.class);
    }


    @Override
    public boolean emailExists(String email) {
        return userRepository.existsByEmail(email);
    }

    @Override
    public boolean emailExistsJdbc(String email) {
        return userDao.emailExists(email);
    }

    @Override
    public void createUserJdbc(UserDto userDto) {
        userDto.setPassword(passwordEncoder.encode(userDto.getPassword()));
        userDao.createUser(userDto);
    }

    @Override
    public List<UserDto> getUsers() {
        return userDao.getUsers();
    }

    @Override
    public List<UserDto> getUsersJpa() {
        List<UserDto> user_list = new ArrayList<>();
        for (User user : userRepository.findAll()) {
            user_list.add(modelMapper.map(user, UserDto.class));

        }
        return user_list;
    }

    @Override
    public UserDto getUserByEmail(String email) {
        User user = userRepository.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto getUserByEmailJdbc(String email) {
        return userDao.getUserByEmail(email);
    }

    @Override
    public void deleteUserByEmail(String email) {
        userDao.deleteUserByEmail(email);
    }

    @Override
    public void deleteUserByEmailJpa(String email) {
        userRepository.deleteByEmail(email);

    }

    @Override
    public UserDto getUserById(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));

        return modelMapper.map(user, UserDto.class);
    }


    @Override
    public UserDto getUserByIdJdbc(Long id) {
        return userDao.getUserByIdJdbc(id);
    }


    @Override
    public UserDto updateUser(UserDto userDto) {

        User existingUser = userRepository.findById(userDto.getId())
                .orElseThrow(() -> new RuntimeException("User not found"));

        existingUser.setName(userDto.getName());
        existingUser.setEmail(userDto.getEmail());
        existingUser.setPhoneNo(userDto.getPhoneNo());

        User updatedUser = userRepository.save(existingUser);

        return modelMapper.map(updatedUser, UserDto.class);
    }


    @Override
    public boolean updateUserJdbc(UserDto userDto) {

        boolean emailTaken =
                userDao.emailExistsForAnotherUser(
                        userDto.getEmail(),
                        userDto.getId()
                );

        if (emailTaken) {
            return false;
        }

        userDao.updateUserJdbc(userDto);
        return true;
    }

    @Override
    public boolean updateUserJpa(UserDto userDto) {

        boolean emailTaken = userRepository.existsByEmailAndIdNot(
                userDto.getEmail(),
                userDto.getId()
        );

        if (emailTaken) {
            return false;
        }

        User existingUser = userRepository.findById(userDto.getId())
                .orElse(null);

        if (existingUser == null) {
            return false;
        }

        existingUser.setName(userDto.getName());
        existingUser.setEmail(userDto.getEmail());
        existingUser.setPhoneNo(userDto.getPhoneNo());
        existingUser.setUserName(userDto.getUserName());

        userRepository.save(existingUser);
        return true;
    }


}