package com.app.entity;

//配送车辆
public class Truck {
    private Integer id;

    //车辆类型
    private String type;

    //车牌号
    private String plate;

    //备注
    private String remark;

    //所属仓库id
    private String ckId;

    //所属仓库
    private Ck ck;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPlate() {
        return plate;
    }

    public void setPlate(String plate) {
        this.plate = plate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCkId() {
        return ckId;
    }

    public void setCkId(String ckId) {
        this.ckId = ckId;
    }

    public Ck getCk() {
        return ck;
    }

    public void setCk(Ck ck) {
        this.ck = ck;
    }
}
