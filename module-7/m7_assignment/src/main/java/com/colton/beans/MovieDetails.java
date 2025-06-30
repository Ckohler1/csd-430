/**
 * MovieDetails.java
 * Author: Colton Kohler
 * Date: June 29, 2025
 * Assignment: Module 7 - JSP JavaBean Movie App
 *
 * This class represents a movie record with fields for movie details,
 * including ID, title, genre, release year, and rating.
 */
package com.colton.beans;

public class MovieDetails {
    private int id;
    private String title;
    private String genre;
    private int releaseYear;
    private double rating;

    // Getters
    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getGenre() {
        return genre;
    }

    public int getReleaseYear() {
        return releaseYear;
    }

    public double getRating() {
        return rating;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public void setReleaseYear(int releaseYear) {
        this.releaseYear = releaseYear;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }
}
