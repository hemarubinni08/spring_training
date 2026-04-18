package com.ust.pos.service;

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
import java.util.Optional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserDao userDao;

    @Override
    public UserDto register(UserDto userDto) {

        User user = userRepository.findByEmail(userDto.getEmail());
        if (user == null) {
            User usertemp = modelMapper.map(userDto, User.class);
            usertemp.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(usertemp);
            userDto.setMessage("✅ Added Successfully");
            userDto.setColour("green");
            userDto.setMessage2("Your account has been created successfully!");
        } else {
            userDto.setMessage("❌ Email Already Exist!");
            userDto.setColour("red");
            userDto.setMessage2("Please use a different email id");
        }

        return userDto;
    }

    @Override
    public UserDto createUserUsingJdbc(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {

            userDao.register(userDto);
            userDto.setMessage("✅ Added Successfully");
            userDto.setColour("green");
            userDto.setMessage2("Your account has been created successfully!");

        } else {

            userDto.setMessage("❌ EMAIL ALREADY EXISTS!");
            userDto.setColour("red");
            userDto.setMessage2("PLEASE USE A DIFFERENT EMAIL ID!!!");
        }

        return userDto;
    }

    @Override
    public List<UserDto> getAllUsers() {
        List<User> users = userRepository.findAll();
        List<UserDto> resultDto = new ArrayList<>();
        for (User user : users) {
            UserDto userDto = modelMapper.map(user, UserDto.class);
            resultDto.add(userDto);
        }
        return resultDto;
    }

    @Override
    public List<UserDto> displayValuesJdbc() {
        List<User> users = userDao.findAllUsersJdbc();

        List<UserDto> resultDto = new ArrayList<>();
        for (User user : users) {
            UserDto userDto1 = modelMapper.map(user, UserDto.class);
            resultDto.add(userDto1);
        }
        return resultDto;
    }

    @Override
    public UserDto findByEmailPage(String email) {
        User user = userRepository.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto findByEmailPageJdbc(String email) {
        User user = userDao.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public void deleteByEmail(String email) {
        userRepository.deleteByEmail(email);
    }

    @Override
    public void deleteByEmailJdbc(String email) {
        userDao.deleteByEmailJdbc(email);
    }

    @Override
    public UserDto findById(Long id) {
        Optional<User> user = userRepository.findById(id);
        if (user.isPresent()) {
            return modelMapper.map(user.get(), UserDto.class);
        }
        return null;
    }

    @Override
    public UserDto findByIdJdbc(Long id) {
        User user = userDao.findById(id);
        if (user != null) {
            return modelMapper.map(user, UserDto.class);
        }
        return new UserDto();
    }

    @Override
    public UserDto edit(UserDto userDto) {
        User existingUserWithEmail = userRepository.findByEmail(userDto.getEmail());
        String existingPassword=existingUserWithEmail.getPassword();
        if (existingUserWithEmail != null &&
                existingUserWithEmail.getId() != userDto.getId()) {
            return userDto;
        }

        User user = modelMapper.map(userDto, User.class);
        user.setPassword(existingPassword);
        userRepository.save(user);

        return userDto;

    }

    @Override
    public UserDto editJdbc(UserDto userDto) {
        User existingUserWithEmail = userDao.findByEmail(userDto.getEmail());

        if (existingUserWithEmail != null &&
                existingUserWithEmail.getId() != userDto.getId()) {
            return userDto;
        }
        userDao.edit(userDto);
        return userDto;
    }

    public List<UserDto> findByRoleName(String roleName) {
        List<User> userRoleList = userRepository.findByRoleName(roleName);
        List<UserDto> resultDto = new ArrayList<>();
        for (User user : userRoleList) {
            UserDto userDto1 = modelMapper.map(user, UserDto.class);
            resultDto.add(userDto1);
        }
        return resultDto;
    }

    public List<UserDto> findByRoleNames(String roleName) {
        List<User> userRoleList = userRepository.findByRoleNames(roleName);
        List<UserDto> resultDto = new ArrayList<>();
        for (User user : userRoleList) {
            UserDto userDto1 = modelMapper.map(user, UserDto.class);
            resultDto.add(userDto1);
        }
        return resultDto;
    }

    @Override
    public UserDto getUserByUsername(String userName) {
        User user = userRepository.findByUserName(userName);
        return modelMapper.map(user,UserDto.class);
    }

}