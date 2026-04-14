package com.ust.pos.dto;

import java.util.List;

public class NodeDto extends CommonDto{

    private String path;
    private List<String> role;

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
