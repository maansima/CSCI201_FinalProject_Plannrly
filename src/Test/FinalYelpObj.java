package Test;

import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class FinalYelpObj {

@SerializedName("businesses")
@Expose
private List<Business> businesses = null;
@SerializedName("total")
@Expose
private Integer total;
@SerializedName("region")
@Expose
private Region region;

public List<Business> getBusinesses() {
return businesses;
}

public void setBusinesses(List<Business> businesses) {
this.businesses = businesses;
}

public FinalYelpObj withBusinesses(List<Business> businesses) {
this.businesses = businesses;
return this;
}

public Integer getTotal() {
return total;
}

public void setTotal(Integer total) {
this.total = total;
}

public FinalYelpObj withTotal(Integer total) {
this.total = total;
return this;
}

public Region getRegion() {
return region;
}

public void setRegion(Region region) {
this.region = region;
}

public FinalYelpObj withRegion(Region region) {
this.region = region;
return this;
}

}