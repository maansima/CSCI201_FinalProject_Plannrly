package Test;

import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Business {

@SerializedName("id")
@Expose
private String id;
@SerializedName("alias")
@Expose
private String alias;
@SerializedName("name")
@Expose
private String name;
@SerializedName("image_url")
@Expose
private String imageUrl;
@SerializedName("is_closed")
@Expose
private Boolean isClosed;
@SerializedName("url")
@Expose
private String url;
@SerializedName("review_count")
@Expose
private Integer reviewCount;
@SerializedName("categories")
@Expose
private List<Category> categories = null;
@SerializedName("rating")
@Expose
private Double rating;
@SerializedName("coordinates")
@Expose
private Coordinates coordinates;
@SerializedName("transactions")
@Expose
private List<String> transactions = null;
@SerializedName("price")
@Expose
private String price;
@SerializedName("location")
@Expose
private Location location;
@SerializedName("phone")
@Expose
private String phone;
@SerializedName("display_phone")
@Expose
private String displayPhone;
@SerializedName("distance")
@Expose
private Double distance;

public String getId() {
return id;
}

public void setId(String id) {
this.id = id;
}

public Business withId(String id) {
this.id = id;
return this;
}

public String getAlias() {
return alias;
}

public void setAlias(String alias) {
this.alias = alias;
}

public Business withAlias(String alias) {
this.alias = alias;
return this;
}

public String getName() {
return name;
}

public void setName(String name) {
this.name = name;
}

public Business withName(String name) {
this.name = name;
return this;
}

public String getImageUrl() {
return imageUrl;
}

public void setImageUrl(String imageUrl) {
this.imageUrl = imageUrl;
}

public Business withImageUrl(String imageUrl) {
this.imageUrl = imageUrl;
return this;
}

public Boolean getIsClosed() {
return isClosed;
}

public void setIsClosed(Boolean isClosed) {
this.isClosed = isClosed;
}

public Business withIsClosed(Boolean isClosed) {
this.isClosed = isClosed;
return this;
}

public String getUrl() {
return url;
}

public void setUrl(String url) {
this.url = url;
}

public Business withUrl(String url) {
this.url = url;
return this;
}

public Integer getReviewCount() {
return reviewCount;
}

public void setReviewCount(Integer reviewCount) {
this.reviewCount = reviewCount;
}

public Business withReviewCount(Integer reviewCount) {
this.reviewCount = reviewCount;
return this;
}

public List<Category> getCategories() {
return categories;
}

public void setCategories(List<Category> categories) {
this.categories = categories;
}

public Business withCategories(List<Category> categories) {
this.categories = categories;
return this;
}

public Double getRating() {
return rating;
}

public void setRating(Double rating) {
this.rating = rating;
}

public Business withRating(Double rating) {
this.rating = rating;
return this;
}

public Coordinates getCoordinates() {
return coordinates;
}

public void setCoordinates(Coordinates coordinates) {
this.coordinates = coordinates;
}

public Business withCoordinates(Coordinates coordinates) {
this.coordinates = coordinates;
return this;
}

public List<String> getTransactions() {
return transactions;
}

public void setTransactions(List<String> transactions) {
this.transactions = transactions;
}

public Business withTransactions(List<String> transactions) {
this.transactions = transactions;
return this;
}

public String getPrice() {
return price;
}

public void setPrice(String price) {
this.price = price;
}

public Business withPrice(String price) {
this.price = price;
return this;
}

public Location getLocation() {
return location;
}

public void setLocation(Location location) {
this.location = location;
}

public Business withLocation(Location location) {
this.location = location;
return this;
}

public String getPhone() {
return phone;
}

public void setPhone(String phone) {
this.phone = phone;
}

public Business withPhone(String phone) {
this.phone = phone;
return this;
}

public String getDisplayPhone() {
return displayPhone;
}

public void setDisplayPhone(String displayPhone) {
this.displayPhone = displayPhone;
}

public Business withDisplayPhone(String displayPhone) {
this.displayPhone = displayPhone;
return this;
}

public Double getDistance() {
return distance;
}

public void setDistance(Double distance) {
this.distance = distance;
}

public Business withDistance(Double distance) {
this.distance = distance;
return this;
}

}