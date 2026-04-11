package com.ust.pos.dto;

import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Table
@Getter
@Setter
public class NodeDto {
    private long id;
    private String name;
    private String path;
    private String message;
}
