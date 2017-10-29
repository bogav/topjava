package ru.javawebinar.topjava.model;

import java.time.LocalDateTime;

/**
 * GKislin
 * 11.01.2015.
 */
public class UserMealWithExceed {
    private final LocalDateTime dateTime;

    private final String description;

    private final int calories;

    private final boolean exceed;

    public UserMealWithExceed(LocalDateTime dateTime, String description, int calories, boolean exceed) {
        this.dateTime = dateTime;
        this.description = description;
        this.calories = calories;
        this.exceed = exceed;
    }

    // Для проверки результата, в основной задаче не требуется
    public LocalDateTime getDateTime() {
        return dateTime;
    }
    // Для проверки результата, в основной задаче не требуется
    public String getDescription() {
        return description;
    }
    // Для проверки результата, в основной задаче не требуется
    public int getCalories() {
        return calories;
    }
    // Для проверки результата, в основной задаче не требуется
    public boolean isExceed() {
        return exceed;
    }
}
