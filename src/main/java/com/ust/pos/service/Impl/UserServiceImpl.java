package com.ust.pos.service.Impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Autowired
    private final UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private final ModelMapper modelMapper;

    public UserServiceImpl(UserRepository userRepository, ModelMapper modelMapper) {
        this.userRepository = userRepository;
        this.modelMapper = modelMapper;
    }

    @Override
    public UserDto createUser(UserDto userDto) {
        User existingUser = userRepository.findByEmail(userDto.getEmail());
        if (existingUser == null) {
            User usertemp = modelMapper.map(userDto, User.class);
            usertemp.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(usertemp);
            userDto.setMessage("Added Successfully");

        } else {
            userDto.setMessage("Email Already Exist!");
        }
        return userDto;
    }

    @Override
    public UserDto createUserJdbc(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            String encodedPassword = passwordEncoder.encode(userDto.getPassword());
            userDto.setPassword(encodedPassword);
            userDao.createUserJdbc(userDto);
            userDto.setMessage("ADDED SUCCESSFULLY!");
        } else {
            userDto.setMessage("Email Already Exists!");
        }
        return userDto;
    }

    @Override
    public List<UserDto> findAllUsers() {
        List<User> user = userRepository.findAll();
        List<UserDto> totalUser = new ArrayList<>();
        for (User detail : user) {
            totalUser.add(modelMapper.map(detail, UserDto.class));
        }
        return totalUser;
    }

    public List<UserDto> findAllUsersJdbc() {
        List<User> user = userDao.findAllUsersJdbc();
        List<UserDto> totalUser = new ArrayList<>();
        for (User detail : user) {
            totalUser.add(modelMapper.map(detail, UserDto.class));
        }
        return totalUser;
    }

    @Override
    public UserDto findByEmail(String email) {
        User user = userRepository.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    public UserDto findByEmailJdbc(String email) {
        User user = userDao.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }


    @Transactional
    public void deleteByEmailJpa(Long id) {
        userRepository.deleteById(id);
    }

    @Override
    public UserDto findById(Long id) {

        User user = userRepository.findById(id).orElseThrow();
        return modelMapper.map(user, UserDto.class);

    }

    @Override
    public UserDto editUserProfile(UserDto userDto) {

        User user = userRepository.findById(userDto.getId()).orElseThrow();
        if (!user.getEmail().equals(userDto.getEmail())) {

            User existingUser = userRepository.findByEmail(userDto.getEmail());

            if (existingUser != null) {
                userDto.setMessage("Email already exists");
                return userDto;
            }
            user.setEmail(userDto.getEmail());
        }
        modelMapper.map(userDto, User.class);
        user.setRoles(userDto.getRoles());
        userRepository.save(user);
        return userDto;
    }
}

