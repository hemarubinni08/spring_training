package com.ust.pos.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class NodeDto {
    private long id;
    private String name;
    private String path;
    private List<Long> roleIds;
}
