package com.Praveen.Springboot.entity;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name="jsp_curd")
public class Product {
@Id
@GeneratedValue(strategy =
GenerationType.IDENTITY)
private long id;
private String productName;
private String decription;
private String price;
private String quantity;
public Product() {
super();
// TODO Auto-generated constructor stub
}
public Product(long id, String productName,
String decription, String price, String quantity) {

super();
this.id = id;

this.productName = productName;
this.decription = decription;
this.price = price;
this.quantity = quantity;
}
public long getId() {
return id;
}
public void setId(long id) {
this.id = id;
}
public String getProductName() {
return productName;
}
public void setProductName(String productName) {
this.productName = productName;
}
public String getDecription() {
return decription;
}
public void setDecription(String decription) {
this.decription = decription;
}
public String getPrice() {
return price;
}
public void setPrice(String price) {
this.price = price;
}
public String getQuantity() {
return quantity;
}
public void setQuantity(String quantity) {
this.quantity = quantity;

}
@Override
public String toString() {
return "Product [id=" + id + ", productName=" + productName + ", decription=" +
decription + ", price=" + price+ ", quantity=" + quantity + "]";

}
}