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
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private UserDao userDao;

    /* ======================= REGISTER JDBC ======================= */

    public boolean saveDataJdbc(UserDto userDto) {
        User existingUser = userDao.findByEmail(userDto.getEmail());
        if (existingUser != null) {
            return false;
        }
        userDto.setPassword(passwordEncoder.encode(userDto.getPassword()));
        userDao.registerjdbc(userDto);
        return true;
    }

    /* ======================= REGISTER JPA ======================= */

    public boolean register(UserDto userDto) {
        if (userRepository.existsByEmail(userDto.getEmail())) {
            return false;
        }
        User user = modelMapper.map(userDto, User.class);
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));
        user.setUserName(userDto.getEmail());
        userRepository.save(user);
        return true;
    }


    /* ======================= LIST USERS ======================= */

    @Override
    public List<UserDto> printAllUsers() {
        List<User> users = userRepository.findAll();
        List<UserDto> result = new ArrayList<>();
        for (User user : users) {
            result.add(modelMapper.map(user, UserDto.class));
        }
        return result;
    }

    @Override
    public List<UserDto> printAllUsersJdbc() {
        List<User> users = userDao.printAllUsersJdbc();
        List<UserDto> result = new ArrayList<>();
        for (User user : users) {
            result.add(modelMapper.map(user, UserDto.class));
        }
        return result;
    }

    /* ======================= DELETE ======================= */

    @Transactional
    public void deleteByEmail(String email) {
        userRepository.deleteByEmail(email);
    }

    public void deleteByEmailJdbc(String email) {
        userDao.deleteByEmailJdbc(email);
    }

    /* ======================= PROFILE ======================= */

    public UserDto getProfile(String email) {
        User user = userRepository.findByEmail(email);
        return user == null ? null : modelMapper.map(user, UserDto.class);
    }

    public UserDto getProfileJdbc(String email) {
        User user = userDao.findByEmail(email);
        return user == null ? null : modelMapper.map(user, UserDto.class);
    }

    public UserDto findById(Long id) {
        Optional<User> user = userRepository.findById(id);
        return user.map(value -> modelMapper.map(value, UserDto.class)).orElse(null);
    }

    public UserDto findByIdJdbc(Long id) {
        User user = userDao.findById(id);
        return user == null ? null : modelMapper.map(user, UserDto.class);
    }

    public UserDto getByUsername(String username) {
        User user = userRepository.findByUserName(username);
        return modelMapper.map(user, UserDto.class);
    }

    /* ======================= UPDATE JPA ======================= */

    public boolean updateUser(UserDto userDto) {
        Optional<User> userOpt = userRepository.findById(userDto.getId());

        if (userOpt.isEmpty()) {
            return false;
        }

        User existingUser = userOpt.get();

        if (!existingUser.getEmail().equalsIgnoreCase(userDto.getEmail())) {
            if (userRepository.existsByEmail(userDto.getEmail())) {
                return false;
            }
        }

        String encodedPassword = existingUser.getPassword();
        modelMapper.map(userDto, existingUser);

        if (userDto.getPassword() == null || userDto.getPassword().isEmpty()) {
            existingUser.setPassword(encodedPassword);
        } else {
            existingUser.setPassword(passwordEncoder.encode(userDto.getPassword()));
        }

        userRepository.save(existingUser);
        return true;
    }

    /* ======================= UPDATE JDBC ======================= */

    public boolean updateUserJdbc(UserDto userDto) {
        User existingUser = userDao.findById(userDto.getId());

        if (existingUser == null) {
            return false;
        }

        if (!existingUser.getEmail().equalsIgnoreCase(userDto.getEmail())) {
            if (userDao.findByEmail(userDto.getEmail()) != null) {
                return false;
            }
        }

        if (userDto.getPassword() != null && !userDto.getPassword().isEmpty()) {
            userDto.setPassword(passwordEncoder.encode(userDto.getPassword()));
        } else {
            userDto.setPassword(existingUser.getPassword());
        }

        userDao.updateUserJdbc(userDto);
        return true;
    }
}
