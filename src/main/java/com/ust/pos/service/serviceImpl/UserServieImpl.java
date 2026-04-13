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
import java.util.List;
import java.util.Optional;

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

    @Override
    public UserDto updateUniqueUser(UserDto userDto) {
        User user = userRepository.findByEmail(userDto.getEmail());
        if (user == null) {
            User usertemp = modelMapper.map(userDto, User.class);
            usertemp.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(usertemp);
            userDto.setMessage("User Registered Successfully....!");
            userDto.setColour("green");
            userDto.setMessage2("Your account has been created successfully.");

        } else {
            userDto.setMessage("User With This Email Already Exists...!");
            userDto.setColour("red");
            userDto.setMessage2("Please try to use a different Email.");
        }
        return userDto;
    }

    @Override
    public boolean createUserUsingDao(UserDto userDto) {
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
        //userDetailsList.forEach(System.out::println);
        List<UserDto> userDtoDetailsList = new ArrayList<>();
        for(User user :userDetailsList){
            userDtoDetailsList.add(modelMapper.map(user, UserDto.class));
        }
        return userDtoDetailsList;
    }

    @Override
    public List<UserDto> getAllUsersDetailsUsingJpa() {
        List<User> userDetailsList = userRepository.findAll();
        List<UserDto> userDtoDetailsList = new ArrayList<>();
        for(User user :userDetailsList){
            userDtoDetailsList.add(modelMapper.map(user, UserDto.class));
        }
        return userDtoDetailsList;
    }

    @Override
    public UserDto getUserDetailsUsingJdbc(String email) {
        User user=userDao.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto getUserDetailsUsingJpa(String email) {
        User user=userRepository.findByEmail(email);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto getUserDetailsUsingJdbcByid(long id){
        User user = userDao.findById(id);
        if(user != null){
            return modelMapper.map(user, UserDto.class);
        }
        return new UserDto();
    }

    @Override
    public UserDto getUserDetailsUsingJpaByid(long id){
        Optional<User> user = userRepository.findById(id);
        if(user.isPresent()) {
            return modelMapper.map(user.get(), UserDto.class);
        }
        return new UserDto();
    }

    @Override
    public void deleteUserDetailsUsingJdbc(String email) {
        userDao.deleteByEmail(email);
    }

    @Override
    public void deleteUserDetailsUsingJpa(String email) {
        userRepository.deleteByEmail(email);
    }

    @Override
    public UserDto updateUserDetailsUsingJdbc(UserDto userDto){
        User existingUserWithEmail = userDao.findByEmail(userDto.getEmail());

        if (existingUserWithEmail != null &&
                existingUserWithEmail.getId() != userDto.getId()) {
            userDto=getUserDetailsUsingJdbcByid(userDto.getId());
            userDto.setMessage("Email already exists. Please use a different email.");
            userDto.setColour("red");
            return userDto;
        }
        boolean updated = userDao.updateUserDetails(userDto);

        if(updated){
            userDto.setMessage("User details updated successfully!");
            userDto.setColour("green");
        }
        else{
            userDto.setMessage("User not found. Update failed.");
            userDto.setColour("red");
        }
        return userDto;
    }

    @Override
    public UserDto updateUserDetailsUsingJpa(UserDto userDto){
        boolean emailExists = userRepository.existsByEmailAndIdNot(userDto.getEmail(), userDto.getId());
        if (emailExists) {
            userDto.setMessage("Email already exists. Please use a different email.");
            userDto.setColour("red");
            return userDto;
        }

        // ✅ Fetch existing user
        Optional<User> userOpt = userRepository.findById(userDto.getId());

        if (userOpt.isEmpty()) {
            userDto.setMessage("User not found. Update failed.");
            userDto.setColour("red");
            return userDto;
        }

        User user = userOpt.get();

        // ✅ Update fields
        user.setEmail(userDto.getEmail());
        user.setName(userDto.getName());
        // set other fields

        userRepository.save(user);

        userDto.setMessage("User details updated successfully!");
        userDto.setColour("green");

        return userDto;
    }
}
