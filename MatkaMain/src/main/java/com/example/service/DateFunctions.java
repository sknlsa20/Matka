package com.example.service;

import java.time.LocalDate;

public class DateFunctions {
    public static LocalDate addDays(LocalDate date, int days) {
        return date.plusDays(days);
    }
}