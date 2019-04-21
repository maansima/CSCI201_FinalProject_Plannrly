//CSCI 201 Final Project Plannrly 
//Team Members: Andrew Garcia, Cathleen Yang, Giovana Da Cunha, Maansi Manchanda 
//Emails: andreweg@usc.edu, cathleey@usc.edu, dacunha@usc.edu, maansima@usc.edu

 
package Test;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Category {

@SerializedName("alias")
@Expose
private String alias;
@SerializedName("title")
@Expose
private String title;

public String getAlias() {
return alias;
}

public void setAlias(String alias) {
this.alias = alias;
}

public Category withAlias(String alias) {
this.alias = alias;
return this;
}

public String getTitle() {
return title;
}

public void setTitle(String title) {
this.title = title;
}

public Category withTitle(String title) {
this.title = title;
return this;
}

}