package com.ignitershub.bharat.poc.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.google.maps.DirectionsApi;
import com.google.maps.DirectionsApiRequest;
import com.google.maps.GeoApiContext;
import com.google.maps.model.DirectionsResult;
import com.google.maps.model.TravelMode;
import com.ignitershub.bharat.poc.service.InventoryService;

@Service("inventoryService")
public class InventoryServiceImpl implements InventoryService {

	private static final Logger LOG = LoggerFactory.getLogger(InventoryServiceImpl.class);

	private static final String API_KEY = "AIzaSyBnB4wn_aLqvOUUaNyiYmWJfHsAVIfniCk";

	@Autowired
	private RestTemplate restTemplate;

	@Override
	public Map<String, Object> calculateDistanceAndDuration(Map<String, Object> calculationData) {
		 double startLat = Double.parseDouble(calculationData.get("startLat").toString());
	        double startLon = Double.parseDouble(calculationData.get("startLon").toString());
	        double endLat = Double.parseDouble(calculationData.get("endLat").toString());
	        double endLon = Double.parseDouble(calculationData.get("endLon").toString());
		GeoApiContext context = new GeoApiContext.Builder().apiKey(API_KEY).build();

		try {
			DirectionsApiRequest request = DirectionsApi.newRequest(context)
					.origin(String.format("%f,%f", startLat, startLon))
					.destination(String.format("%f,%f", endLat, endLon)).mode(TravelMode.DRIVING);

			DirectionsResult result = request.await();

			double distanceInMeters = result.routes[0].legs[0].distance.inMeters;
			double durationInSeconds = result.routes[0].legs[0].duration.inSeconds;

			double speed = distanceInMeters / durationInSeconds;

			Map<String, Object> distanceDurationMap = new HashMap<>();
			distanceDurationMap.put("distance", distanceInMeters);
			distanceDurationMap.put("speed", speed);
			distanceDurationMap.put("duration", durationInSeconds);

			return distanceDurationMap;

		} catch (Exception e) {
			e.printStackTrace();
			return null; 
	}
	}
}