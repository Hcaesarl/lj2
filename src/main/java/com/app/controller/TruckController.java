package com.app.controller;

import com.app.entity.Truck;
import com.app.service.CkService;
import com.app.service.TruckService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/truck")
public class TruckController {

    @Resource
    TruckService truckService;
    @Resource
    CkService ckService;


    @RequestMapping("/searchByck/{ckId}")
    @ResponseBody
    public List<Truck> searchTruckByck(@PathVariable String ckId) {
        List<Truck> trucks = truckService.searchTruckByck(ckId);

        if (trucks.size() > 0) {
            for (Truck item : trucks
            ) {
                item.setCk(ckService.getCkById(Integer.parseInt(item.getCkId())));
            }
            return trucks;
        }
        return null;
    }



}
