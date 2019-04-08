package Test;

import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Location {

@SerializedName("address1")
@Expose
private String address1;
@SerializedName("address2")
@Expose
private String address2;
@SerializedName("address3")
@Expose
private String address3;
@SerializedName("city")
@Expose
private String city;
@SerializedName("zip_code")
@Expose
private String zipCode;
@SerializedName("country")
@Expose
private String country;
@SerializedName("state")
@Expose
private String state;
@SerializedName("display_address")
@Expose
private List<String> displayAddress = null;

public String getAddress1() {
return address1;
}

public void setAddress1(String address1) {
this.address1 = address1;
}

public Location withAddress1(String address1) {
this.address1 = address1;
return this;
}

public String getAddress2() {
return address2;
}

public void setAddress2(String address2) {
this.address2 = address2;
}

public Location withAddress2(String address2) {
this.address2 = address2;
return this;
}

public String getAddress3() {
return address3;
}

public void setAddress3(String address3) {
this.address3 = address3;
}

public Location withAddress3(String address3) {
this.address3 = address3;
return this;
}

public String getCity() {
return city;
}

public void setCity(String city) {
this.city = city;
}

public Location withCity(String city) {
this.city = city;
return this;
}

public String getZipCode() {
return zipCode;
}

public void setZipCode(String zipCode) {
this.zipCode = zipCode;
}

public Location withZipCode(String zipCode) {
this.zipCode = zipCode;
return this;
}

public String getCountry() {
return country;
}

public void setCountry(String country) {
this.country = country;
}

public Location withCountry(String country) {
this.country = country;
return this;
}

public String getState() {
return state;
}

public void setState(String state) {
this.state = state;
}

public Location withState(String state) {
this.state = state;
return this;
}

public List<String> getDisplayAddress() {
return displayAddress;
}

public void setDisplayAddress(List<String> displayAddress) {
this.displayAddress = displayAddress;
}

public Location withDisplayAddress(List<String> displayAddress) {
this.displayAddress = displayAddress;
return this;
}

}