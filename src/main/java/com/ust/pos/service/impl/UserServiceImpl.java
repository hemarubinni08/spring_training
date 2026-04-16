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
    private UserRepository userRepository;
    @Autowired
    private UserDao userDao;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public Boolean register(UserDto userDto) {
        User checkUser = userRepository.findByEmail(userDto.getEmail());

        if (checkUser == null) {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(user);
        } else {
            return false;
        }
        return true;
    }

    @Override
    public boolean createUserJdbc(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());

        if (user == null) {
            userDao.createUserJdbc(userDto);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<UserDto> getUsersListJpa() {
        List<User> usersList = userRepository.findAll();
        List<UserDto> userDtoList = new ArrayList<>();

        for (User user : usersList) {
            userDtoList.add(modelMapper.map(user, UserDto.class));
        }

        return userDtoList;
    }

    @Override
    public List<UserDto> getUsersListJdbc() {
        List<User> usersList = userDao.findAll();
        List<UserDto> userDtoList = new ArrayList<>();

        for (User user : usersList) {
            userDtoList.add(modelMapper.map(user, UserDto.class));
        }

        return userDtoList;
    }

    @Override
    public UserDto findByEmailJpa(String email) {
        User user = userRepository.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto findByEmailJdbc(String email) {
        User user = userDao.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto findByUsernameJpa(String userName) {
        User user = userRepository.findByUserName(userName);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto findByIdJpa(long id) {
        Optional<User> user = userRepository.findById(id);
        return modelMapper.map(user, UserDto.class);
    }

    public UserDto findByIdJdbc(long id) {
        User user = userDao.findById(id);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    @Transactional // Used to inform that it is a transaction. Used during update or delete
    public void deleteByEmailJpa(String email) {
        userRepository.deleteByEmail(email);
    }

    @Override
    @Transactional // Used to inform that it is a transaction. Used during update or delete
    public void deleteByEmailJdbc(String email) {
        userDao.deleteByEmail(email);
    }

    @Override
    public boolean updateUserJpa(UserDto userDto) {
        Optional<User> optionalUser = userRepository.findById(userDto.getId());
        User existingUser = optionalUser.get();

        if (existingUser.getEmail().equalsIgnoreCase(userDto.getEmail())) {
            User user = modelMapper.map(userDto, User.class);
            userRepository.save(user);
            return true;
        } else {
            User emailUser = userRepository.findByEmail(userDto.getEmail());
            if (emailUser == null) {
                User user = modelMapper.map(userDto, User.class);
                userRepository.save(user);
                return true;
            } else {
                return false;
            }
        }
    }

    @Override
    public boolean updateUserJdbc(UserDto userDto) {
        Optional<User> optionalUser = userRepository.findById(userDto.getId());
        User existingUser = optionalUser.get();

        if (existingUser.getEmail().equalsIgnoreCase(userDto.getEmail())) {
            User user = modelMapper.map(userDto, User.class);
            userDao.updateById(userDto);
            return true;
        } else {
            User emailUser = userRepository.findByEmail(userDto.getEmail());
            if (emailUser == null) {
                User user = modelMapper.map(userDto, User.class);
                userDao.updateById(userDto);
                return true;
            } else {
                return false;
            }
        }
    }
}