/**
 * MovieBean.java
 * Author: Colton Kohler
 * Date: June 22, 2025
 * Assignment: Module 6 - JSP JavaBean Movie App
 *
 * This JavaBean class provides methods to connect to a MySQL database,
 * retrieve a list of movies, and retrieve full details for a specific movie.
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
                "jdbc:mysql://localhost:3307/CSD430", "root", "SugHei297A!");
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
}