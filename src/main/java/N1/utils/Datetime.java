package N1.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class Datetime {
    static DateFormat datetimeFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    static DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    static DateFormat sqlDateFormat = new SimpleDateFormat("yyyy-MM-dd");

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
    
    public static String sqlDateFormat(Date date){
        try {
            return sqlDateFormat.format(date);
        }catch (Exception e){
        }
        return null;

    }
    
    public static List<Date> getDaysBetweenDates(Date startdate, Date enddate)
    {
        List<Date> dates = new ArrayList<>();
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(startdate);

        while (!calendar.getTime().after(enddate))
        {
            Date result = calendar.getTime();
            dates.add(result);
            calendar.add(Calendar.DATE, 1);
        }
        return dates;
    }
    
    public static Date yesterday()
    {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(getToday());
        calendar.add(Calendar.DATE, -1);
        return calendar.getTime();
    }
    
    public static Date oneWeekAgo()
    {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(getToday());
        calendar.add(Calendar.DATE, -7);
        return calendar.getTime();
    }
    
    public static Date oneMonthAgo()
    {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(getToday());
        calendar.add(Calendar.DATE, -30);
        return calendar.getTime();
    }
    
    public static Date oneYearAgo()
    {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(getToday());
        calendar.add(Calendar.DATE, -365);
        return calendar.getTime();
    }
}
