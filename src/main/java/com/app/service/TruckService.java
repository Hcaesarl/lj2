package com.app.service;

import com.app.entity.Ck;
import com.app.entity.Truck;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TruckService {


    public List<Truck> searchTruckByck(String ckId);


}
