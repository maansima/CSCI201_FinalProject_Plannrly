//CSCI 201 Final Project Plannrly 
//Team Members: Andrew Garcia, Cathleen Yang, Giovana Da Cunha, Maansi Manchanda 
//Emails: andreweg@usc.edu, cathleey@usc.edu, dacunha@usc.edu, maansima@usc.edu

 
package Test;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Center {

@SerializedName("longitude")
@Expose
private Double longitude;
@SerializedName("latitude")
@Expose
private Double latitude;

public Double getLongitude() {
return longitude;
}

public void setLongitude(Double longitude) {
this.longitude = longitude;
}

public Center withLongitude(Double longitude) {
this.longitude = longitude;
return this;
}

public Double getLatitude() {
return latitude;
}

public void setLatitude(Double latitude) {
this.latitude = latitude;
}

public Center withLatitude(Double latitude) {
this.latitude = latitude;
return this;
}

}