package com.ust.pos.dto;

import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
@Getter
@Setter
@MappedSuperclass
public class CommonDto {
    private long id;
    private String name;
    private String message;
    private String colour;
    private String message2;
}
