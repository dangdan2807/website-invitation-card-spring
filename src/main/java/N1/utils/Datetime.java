package N1.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class Datetime {
    static DateFormat datetimeFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    static DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

    public static Date getToday(){
        return new Date(System.currentTimeMillis());
    }

    public static Date date(int day, int month, int year){
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month, day);

        return calendar.getTime();
    }

    public static long distance(Date d1, Date d2){
        long diffInMillies = d2.getTime() - d1.getTime();
        if(diffInMillies < 0)
            return 0;
        return TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
    }

    public static Date stringToDate(String str){
        try {
            return dateFormat.parse(str);
        } catch (ParseException e) {
        }
        return null;
    }

    public static String dateToString(Date date){
        try {
            return dateFormat.format(date);
        }catch (Exception e){
        }
        return null;

    }
}
