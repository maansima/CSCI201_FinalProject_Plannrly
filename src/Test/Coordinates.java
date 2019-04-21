//CSCI 201 Final Project Plannrly 
//Team Members: Andrew Garcia, Cathleen Yang, Giovana Da Cunha, Maansi Manchanda 
//Emails: andreweg@usc.edu, cathleey@usc.edu, dacunha@usc.edu, maansima@usc.edu

 
package Test;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Coordinates {

@SerializedName("latitude")
@Expose
private Double latitude;
@SerializedName("longitude")
@Expose
private Double longitude;

public Double getLatitude() {
return latitude;
}

public void setLatitude(Double latitude) {
this.latitude = latitude;
}

public Coordinates withLatitude(Double latitude) {
this.latitude = latitude;
return this;
}

public Double getLongitude() {
return longitude;
}

public void setLongitude(Double longitude) {
this.longitude = longitude;
}

public Coordinates withLongitude(Double longitude) {
this.longitude = longitude;
return this;
}

}