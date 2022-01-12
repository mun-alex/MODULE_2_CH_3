package kz.bitlab.m2.model;

public class Film {
    Long id;
    String title;
    String description;
    String studio;
    double rating;

    public Film() {

    }

    public Film(Long id, String title, String description, String studio, double rating) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.studio = studio;
        this.rating = rating;
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStudio() {
        return studio;
    }

    public void setStudio(String studio) {
        this.studio = studio;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "Film{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", studio='" + studio + '\'' +
                ", rating=" + rating +
                '}';
    }
}
