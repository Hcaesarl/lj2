package com.app.entity;

//���ͳ���
public class Truck {
    private Integer id;

    //��������
    private String type;

    //���ƺ�
    private String plate;

    //��ע
    private String remark;

    //�����ֿ�id
    private String ckId;

    //�����ֿ�
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
