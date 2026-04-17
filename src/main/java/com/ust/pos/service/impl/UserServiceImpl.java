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
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDto saveUser(UserDto userDto) {
        if (userRepository.findByEmail(userDto.getEmail()) != null) {
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
    public boolean saveUserJdbc(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            userDao.saveUser(userDto);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<UserDto> getAllUsers() {
        List<User> users = userRepository.findAll();
        return users.stream().map(user -> modelMapper.map(user, UserDto.class))
                .collect(Collectors.toList());
    }

    @Override
    public List<UserDto> getAllUserJdbc() {
        return userDao.getAllUserJdbc();
    }

    @Override
    public UserDto getByEmail(String email) {                    //getuserbyemail
        User user = userRepository.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto getByEmailJdbc(String email) {                //getuserbyemail
        User users = userRepository.findByEmail(email);
        return modelMapper.map(users, UserDto.class);
    }

    @Override
    @Transactional
    public void deleteByEmail(String email) {
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
        User existingUser = userRepository.findById((long) userDto.getId());
        if (!existingUser.getEmail().equals(userDto.getEmail())) {
            User emailUser = userRepository.findByEmail(userDto.getEmail());
            if (emailUser != null) {
                throw new RuntimeException("Email already exists");
            }
        }
        existingUser.setName(userDto.getName());
        existingUser.setEmail(userDto.getEmail());
        existingUser.setPhoneNo(userDto.getPhoneNo());
        existingUser.setUserName(userDto.getUserName());
        existingUser.setAge(userDto.getAge());
        existingUser.setRole(userDto.getRole());
        existingUser.setPassword(userDto.getPassword());
        existingUser.setRoles(userDto.getRoles());

        userRepository.save(existingUser);
        return modelMapper.map(existingUser, UserDto.class);
    }

    @Override
    public UserDto findById(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user == null) return null;
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto findByUserNameService(String userName) {
        return modelMapper.map(userRepository.findByUserName(userName), UserDto.class);
    }
}