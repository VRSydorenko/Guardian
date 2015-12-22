package com.eurofunk.rest;

import com.eurofunk.model.Checkpoint;
import com.eurofunk.model.Tour;
import com.eurofunk.model.TourCheckpoint;
import com.eurofunk.repositories.CheckpointRepository;
import com.eurofunk.repositories.TourCheckpointRepository;
import com.eurofunk.repositories.TourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by milechner on 22.12.2015.
 */
@RequestMapping("/tour")
@RestController
public class TourController {

    @Autowired
    private TourRepository tourRepository;
    @Autowired
    private CheckpointRepository checkpointRepository;
    @Autowired
    private TourCheckpointRepository tourCheckpointRepository;


    @RequestMapping(value = "/{tour_id}/beacon/{beacon_id}/reached", method = RequestMethod.GET)
    @ResponseBody
    public String finishIncident(@PathVariable("tour_id") final String tourId, @PathVariable("beacon_id") final String beaconId) {
        final List<Tour> tours = tourRepository.findByActive(true);
        return "tour: "+tourId+", beacon: "+tours.size();
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    @ResponseBody
    public Tour getActiveTour() {
        final List<Tour> tours = tourRepository.findByActive(true);
        if (tours.size() > 0) {
            return tours.get(0);
        } else {
            return null;
        }
    }

    @RequestMapping(value = "/start", method = RequestMethod.GET)
    @ResponseBody
    public Tour startNewTour() {
        //we can't start a new tour if there is already an active tour
        Tour alreadyActiveTour = getActiveTour();
        if (alreadyActiveTour != null) {
            return alreadyActiveTour;
        }

        //create a new tour
        Tour tour = new Tour();
        tour.setActive(true);
        tour.setStartTime(new Date());
        tour = tourRepository.save(tour);

        List<TourCheckpoint> tourCheckpoints = new ArrayList<>();
        List<Checkpoint> allCheckpoints = new ArrayList<>();
        checkpointRepository.findAll().forEach(allCheckpoints::add);
        for (Checkpoint checkpoint : allCheckpoints) {
            TourCheckpoint tourCheckpoint = new TourCheckpoint();
            tourCheckpoint.setTour(tour);
            tourCheckpoint.setCheckpoint(checkpoint);
            tourCheckpoint.setStatus(TourCheckpoint.Status.NOT_VISITED);

            tourCheckpoint = tourCheckpointRepository.save(tourCheckpoint);
            tourCheckpoints.add(tourCheckpoint);
        }

        tour.setTourCheckpoints(tourCheckpoints);
        return tour;
    }

    @RequestMapping(value = "/finish", method = RequestMethod.GET)
    @ResponseBody
    public String finishTour() {
        Tour tour = getActiveTour();
        if (tour != null) {
            tour.setEndTime(new Date());
            tour.setActive(false);
            tourRepository.save(tour);
        }
        return null;
    }

    @RequestMapping(value = "/tour_checkpoints", method = RequestMethod.POST)
    @ResponseBody
    public TourCheckpoint saveTourCheckpoint(@RequestBody TourCheckpoint tourCheckpoint) {
        TourCheckpoint dbTourCheckpoint = tourCheckpointRepository.findOne(tourCheckpoint.getId());
        dbTourCheckpoint.setComment(tourCheckpoint.getComment());
        dbTourCheckpoint.setStatus(tourCheckpoint.getStatus());
        dbTourCheckpoint.setTimestamp(new Date());
        dbTourCheckpoint = tourCheckpointRepository.save(dbTourCheckpoint);
        return dbTourCheckpoint;
    }
}
