package com.app.entity;
public class Goods {

 private int id;

 private String uid;

 private Users u;

 private Infocate c;

 private String code;

 private String product_name;

 private String description;

 private String thumb;

 private String content;

 private String category_name;

 private String click;

 private String category;

 private String store;

 private String vpath;

 private String price;

 private String created;

 private String updated;

 private String status;

 //是否为电器
 private String isElectric;

 //是否经过安全审核
 private String isReview;

 //地区
 private String areas;

 //类别名称（仅用于查询结果显示）
 private String categoryName;


 public int getId() {
  return id;
 }

 public void setId(int id) {
  this.id = id;
 }

 public String getUid() {
  return uid;
 }

 public void setUid(String uid) {
  this.uid = uid;
 }

 public Users getU() {
  return u;
 }

 public void setU(Users u) {
  this.u = u;
 }

 public Infocate getC() {
  return c;
 }

 public void setC(Infocate c) {
  this.c = c;
 }

 public String getCode() {
  return code;
 }

 public void setCode(String code) {
  this.code = code;
 }

 public String getProduct_name() {
  return product_name;
 }

 public void setProduct_name(String product_name) {
  this.product_name = product_name;
 }

 public String getDescription() {
  return description;
 }

 public void setDescription(String description) {
  this.description = description;
 }

 public String getThumb() {
  return thumb;
 }

 public void setThumb(String thumb) {
  this.thumb = thumb;
 }

 public String getContent() {
  return content;
 }

 public void setContent(String content) {
  this.content = content;
 }

 public String getCategory_name() {
  return category_name;
 }

 public void setCategory_name(String category_name) {
  this.category_name = category_name;
 }

 public String getClick() {
  return click;
 }

 public void setClick(String click) {
  this.click = click;
 }

 public String getCategory() {
  return category;
 }

 public void setCategory(String category) {
  this.category = category;
 }

 public String getStore() {
  return store;
 }

 public void setStore(String store) {
  this.store = store;
 }

 public String getVpath() {
  return vpath;
 }

 public void setVpath(String vpath) {
  this.vpath = vpath;
 }

 public String getPrice() {
  return price;
 }

 public void setPrice(String price) {
  this.price = price;
 }

 public String getCreated() {
  return created;
 }

 public void setCreated(String created) {
  this.created = created;
 }

 public String getUpdated() {
  return updated;
 }

 public void setUpdated(String updated) {
  this.updated = updated;
 }

 public String getStatus() {
  return status;
 }

 public void setStatus(String status) {
  this.status = status;
 }

 public String getAreas() {
  return areas;
 }

 public void setAreas(String areas) {
  this.areas = areas;
 }

 public String getCategoryName() {
  return categoryName;
 }

 public void setCategoryName(String categoryName) {
  this.categoryName = categoryName;
 }

 public String getIsElectric() {
  return isElectric;
 }

 public void setIsElectric(String isElectric) {
  this.isElectric = isElectric;
 }

 public String getIsReview() {
  return isReview;
 }

 public void setIsReview(String isReview) {
  this.isReview = isReview;
 }
}