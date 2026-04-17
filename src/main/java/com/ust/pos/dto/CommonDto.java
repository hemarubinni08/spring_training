package com.ust.pos.dto;

import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;

@MappedSuperclass
@Getter
@Setter
public class CommonDto {
    private long id;
    private String name;
}