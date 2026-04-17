package com.ust.pos.service.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.*;
import com.ust.pos.service.UserService;
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
    CommonRepository commonRepository;

    @Autowired
    UserDao userDao;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public boolean createUser(UserDto userDto) {
        User user = userRepository.findByEmail(userDto.getEmail());
        if (user == null) {
            User user2 = modelMapper.map(userDto, User.class);
            user2.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(user2);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean createUserJdbc(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            userDao.createUser(userDto);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<UserDto> allUsersDto() {
        List<UserDto> userDtoList = new ArrayList<>();
        List<User> allUser = userRepository.findAll();
        for (User user : allUser){
            UserDto userDto = modelMapper.map(user,UserDto.class);
            List<String> stringList = user.getRoleIds()== null ? List.of() : user.getRoleIds().stream().map(id -> roleRepository.findById(id).map(Role::getName).orElse(null)).toList();
            userDto.setRoleListString(stringList);
            userDtoList.add(userDto);
        }
        return userDtoList;
    }

    @Override
    public List<UserDto> allUsersDtoJdbc() {
        return userDao.getAllUser();
    }

    @Override
    public UserDto getByEmailJdbc(String email) {
       User user = userDao.findByEmail(email);
       return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto getByEmailJpa(String email) {
       User user = userRepository.findByEmail(email);
       return modelMapper.map(user, UserDto.class);
    }

    @Override
    public void deleteByEmailJpa(String email) {
        User user = userRepository.findByEmail(email);
        userRepository.deleteById(user.getId());
    }

    @Override
    public void deleteByEmailJdbc(String email) {
        userDao.deleteUserByEmail(email);
    }

    @Override
    public UserDto getUserByidJpa(Long id) {
        Optional<User> userOptional = userRepository.findById(id);
        if(userOptional.isPresent()) {
            return modelMapper.map(userOptional.get(), UserDto.class);
        }
        return null;
    }

    @Override
    public UserDto getUserByidJdbc(Long id) {
        User user = userDao.findById(id);
        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public boolean updateUserByid(UserDto userDto) {
        Optional<User> userOptional = userRepository.findById(userDto.getId());
        User userWithSameMail = userRepository.findByEmail(userDto.getEmail());

        if(userWithSameMail!=null){
            if(userDto.getId()==userWithSameMail.getId()){
                userOptional.get().setRoleIds(null);
                modelMapper.map(userDto, userOptional.get());
                userOptional.get().setPassword(passwordEncoder.encode(userDto.getPassword()));
                userRepository.save(userOptional.get());
                return true;
            }
        }else {
            userOptional.get().setRoleIds(null);
            modelMapper.map(userDto, userOptional.get());
            userOptional.get().setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(userOptional.get());
            return true;
        }

        return false;
    }

    public boolean updateUserByid2(UserDto userDto) {
        Optional<User> userOptional = userRepository.findById(userDto.getId());
        User existingUser = userOptional.get();

        if(existingUser!=null){
            if(existingUser.getEmail().equalsIgnoreCase(userDto.getEmail())){
                modelMapper.map(userDto, existingUser);
                userRepository.save(existingUser);
                return true;
            }
            else {
                if(userRepository.findByEmail(userDto.getEmail())==null){
                    modelMapper.map(userDto, existingUser);
                    userRepository.save(existingUser);
                    return true;
                }
            }
        }

        return false;
    }

    @Override
    public boolean updateUserByIdJdbc(UserDto userDto) {
        User user = userDao.findById(userDto.getId());
        User userWithSameMail = userDao.findByEmail(userDto.getEmail());

        if(userWithSameMail!=null){
            if(userDto.getId()==userWithSameMail.getId()){
                userDao.updateUser(userDto);
                return true;
            }
        }else {
            userDao.updateUser(userDto);
            return true;
        }
        return false;
    }

    @Override
    public List<UserDto> findByRoleId(Long id) {
        List<User> userList = userRepository.findByRoleId(id);
        List<UserDto> userDtoList = new ArrayList<>();
        for (User user : userList){
            UserDto userDto = modelMapper.map(user,UserDto.class);
            userDtoList.add(userDto);
        }
       return userDtoList;
    }

    @Override
    public UserDto getUserByUserName(String userName) {
       User user = userRepository.findByUserName(userName);
       return modelMapper.map(user,UserDto.class);
    }
}
