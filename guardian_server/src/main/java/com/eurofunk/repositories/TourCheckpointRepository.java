package com.eurofunk.repositories;

import com.eurofunk.model.Checkpoint;
import com.eurofunk.model.Tour;
import com.eurofunk.model.TourCheckpoint;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by milechner on 22.12.2015.
 */
public interface TourCheckpointRepository extends CrudRepository<TourCheckpoint, Integer> {

}
