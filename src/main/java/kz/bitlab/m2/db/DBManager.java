package kz.bitlab.m2.db;

import kz.bitlab.m2.model.Film;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DBManager {
    private static Connection connection;

    public static void connectToDB() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema?useUnicode=true&serverTimezone=UTC", "root", "");
            System.out.println("DB connected");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Film> getAllFilms() {
        List<Film> filmList = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from films");
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Long id = result.getLong("id");
                String title = result.getString("title");
                String description = result.getString("description");
                Long studioId = result.getLong("studio_id");
                double rating = result.getDouble("rating");
                filmList.add(new Film(id, title, description, studioId, rating));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return filmList;
    }

    public static void addFilm(Film film) {
        try {
            PreparedStatement statement = connection.prepareStatement("insert into films values (null, ?, ?, ?, ?)");
            statement.setString(1, film.getTitle());
            statement.setString(2, film.getDescription());
            statement.setLong(3, film.getStudio_id());
            statement.setDouble(4, film.getRating());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Film getFilmById(Long id) {
        Film film = new Film();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from films where id = ?");
            statement.setLong(1, id);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                film = new Film(
                        id,
                        result.getString("title"),
                        result.getString("description"),
                        result.getLong("studio_id"),
                        result.getDouble("rating")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return film;
    }

    public static void updateFilm(Film film) {
        try {
            PreparedStatement statement = connection.prepareStatement("update films set title = ?, description = ?, studio = ?, rating = ? where id = ?");
            statement.setString(1, film.getTitle());
            statement.setString(2, film.getDescription());
            statement.setLong(3, film.getStudio_id());
            statement.setDouble(4, film.getRating());
            statement.setDouble(5, film.getId());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String getStudioByFilmId(Long id) {
        String studio = null;
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "select studios.name, studios.country from films join studios on(films.studio_id = studios.id) where films.id = ?"
            );
            statement.setLong(1, id);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                studio = result.getString("name");
                studio = studio + " - " + result.getString("country");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return studio;
    }
}
