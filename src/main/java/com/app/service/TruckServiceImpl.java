package com.app.service;

import com.app.entity.Truck;
import com.app.mapper.TruckDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TruckServiceImpl implements TruckService {
	@Resource
	TruckDAO truckDAO;

	@Override
	public List<Truck> searchTruckByck(String ckId) {
		return truckDAO.searchTruckByck(ckId);
	}
}
