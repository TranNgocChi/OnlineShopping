
package Model;

import java.math.BigDecimal;


public class Product {
    private int id;
    private String type;
    private String name;
    private BigDecimal price;
    private int numberOf;
    private int available;
    private String detail;
    private String img;
    private String brand;
    private int review;

    public Product() {
    }

    public Product(int id, String type, String name, BigDecimal price, 
            int numberOf, int available, String detail, String img, String brand, int review) {
        this.id = id;
        this.type = type;
        this.name = name;
        this.price = price;
        this.numberOf = numberOf;
        this.available = available;
        this.detail = detail;
        this.img = img;
        this.brand = brand;
        this.review = review;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getNumberOf() {
        return numberOf;
    }

    public void setNumberOf(int numberOf) {
        this.numberOf = numberOf;
    }

    public int getAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getReview() {
        return review;
    }

    public void setReview(int review) {
        this.review = review;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", type=" + type + ", name=" + name + ", price=" + price + ", numberOf=" + numberOf + ", available=" + available + ", detail=" + detail + ", img=" + img + ", brand=" + brand + ", review=" + review + '}';
    }
    
    
}
