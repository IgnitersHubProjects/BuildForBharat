package com.ignitershub.bharat.poc.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ignitershub.bharat.poc.data.GenericResponse;
import com.ignitershub.bharat.poc.service.InventoryService;

@RestController
@RequestMapping("/inventory")
@CrossOrigin(origins = "*")
public class GeoApiController {

	@Autowired
	private InventoryService inventoryService;

	@PostMapping("/calculation")
	public ResponseEntity<GenericResponse<?>> calculation(@RequestBody Map<String, Object> calculationData) {
	        Map<String, Object> result = inventoryService.calculateDistanceAndDuration(calculationData);
	        if (result != null) {
	        	System.out.println("result=="+result);
	            return new ResponseEntity<>(
	                    new GenericResponse<>(200, HttpStatus.OK.name(),
	                            "Successfully calculated AADS and MVD", result),
	                    HttpStatus.OK);
	        } else {
	            return new ResponseEntity<>(
	                    new GenericResponse<>(500, HttpStatus.INTERNAL_SERVER_ERROR.name(),
	                            "Error calculating AADS and MVD", null),
	                    HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	}

}
