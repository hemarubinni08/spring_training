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
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public boolean updateUserDetailsById(UserDto userDto) {

        if (existsByEmail(userDto.getEmail())) {
            return false;
        } else {
            User updated = modelMapper.map(userDto, User.class);
            updated.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(updated);
            return true;
        }
    }

    @Override
    public boolean existsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }

    @Override
    public boolean createUserJdbc(UserDto userDto) {
        User user = userDao.findUserByEmailJdbc(userDto.getEmail());

        if (user == null) {
            userDao.createUserJdbc(userDto);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<UserDto> retrieveAllRecords(UserDto userDto) {

        List<User> userList = userDao.retrieveAllRecords(userDto);
        return userList.stream().map(user -> modelMapper.map(user, UserDto.class)).toList();
    }

    @Override
    public List<UserDto> retrieveAllRecordsDto() {

        List<User> userList = userRepository.findAll();
        return userList.stream().map(user -> modelMapper.map(user, UserDto.class)).toList();
    }

    @Override
    public UserDto getUserByEmailId(String email) {

        User user = userRepository.findByEmail(email);
        UserDto userRecord = modelMapper.map(user, UserDto.class);
        return userRecord;
    }

    @Override
    public UserDto getUsersByEmailIdPath(String email) {

        User user = userDao.findUserByEmailJdbc(email);
        UserDto userRecord = modelMapper.map(user, UserDto.class);
        return userRecord;
    }

    @Override
    public UserDto getUsersByEmailIdJdbc(String email) {

        User user = userDao.findUserByEmailJdbc(email);
        UserDto userRecord = modelMapper.map(user, UserDto.class);
        return userRecord;
    }

    @Override
    @Transactional
    public void deleteUsersByEmailId(String email) {

        userRepository.deleteByEmail(email);
    }

    @Override
    @Transactional
    public void deleteUsersByEmailIdJdbc(String email) {

        userDao.deleteByEmailJdbc((email));
    }

    @Override
    public UserDto findById(long id) {

        Optional<User> userOptional = userRepository.findById(id);
        User user = userOptional.get();
        UserDto userRecord = modelMapper.map(user, UserDto.class);
        return userRecord;
    }

    @Override
    public UserDto getUsersByIdJdbc(long id) {

        User user = userDao.findByIdJdbc(id);
        UserDto userRecord = modelMapper.map(user, UserDto.class);
        return userRecord;
    }

    @Override
    public UserDto updateUserRecord(UserDto userDto) {

        User existingUser = userRepository.findById((long) userDto.getId())
                .orElseThrow(() -> new RuntimeException("User not found"));

        if (!existingUser.getEmail().equals(userDto.getEmail())) {
            if (userRepository.existsByEmail(userDto.getEmail())) {
                return null;
            }
            existingUser.setEmail(userDto.getEmail());
        }
        existingUser.setName(userDto.getName());
        existingUser.setPhoneNo(userDto.getPhoneNo());
        existingUser.setUserName(userDto.getUserName());
        existingUser.setAge(userDto.getAge());
        existingUser.setRole(userDto.getRole());
        existingUser.setRoles(userDto.getRoles());
        User savedUser = userRepository.save(existingUser);
        return modelMapper.map(savedUser, UserDto.class);
    }

    public UserDto updateUserRecordJdbc(UserDto userDto) {

        User existingUser = userDao.findByIdJdbc((long) userDto.getId());

        if (existingUser == null) {
            return null;
        }

        if (!existingUser.getEmail().equals(userDto.getEmail())) {
            if (userDao.findUserByEmailJdbc(userDto.getEmail()) != null) {
                return null;
            }
            existingUser.setEmail(userDto.getEmail());
        }
        existingUser.setName(userDto.getName());
        existingUser.setPhoneNo(userDto.getPhoneNo());
        existingUser.setUserName(userDto.getUserName());
        existingUser.setAge(userDto.getAge());
        existingUser.setRole(userDto.getRole());
        existingUser.setRoles(userDto.getRoles());
        userDao.updateUserRecord(existingUser);
        User userDetails = userDao.findByIdJdbc(userDto.getId());
        UserDto userRecord = modelMapper.map(userDetails, UserDto.class);
        return userRecord;
    }

    @Override
    public boolean checkLoginDetails(UserDto userDto) {

        return false;
    }

    @Override
    public UserDto findByUsername(String userName) {

        return modelMapper.map(userRepository.findByUserName(userName), UserDto.class);
    }


}



