package com.ust.pos.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface CommonRepository<T extends CommonAttributes, Long> extends JpaRepository<T, Long> {
    T findByName(String name);
}
