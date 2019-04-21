//CSCI 201 Final Project Plannrly 
//Team Members: Andrew Garcia, Cathleen Yang, Giovana Da Cunha, Maansi Manchanda 
//Emails: andreweg@usc.edu, cathleey@usc.edu, dacunha@usc.edu, maansima@usc.edu

 
package Test;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Region {

@SerializedName("center")
@Expose
private Center center;

public Center getCenter() {
return center;
}

public void setCenter(Center center) {
this.center = center;
}

public Region withCenter(Center center) {
this.center = center;
return this;
}

}