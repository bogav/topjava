package ru.javawebinar.topjava.util;

import ru.javawebinar.topjava.model.UserMeal;
import ru.javawebinar.topjava.model.UserMealWithExceed;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Month;
import java.util.*;
import java.util.stream.Collectors;

/**
 * GKislin
 * 31.05.2015.
 */
public class UserMealsUtil {
    public static void main(String[] args) {
        List<UserMeal> mealList = Arrays.asList(
                new UserMeal(LocalDateTime.of(2015, Month.MAY, 30, 10, 0), "Завтрак", 500),
                new UserMeal(LocalDateTime.of(2015, Month.MAY, 30, 13, 0), "Обед", 1000),
                new UserMeal(LocalDateTime.of(2015, Month.MAY, 30, 20, 0), "Ужин", 500),
                new UserMeal(LocalDateTime.of(2015, Month.MAY, 31, 10, 0), "Завтрак", 1000),
                new UserMeal(LocalDateTime.of(2015, Month.MAY, 31, 13, 0), "Обед", 500),
                new UserMeal(LocalDateTime.of(2015, Month.MAY, 31, 20, 0), "Ужин", 510)
        );
        getFilteredWithExceeded(mealList, LocalTime.of(7, 0), LocalTime.of(12, 0), 2000);
//        .toLocalDate();
//        .toLocalTime();
    }

    public static List<UserMealWithExceed> getFilteredWithExceeded(List<UserMeal> mealList, LocalTime startTime, LocalTime endTime, int caloriesPerDay) {
        Map<LocalDate, Integer> caloriesTotal;
        caloriesTotal = mealList.stream().collect(Collectors.toMap(i -> i.getDateTime().toLocalDate(), UserMeal::getCalories, (a, b) -> (a + b), HashMap::new ));

        List<UserMealWithExceed> result = new ArrayList<>();
        for (UserMeal item : mealList)
            if (TimeUtil.isBetween(item.getDateTime().toLocalTime(), startTime, endTime))
                result.add(new UserMealWithExceed(item.getDateTime(), item.getDescription(), item.getCalories(),
                        caloriesTotal.get(item.getDateTime().toLocalDate()) > caloriesPerDay));

        // Для проверки результата, в основной задаче не требуется
        for (UserMealWithExceed item : result)
            System.out.println(item.getDateTime() + " : " + item.getDescription() + " : " + item.getCalories() + " : " + item.isExceed());

        return result;
    }
}
