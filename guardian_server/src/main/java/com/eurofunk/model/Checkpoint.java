package com.eurofunk.model;

import javax.persistence.*;

/**
 * Created by milechner on 22.12.2015.
 */
@Entity
public class Checkpoint {
    private Integer id;
    private String name;

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
