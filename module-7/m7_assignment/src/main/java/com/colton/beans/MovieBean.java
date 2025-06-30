/**
 * MovieBean.java
 * Author: Colton Kohler
 * Date: June 29, 2025
 * Assignment: Module 7 - JSP JavaBean Movie Insert
 *
 * This JavaBean class provides methods to connect to a MySQL database,
 * retrieve a list of movies, retrieve full details for a specific movie,
 * and insert new movie records.
 */
package com.colton.beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieBean {

    /**
     * Establishes connection to the MySQL database.
     * @return Connection object
     * @throws Exception if connection fails
     */
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/CSD430", "root", "SugHei297A!"
        );
    }

    /**
     * Retrieves full movie details by movie ID.
     * @param id the ID of the movie to retrieve
     * @return MovieDetails object with full info
     */
    public MovieDetails getMovieById(int id) {
        MovieDetails movie = new MovieDetails();
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM colton_movies_data WHERE movie_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                movie.setId(rs.getInt("movie_id"));
                movie.setTitle(rs.getString("title"));
                movie.setGenre(rs.getString("genre"));
                movie.setReleaseYear(rs.getInt("release_year"));
                movie.setRating(rs.getDouble("rating"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movie;
    }

    /**
     * Retrieves a list of all movies (IDs and titles).
     * @return List of MovieDetails with movie_id and title only
     */
    public List<MovieDetails> getAllMovies() {
        List<MovieDetails> movies = new ArrayList<>();
        try (Connection conn = getConnection()) {
            String sql = "SELECT movie_id, title FROM colton_movies_data";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MovieDetails movie = new MovieDetails();
                movie.setId(rs.getInt("movie_id"));
                movie.setTitle(rs.getString("title"));
                movies.add(movie);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    /**
     * Inserts a new movie record into the database.
     * @param title The movie title.
     * @param genre The genre.
     * @param year The release year.
     * @param rating The rating.
     * @return true if insert succeeded, false otherwise.
     */
    public boolean insertMovie(String title, String genre, int year, double rating) {
        try (Connection conn = getConnection()) {
            String sql = "INSERT INTO colton_movies_data (title, genre, release_year, rating) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, genre);
            ps.setInt(3, year);
            ps.setDouble(4, rating);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
