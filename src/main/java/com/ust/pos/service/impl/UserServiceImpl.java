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

@Service

public class UserServiceImpl implements UserService {

    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    UserDao userDao;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public boolean UpdateByUserName(UserDto userDto) {

        if (existsByEmail(userDto.getEmail())) {
            return false;
        } else {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword((passwordEncoder.encode(userDto.getPassword())));
            userRepository.save(user);
            return true;
        }
    }

    @Override
    public boolean registerJdbc(UserDto userDto) {

        if (userRepository.existsByEmail(userDto.getEmail())) {
            return false;
        } else {
            User user = modelMapper.map(userDto, User.class);
            user.setPassword((passwordEncoder.encode(userDto.getPassword())));
            userDao.registerJdbc(userDto);
            return true;
        }
    }

    @Override
    public boolean existsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }

    @Override
    public boolean createUserJdbc(UserDto userDto) {
        User user = userDao.existsByEmailJdbc(userDto.getEmail());

        if (user == null) {
            userDao.registerJdbc(userDto);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<UserDto> getAllUsers() {
        List<User> userList = userDao.userRecJdbc();
        List<UserDto> userDtoList = userList.stream().map(user -> modelMapper.map(user, UserDto.class)).toList();
        return userDtoList;
    }

    @Override
    public List<UserDto> getAllUsersJpa() {
        List<User> userList = userRepository.findAll();
        List<UserDto> userDtoList = userList.stream().map(user -> modelMapper.map(user, UserDto.class)).toList();
        return userDtoList;
    }

    @Override
    public UserDto findUserRecord(String email) {
        User user = userRepository.findByEmail(email);

        if (user == null) {
            return null;
        }
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto findUserRecordJdbc(String email) {
        User user = userDao.existsByEmailJdbc(email);

        if (user == null) {
            return null;
        }
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto findByEmail(String email) {
        User user = userRepository.findByEmail(email);

        if (user == null) {
            return null;
        }
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    @Transactional
    public UserDto deleteByEmailService(String email) {
        return modelMapper.map(userRepository.deleteByEmail(email), UserDto.class);
    }

    @Override
    public boolean deleteByEmailServiceJdbc(String email) {
        return userDao.deleteByEmailJdbc(email);
    }

    @Override
    public UserDto getByIdService(Long id) {
        User user = userRepository.getById(id);

        if (user == null) {
            return null;
        }
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto getByIdServiceJdbc(long id) {
        User user = userDao.findByIdJdbc(id);

        if (user == null) {
            return null;
        }
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto updateByIdService(UserDto userDto) {
        User user = userRepository.getById(userDto.getId());

        if (!user.getEmail().equals(userDto.getEmail())) {
            return null;
        }
        User user1 = modelMapper.map(userDto, User.class);
        user1.setPassword((passwordEncoder.encode(userDto.getPassword())));
        User updateUser = userRepository.save(user1);
        return modelMapper.map(updateUser, UserDto.class);
    }

    @Override
    public UserDto updateUserJdbc(UserDto userDto) {
        User user = userRepository.getById(userDto.getId());

        if (!user.getEmail().equals(userDto.getEmail())) {
            return null;
        }
        userDao.updateByIdd(userDto);
        return userDto;
    }

    @Override
    public UserDto getUserByUserName(String userName) {
        User user=userRepository.findByUserName(userName);
        return modelMapper.map(user,UserDto.class);
    }

    @Override
    public UserDto findByEmailJdbc(String email) {
        User user = userDao.findByEmail(email);
        return modelMapper.map(user,UserDto.class);
    }
}