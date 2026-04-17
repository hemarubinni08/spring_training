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
            return true;
        }
    }

    @Override
    public List<UserDto> fetchUserJdbc() {
        return userDao.fetchUser();
    }

    @Override
    public List<UserDto> fetchUser1() {
        List<User> users = userRepository.findAll();
        return users.stream().map(user -> modelMapper.map(user, UserDto.class)).collect(Collectors.toList());
    }

    @Override
    public UserDto findByIdJdbc(Long id) {
        User user = userDao.findByIdJdbc(id);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto findByIdJpa(Long id) {
        Optional<User> userOptional = userRepository.findById(id);
        if (userOptional.isPresent()) {
            return modelMapper.map(userOptional.get(), UserDto.class);
        }
        return null;
    }

    @Override
    public UserDto findByEmail(String email) {
        User user = userDao.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto findByEmailJpa(String email) {
        User user = userRepository.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public void deleteByEmail(String email) {
        User user = userRepository.findByEmail(email);
        userRepository.deleteById(user.getId());
    }

    @Override
    public void deleteByEmailJdbc(String email) {
        userDao.deleteByEmail(email);
    }

    @Override
    public boolean updateByEmail(UserDto userDto) {
        Optional<User> userOptional = userRepository.findById(userDto.getId());
        User userWithSameMail = userRepository.findByEmail(userDto.getEmail());

        if (userWithSameMail != null) {
            if (userDto.getId() == userWithSameMail.getId()) {
                modelMapper.map(userDto, userOptional.get());
                userRepository.save(userOptional.get());
                return true;
            }
        } else {
            modelMapper.map(userDto, userOptional.get());
            userRepository.save(userOptional.get());
            return true;
        }
        return false;
    }

    @Override
    public UserDto getUserByUsername(String username) {
        return null;
    }
}
