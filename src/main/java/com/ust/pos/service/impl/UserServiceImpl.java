package com.ust.pos.service.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDto saveData(UserDto userDto) {
        if (userRepository.findByEmail(userDto.getEmail()) != null) {
            userDto.setSuccess(false);
            return userDto;
        } else {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            User saveduser = userRepository.save(user);
            return modelMapper.map(saveduser, UserDto.class);
        }
    }

    @Override
    public boolean saveDataJdbc(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            userDao.saveData(userDto);
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
    public List<UserDto> getAllUsersJdbc() {
        return userDao.getAllUsersJdbc();
    }

    @Override
    public UserDto findByEmailJpa(String email) {
        User user = userRepository.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto findByEmail(String email) {
        User user = userDao.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    @Transactional
    public void deleteByEmail(String email) {
        userRepository.deleteByEmail(email);
    }

    @Override
    public void deleteByEmailJdbc(String email) {
        userDao.deleteByEmail(email);
    }

    @Override
    public UserDto findById(Long id) {
        Optional<User> user = userRepository.findById(id);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto findByIdJdbc(Long id) {
        User user = userDao.findByIdJdbc(id);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto updateDataJpa(UserDto userDto) {
        Optional<User> optionalUser = userRepository.findById(userDto.getId());
        if (!optionalUser.isPresent()) {
            userDto.setMessage("Not Present in Server");
            return null;
        }
        User existingUser = optionalUser.get();
        String existingEmail = existingUser.getEmail();
        String newEmail = userDto.getEmail();

        if (!existingEmail.equals(newEmail)) {
            if (userRepository.existsByEmail(newEmail)) {
                userDto.setMessage("Email Already Exists");
                return null;
            }
        }
        modelMapper.map(userDto, existingUser);
        userDto.setMessage("User updated successfully");
        return modelMapper.map(userRepository.save(existingUser), UserDto.class);
    }

    @Override
    public int updateDataJdbc(UserDto userDto) {
        if (userDao.updateDataJdbc(userDto) < 1) {
            userDto.setMessage("Failed Updating");
            return 0;
        }
        userDto.setMessage("Successfull Updating");
        return 1;
    }

}
