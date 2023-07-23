
package Model;


public class Customer {
    private int id;
    private String name;
    private String email;
    private String password;
    private String phonenumber;
    private String country;
    private String city;
    private String district;
    private String ward;
    private String detailaddress;

    public Customer() {
    }

    public Customer(int id, String name, String email, String password, String phonenumber, String country, String city, String district, String ward, String detailaddress) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phonenumber = phonenumber;
        this.country = country;
        this.city = city;
        this.district = district;
        this.ward = ward;
        this.detailaddress = detailaddress;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getDetailaddress() {
        return detailaddress;
    }

    public void setDetailaddress(String detailaddress) {
        this.detailaddress = detailaddress;
    }

    @Override
    public String toString() {
        return "Customer{" + "id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", phonenumber=" + phonenumber + ", country=" + country + ", city=" + city + ", district=" + district + ", ward=" + ward + ", detailaddress=" + detailaddress + '}';
    }
    
    
}
