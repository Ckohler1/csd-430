/**
 * MovieBean.java
 * Author: Colton Kohler
 * Date: July 13, 2025
 * Assignment: Module 9 - JSP JavaBean Movie App
 *
 * This JavaBean class provides methods to connect to a MySQL database,
 * retrieve a list of movies, retrieve full details for a specific movie,
 * insert new records, and update existing records.
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
     * @return MovieDetails object
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
            String sql = "SELECT * FROM colton_movies_data";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MovieDetails movie = new MovieDetails();
                movie.setId(rs.getInt("movie_id"));
                movie.setTitle(rs.getString("title"));
                movie.setGenre(rs.getString("genre"));
                movie.setReleaseYear(rs.getInt("release_year"));
                movie.setRating(rs.getDouble("rating"));
                movies.add(movie);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    /**
     * Inserts a new movie into the database.
     * @return true if insert succeeds, false otherwise
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

    /**
     * Updates an existing movie in the database.
     * @return true if update succeeds, false otherwise
     */
    public boolean updateMovie(int id, String title, String genre, int year, double rating) {
        try (Connection conn = getConnection()) {
            String sql = "UPDATE colton_movies_data SET title=?, genre=?, release_year=?, rating=? WHERE movie_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, genre);
            ps.setInt(3, year);
            ps.setDouble(4, rating);
            ps.setInt(5, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
/**
 * Deletes a movie by its ID.
 * @param id The movie_id to delete.
 * @return true if deleted successfully, false otherwise.
 */
public boolean deleteMovie(int id) {
    try (Connection conn = getConnection()) {
        String sql = "DELETE FROM colton_movies_data WHERE movie_id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
}

