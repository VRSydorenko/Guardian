package com.eurofunk.model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * Created by milechner on 22.12.2015.
 */
@Entity
public class Tour {
    private Integer id;
    private Boolean active;
    private Date startTime;
    private Date endTime;
    private Collection<TourCheckpoint> tourCheckpoints;

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column
    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    @Column
    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    @Column
    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL)
    public Collection<TourCheckpoint> getTourCheckpoints() {
        return tourCheckpoints;
    }

    public void setTourCheckpoints(Collection<TourCheckpoint> tourCheckpoints) {
        this.tourCheckpoints = tourCheckpoints;
    }
}
