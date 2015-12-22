package com.eurofunk.repositories;

import com.eurofunk.model.Checkpoint;
import com.eurofunk.model.Tour;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by milechner on 22.12.2015.
 */
public interface CheckpointRepository extends CrudRepository<Checkpoint, Integer> {

}
