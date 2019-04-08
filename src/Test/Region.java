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