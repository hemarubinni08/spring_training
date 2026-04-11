package com.ust.pos.service.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Transactional
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    JdbcTemplate jdbcTemplate;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserDao userDao;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public void register(UserDto userDto) {
        if (userRepository.existsByEmail(userDto.getEmail())) {
            throw new RuntimeException("Email already exists!");
        }

        User user = modelMapper.map(userDto, User.class);
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));


        userRepository.save(user);
    }

    @Override

    public boolean registerJdbc(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());

        if (user == null) {
            userDao.registerJdbc(userDto);
            return true;
        }
        return false;
    }

    @Override
    public List<UserDto> getAllUsers() {

        List<User> users = userRepository.findAll();
        List<UserDto> userDtos = new ArrayList<>();

        for (User user : users) {
            UserDto dto = modelMapper.map(user, UserDto.class);
            userDtos.add(dto);
        }

        return userDtos;

    }

    @Override
    public List<UserDto> getAllUsersJdbc() {

        List<User> users = userDao.findAll();
        List<UserDto> userDtos = new ArrayList<>();

        for (User user : users) {
            UserDto dto = modelMapper.map(user, UserDto.class);
            userDtos.add(dto);
        }

        return userDtos;

    }

    @Override
    public UserDto findById(Long id) {
        User user = userRepository.findById(id).orElse(null);

        if (user == null) return null;

        UserDto dto = new UserDto();
        dto.setId(user.getId());
        dto.setName(user.getName());
        dto.setEmail(user.getEmail());
        dto.setPhoneNo(user.getPhoneNo());
        dto.setUserName(user.getUserName());

        return dto;
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
    public void deleteByEmail(String email) {
        userRepository.deleteByEmail(email);
    }

    @Override
    public boolean deleteUserByEmailJdbc(String email) {
        userDao.deleteByEmail(email);
        return true;
    }

    @Override
    public void deleteById(Long id) {
        userRepository.deleteById(id);
    }

    @Override
    public UserDto getUserById(long id) {
        User user = userRepository.findById(id);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto getUserByIdJdbc(long id) {
        User user = userDao.findById(id);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto update(UserDto userDto) {

        User existingUserWithEmail = userRepository.findByEmail(userDto.getEmail());

        if (existingUserWithEmail != null &&
                existingUserWithEmail.getId() != userDto.getId()) {

            throw new RuntimeException("Email already exists!");
        }

        User existingUser = userRepository.findById(userDto.getId()).orElse(null);

        if (existingUser == null) {
            throw new RuntimeException("User not found!");
        }

        existingUser.setName(userDto.getName());
        existingUser.setEmail(userDto.getEmail());
        existingUser.setPhoneNo(userDto.getPhoneNo());
        existingUser.setUserName(userDto.getUserName());

        if (userDto.getPassword() != null && !userDto.getPassword().isEmpty()) {
            existingUser.setPassword(passwordEncoder.encode(userDto.getPassword()));
        }

        userRepository.save(existingUser);

        return userDto;
    }

    @Override
    public boolean existsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }

}
