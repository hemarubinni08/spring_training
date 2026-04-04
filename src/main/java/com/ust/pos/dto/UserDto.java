package com.ust.pos.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class UserDto {
    private int id;
    private String name;
    private String email;
    private String phoneNo;
    private String userName;
    private String password;
    private int age;
    private Date dateOfBirth;
    private boolean isSuccess=true;
    private boolean userSuccess=true;

}
