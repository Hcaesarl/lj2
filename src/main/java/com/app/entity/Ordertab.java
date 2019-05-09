package com.app.entity;
public class Ordertab {
 private int id;

 private String order_id;

 private Users saler;

 private Users buy;

 private Goods gd;

 private String price;

 private String total;

 private String uid;

 private String pid;

 private String cuid;

 private String num;

 private String content;

 private String step;

 private String updated;

 private String created;

 private String status;

 private String buyer;

 private String pname;

 //联系方式
 private String tel;

 //收货地址
 private String address;

 // 订单编号
 private String code;

 //配送仓库Id
 private String ckId;


 //配送员
 private Users delivery;

 //配送车辆id
 private String truckId;

 //配送车辆
 private Truck truck;

 public int getId() {
  return id;
 }

 public void setId(int id) {
  this.id = id;
 }

 public String getOrder_id() {
  return order_id;
 }

 public void setOrder_id(String order_id) {
  this.order_id = order_id;
 }

 public Users getSaler() {
  return saler;
 }

 public void setSaler(Users saler) {
  this.saler = saler;
 }

 public Users getBuy() {
  return buy;
 }

 public void setBuy(Users buy) {
  this.buy = buy;
 }

 public Goods getGd() {
  return gd;
 }

 public void setGd(Goods gd) {
  this.gd = gd;
 }

 public String getPrice() {
  return price;
 }

 public void setPrice(String price) {
  this.price = price;
 }

 public String getTotal() {
  return total;
 }

 public void setTotal(String total) {
  this.total = total;
 }

 public String getUid() {
  return uid;
 }

 public void setUid(String uid) {
  this.uid = uid;
 }

 public String getPid() {
  return pid;
 }

 public void setPid(String pid) {
  this.pid = pid;
 }

 public String getCuid() {
  return cuid;
 }

 public void setCuid(String cuid) {
  this.cuid = cuid;
 }

 public String getNum() {
  return num;
 }

 public void setNum(String num) {
  this.num = num;
 }

 public String getContent() {
  return content;
 }

 public void setContent(String content) {
  this.content = content;
 }

 public String getStep() {
  return step;
 }

 public void setStep(String step) {
  this.step = step;
 }

 public String getUpdated() {
  return updated;
 }

 public void setUpdated(String updated) {
  this.updated = updated;
 }

 public String getCreated() {
  return created;
 }

 public void setCreated(String created) {
  this.created = created;
 }

 public String getStatus() {
  return status;
 }

 public void setStatus(String status) {
  this.status = status;
 }

 public String getBuyer() {
  return buyer;
 }

 public void setBuyer(String buyer) {
  this.buyer = buyer;
 }

 public String getPname() {
  return pname;
 }

 public void setPname(String pname) {
  this.pname = pname;
 }

 public String getTel() {
  return tel;
 }

 public void setTel(String tel) {
  this.tel = tel;
 }

 public String getAddress() {
  return address;
 }

 public void setAddress(String address) {
  this.address = address;
 }

 public String getCode() {
  return code;
 }

 public void setCode(String code) {
  this.code = code;
 }

 public String getCkId() {
  return ckId;
 }

 public void setCkId(String ckId) {
  this.ckId = ckId;
 }

 public Users getDelivery() {
  return delivery;
 }

 public void setDelivery(Users delivery) {
  this.delivery = delivery;
 }

 public Truck getTruck() {
  return truck;
 }

 public void setTruck(Truck truck) {
  this.truck = truck;
 }

 public String getTruckId() {
  return truckId;
 }

 public void setTruckId(String truckId) {
  this.truckId = truckId;
 }
}