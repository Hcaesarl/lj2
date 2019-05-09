package com.app.mapper;

import com.app.entity.Truck;

import java.util.List;

public interface TruckDAO {

    public List<Truck> searchTruckByck(String ckId);
}
