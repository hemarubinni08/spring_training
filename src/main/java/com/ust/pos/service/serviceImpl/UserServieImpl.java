package com.ust.pos.service.serviceImpl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service

public class UserServieImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    //USING JPA
    @Override
    public UserDto createUser(UserDto userDto) {
        User user = userRepository.findByEmail(userDto.getEmail());
        if (user == null) {
            User usertemp = modelMapper.map(userDto, User.class);
            usertemp.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(usertemp);
            userDto.setMessage("User Registered Successfully!");
            userDto.setColour("green");
            userDto.setMessage2("Redirecting to Users List page");
        } else {
            userDto.setMessage("User With This Email Already Exists...!");
            userDto.setColour("red");
            userDto.setMessage2("Please try to use a different Email.");
        }
        return userDto;
    }

    @Override
    public List<UserDto> getAllUsersDetails() {
        List<User> users = userRepository.findAll();
        List<UserDto> dtoList = new ArrayList<>();
        for (User user : users) {
            UserDto dto = modelMapper.map(user, UserDto.class);
            if (user.getRoles() != null && !user.getRoles().isEmpty()) {
                dto.setRoles(
                        Arrays.asList(user.getRoles().split(","))
                );
            }
            dtoList.add(dto);
        }
        return dtoList;
    }

    @Override
    public UserDto getUserDetails(String email) {
        User user = userRepository.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto getUserDetailsById(long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user == null) {
            return null;
        }
        UserDto dto = modelMapper.map(user, UserDto.class);
        if (user.getRoles() != null && !user.getRoles().isEmpty()) {
            dto.setRoles(
                    Arrays.asList(user.getRoles().split(","))
            );
        }
        return dto;
    }

    @Override
    public UserDto updateUserDetails(UserDto userDto) {
        boolean emailExists = userRepository.existsByEmailAndIdNot(userDto.getEmail(), userDto.getId());
        if (emailExists) {
            UserDto resultDto = getUserDetailsById(userDto.getId());
            resultDto.setMessage("Email already exists. Please use a different email.");
            resultDto.setColour("red");
            return resultDto;
        }
        User user = userRepository.findById(userDto.getId()).orElse(null);
        if (user == null) {
            userDto.setMessage("User not found. Update failed.");
            userDto.setColour("red");
            return userDto;
        }
        modelMapper.map(userDto, user);
        if (userDto.getRoles() != null) {
            user.setRoles(String.join(",", userDto.getRoles()));
        }
        userRepository.save(user);
        UserDto responseDto = modelMapper.map(user, UserDto.class);
        if (user.getRoles() != null) {
            responseDto.setRoles(
                    Arrays.asList(user.getRoles().split(","))
            );
        }

        responseDto.setMessage("User details updated successfully!");
        responseDto.setColour("green");
        return responseDto;
    }

    @Override
    public List<UserDto> getAllUsersByRoleName(String roleName) {

        List<User> userRoleList = userRepository.findByRoleName(roleName);

        List<UserDto> resultDtoList = new ArrayList<>();

        for (User user : userRoleList) {
            UserDto userDto = modelMapper.map(user, UserDto.class);
            resultDtoList.add(userDto);
        }
        return resultDtoList;
    }

    @Override
    public void deleteUser(String email) {
        userRepository.deleteByEmail(email);
    }

    //Using Jdbc
    @Override
    public boolean createUserUsingJdbc(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            userDao.createUser(userDto);
            userDto.setMessage("User Registered Successfully....!");
            userDto.setColour("green");
            userDto.setMessage2("Your account has been created successfully.");
        } else {
            userDto.setMessage("User With This Email Already Exists...!");
            userDto.setColour("red");
            userDto.setMessage2("Please try to use a different Email.");
        }
        return false;
    }

    @Override
    public List<UserDto> getAllUsersDetailsUsingJdbc() {
        List<User> userDetailsList = userDao.getAllUsers();
        List<UserDto> userDtoDetailsList = new ArrayList<>();
        for (User user : userDetailsList) {
            userDtoDetailsList.add(modelMapper.map(user, UserDto.class));
        }
        return userDtoDetailsList;
    }

    @Override
    public UserDto updateUserDetailsUsingJdbc(UserDto userDto) {
        User existingUserWithEmail = userDao.findByEmail(userDto.getEmail());
        if (existingUserWithEmail != null &&
                existingUserWithEmail.getId() != userDto.getId()) {
            userDto = getUserDetailsUsingJdbcByid(userDto.getId());
            userDto.setMessage("Email already exists. Please use a different email.");
            userDto.setColour("red");
            return userDto;
        }
        boolean updated = userDao.updateUserDetails(userDto);
        if (updated) {
            userDto.setMessage("User details updated successfully!");
            userDto.setColour("green");
        } else {
            userDto.setMessage("User not found. Update failed.");
            userDto.setColour("red");
        }
        return userDto;
    }

    @Override
    public UserDto getUserDetailsUsingJdbc(String email) {
        User user = userDao.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto getUserDetailsUsingJdbcByid(long id) {
        User user = userDao.findById(id);
        if (user == null) {
            return new UserDto();
        }
        UserDto dto = modelMapper.map(user, UserDto.class);
        if (user.getRoles() != null && !user.getRoles().isEmpty()) {
            dto.setRoles(Arrays.asList(user.getRoles().split(",")));
        }
        return dto;
    }

    @Override
    public void deleteUserDetailsUsingJdbc(String email) {
        userDao.deleteByEmail(email);
    }
}
