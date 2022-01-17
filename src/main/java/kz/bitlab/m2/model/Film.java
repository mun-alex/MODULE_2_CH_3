package kz.bitlab.m2.model;

public class Film {
    Long id;
    String title;
    String description;
    Long studio_id;
    double rating;

    public Film() {

    }

    public Film(Long id, String title, String description, Long studio_id, double rating) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.studio_id = studio_id;
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

    public Long getStudio_id() {
        return studio_id;
    }

    public void setStudio_id(Long studio_id) {
        this.studio_id = studio_id;
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
                ", studio_id=" + studio_id +
                ", rating=" + rating +
                '}';
    }
}
