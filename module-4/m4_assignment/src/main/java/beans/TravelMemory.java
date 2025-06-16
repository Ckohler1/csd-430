// Author: Colton Kohler
// Date: 06/15/2025
// Assignment: Module 4 Assignment – JavaBean
// Purpose: Defines a JavaBean to hold travel memory data for display via JSP

package beans;

import java.io.Serializable;

public class TravelMemory implements Serializable {
    private String location;
    private String memory;
    private String food;
    private String date;
    private String rating;

    public TravelMemory() {}

    public TravelMemory(String location, String memory, String food, String date, String rating) {
        this.location = location;
        this.memory = memory;
        this.food = food;
        this.date = date;
        this.rating = rating;
    }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getMemory() { return memory; }
    public void setMemory(String memory) { this.memory = memory; }

    public String getFood() { return food; }
    public void setFood(String food) { this.food = food; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getRating() { return rating; }
    public void setRating(String rating) { this.rating = rating; }
}
