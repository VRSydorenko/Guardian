package com.eurofunk.rest;

import com.eurofunk.model.Checkpoint;
import com.eurofunk.model.Tour;
import com.eurofunk.model.TourCheckpoint;
import com.eurofunk.repositories.CheckpointRepository;
import com.eurofunk.repositories.TourCheckpointRepository;
import com.eurofunk.repositories.TourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by milechner on 22.12.2015.
 */
@RequestMapping("/checkpoint")
@RestController
public class CheckpointController {
    @Autowired
    private CheckpointRepository checkpointRepository;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Checkpoint getCheckpointById(@PathVariable("id") Integer checkpointId) {
        return checkpointRepository.findOne(checkpointId);
    }
}
