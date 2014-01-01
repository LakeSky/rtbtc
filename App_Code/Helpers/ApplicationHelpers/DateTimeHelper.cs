using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;
using System.Collections;

/// <summary>
/// Summary description for DateTimeHelper
/// </summary>
public static class DateTimeHelper
{

    public static string ConvertToString(string inputDateTime)
    {
        var output = ConvertToDate(inputDateTime);
        if (output.HasValue)
        {
            return output.Value.ToString("dd-MM-yyyy");
        }
        DateTime outputDateTime;
        string result = "";
        result = DateTime.TryParse(inputDateTime, out outputDateTime) ? DateTime.Parse(inputDateTime).ToString("dd-MM-yyyy") : inputDateTime;
        return result;
    }

    public static DateTime? ConvertToDate(string inputDateTime, string format = null)
    {
        DateTime outputDateTime;
        DateTime? result = null;
        var parseFormat = format == null ? "dd-MM-yyyy" : format;
        var allFormats = Datetime_Formats(parseFormat);
        foreach (var x in allFormats)
        {
            if (DateTime.TryParseExact(inputDateTime, x, CultureInfo.InvariantCulture, DateTimeStyles.None, out outputDateTime))
            {
                result = outputDateTime;
            }
            if (result != null)
            {
                break;
            }
        }
        return result;
    }

    public static DateTime ConvertToDateWithoutNull(string inputDateTime)
    {
        var output = ConvertToDate(inputDateTime);
        if (output.HasValue)
        {
            return output.Value;
        }
        return DateTime.ParseExact(inputDateTime, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
    }

    public static string ToTimeStamp()
    {
        return DateTime.Now.ToString("yyyyMMddHHmmss");
    }

    public static void GetStartAndEndTime(string inputDate, out DateTime startTime, out DateTime endTime)
    {
        var start = inputDate.Split('-')[2] + "-" + inputDate.Split('-')[1] + "-" + inputDate.Split('-')[0] + " 00:00:00";
        var end = inputDate.Split('-')[2] + "-" + inputDate.Split('-')[1] + "-" + inputDate.Split('-')[0] + " 23:59:59";
        startTime = DateTime.Parse(start);
        endTime = DateTime.Parse(end);
    }

    public static Hashtable GetStartAndEndDateByTwoValues(string FromDate, string ToDate)
    {
        var fromDateArray = FromDate.Split('-');
        var toDateArray = ToDate.Split('-');
        DateTime StartDate = DateTime.Parse(fromDateArray[2] + "-" + fromDateArray[1] + "-" + fromDateArray[0] + " 00:00:00");
        DateTime EndDate = DateTime.Parse(toDateArray[2] + "-" + toDateArray[1] + "-" + toDateArray[0] + " 23:59:59");
        Hashtable h = new Hashtable();
        h.Add("StartDate", StartDate);
        h.Add("EndDate", EndDate);
        return h;
    }

    public static string To24Hours(DateTime dateTime)
    {
        return dateTime.ToString("dd-MM-yyyy hh:mm tt");
    }

    public static DateTime ConvertToDateAndTimeWithoutNull(string inputDateTime, string format = null)
    {
        var output = ConvertToDate(inputDateTime, format);
        if (output.HasValue)
        {
            return output.Value;
        }
        DateTime outputDateTime;
        var parseFormat = format == null ? "dd-MM-yyyy HH:mm:ss" : format;
        outputDateTime = DateTime.ParseExact(inputDateTime, parseFormat, System.Globalization.CultureInfo.InvariantCulture);
        return outputDateTime;
    }

    public static string ExtractTime(DateTime inputDateTime)
    {
        return inputDateTime.ToString("HH");
    }

    public static DateTime customFormat(string input, string format = "dd-MM-yyyy")
    {
        var outputC = ConvertToDate(input, format);
        if (outputC.HasValue)
        {
            return outputC.Value;
        }
        DateTime output;
        DateTime.TryParseExact(input, format, null, DateTimeStyles.None, out output);
        return output;
    }

    public static string[] Datetime_Formats(string defaultFormat)
    {
        var array = new string[] { defaultFormat, 
            "d-MM-yyyy", "dd-M-yyyy", "d-MM-yy", "dd-M-yy",
            "d-MMM-yyyy", "dd-MMM-yyyy", "d-MMM-yy", "dd-MMM-yy",
            "d-MM-yyyy HH:mm:ss tt", "dd-M-yyyy HH:mm:ss tt", "d-MM-yy HH:mm:ss tt", "dd-M-yy HH:mm:ss tt",
            "d-MMM-yyyy HH:mm:ss tt", "dd-MMM-yyyy HH:mm:ss tt", "d-MMM-yy HH:mm:ss tt", "dd-MMM-yy HH:mm:ss tt",
            "d-MM-yyyy hh:mm:ss tt", "dd-M-yyyy hh:mm:ss tt", "d-MM-yy hh:mm:ss tt", "dd-M-yy hh:mm:ss tt",
            "d-MMM-yyyy hh:mm:ss tt", "dd-MMM-yyyy hh:mm:ss tt", "d-MMM-yy hh:mm:ss tt", "dd-MMM-yy hh:mm:ss tt",

            "MM-d-yyyy", "M-dd-yyyy", "MM-d-yy", "M-dd-yy",
            "MMM-d-yyyy", "MMM-dd-yyyy", "MMM-d-yy", "MMM-dd-yy",
            "MM-d-yyyy HH:mm:ss tt", "M-dd-yyyy HH:mm:ss tt", "MM-d-yy HH:mm:ss tt", "M-dd-yy HH:mm:ss tt",
            "MMM-d-yyyy HH:mm:ss tt", "MMM-dd-yyyy HH:mm:ss tt", "MMM-d-yy HH:mm:ss tt", "MMM-dd-yy HH:mm:ss tt",
            "MM-d-yyyy hh:mm:ss tt", "M-dd-yyyy hh:mm:ss tt", "MM-d-yy hh:mm:ss tt", "M-dd-yy hh:mm:ss tt",
            "MMM-d-yyyy hh:mm:ss tt", "MMM-dd-yyyy hh:mm:ss tt", "MMM-d-yy hh:mm:ss tt", "MMM-dd-yy hh:mm:ss tt",
            
            "yyyy-MM-d", "yyyy-M-dd", "yy-MM-d", "yy-M-dd",
            "yyyy-MMM-d", "yyyy-MMM-dd", "yy-MMM-d", "yy-MMM-dd",
            "yyyy-MM-d HH:mm:ss tt", "yyyy-M-dd HH:mm:ss tt", "yy-MM-d HH:mm:ss tt", "yy-M-dd HH:mm:ss tt",
            "yyyy-MMM-d HH:mm:ss tt", "yyyy-MMM-dd HH:mm:ss tt", "yy-MMM-d HH:mm:ss tt", "yy-MMM-dd HH:mm:ss tt",
            "yyyy-MM-d hh:mm:ss tt", "yyyy-M-dd hh:mm:ss tt", "yy-MM-d hh:mm:ss tt", "yy-M-dd hh:mm:ss tt",
            "yyyy-MMM-d hh:mm:ss tt", "yyyy-MMM-dd hh:mm:ss tt", "yy-MMM-d hh:mm:ss tt", "yy-MMM-dd hh:mm:ss tt",

            "d/MM/yyyy", "dd/M/yyyy", "d/MM/yy", "dd/M/yy",
            "d/MMM/yyyy", "dd/MMM/yyyy", "d/MMM/yy", "dd/MMM/yy",
            "d/MM/yyyy HH:mm:ss tt", "dd/M/yyyy HH:mm:ss tt", "d/MM/yy HH:mm:ss tt", "dd/M/yy HH:mm:ss tt",
            "d/MMM/yyyy HH:mm:ss tt", "dd/MMM/yyyy HH:mm:ss tt", "d/MMM/yy HH:mm:ss tt", "dd/MMM/yy HH:mm:ss tt",
            "d/MM/yyyy hh:mm:ss tt", "dd/M/yyyy hh:mm:ss tt", "d/MM/yy hh:mm:ss tt", "dd/M/yy hh:mm:ss tt",
            "d/MMM/yyyy hh:mm:ss tt", "dd/MMM/yyyy hh:mm:ss tt", "d/MMM/yy hh:mm:ss tt", "dd/MMM/yy hh:mm:ss tt",

            "MM/d/yyyy", "M/dd/yyyy", "MM/d/yy", "M/dd/yy",
            "MMM/d/yyyy", "MMM/dd/yyyy", "MMM/d/yy", "MMM/dd/yy",
            "MM/d/yyyy HH:mm:ss tt", "M/dd/yyyy HH:mm:ss tt", "MM/d/yy HH:mm:ss tt", "M/dd/yy HH:mm:ss tt",
            "MMM/d/yyyy HH:mm:ss tt", "MMM/dd/yyyy HH:mm:ss tt", "MMM/d/yy HH:mm:ss tt", "MMM/dd/yy HH:mm:ss tt",
            "MM/d/yyyy hh:mm:ss tt", "M/dd/yyyy hh:mm:ss tt", "MM/d/yy hh:mm:ss tt", "M/dd/yy hh:mm:ss tt",
            "MMM/d/yyyy hh:mm:ss tt", "MMM/dd/yyyy hh:mm:ss tt", "MMM/d/yy hh:mm:ss tt", "MMM/dd/yy hh:mm:ss tt",
            
            "yyyy/MM/d", "yyyy/M/dd", "yy/MM/d", "yy/M/dd",
            "yyyy/MMM/d", "yyyy/MMM/dd", "yy/MMM/d", "yy/MMM/dd",
            "yyyy/MM/d HH:mm:ss tt", "yyyy/M/dd HH:mm:ss tt", "yy/MM/d HH:mm:ss tt", "yy/M/dd HH:mm:ss tt",
            "yyyy/MMM/d HH:mm:ss tt", "yyyy/MMM/dd HH:mm:ss tt", "yy/MMM/d HH:mm:ss tt", "yy/MMM/dd HH:mm:ss tt",
            "yyyy/MM/d hh:mm:ss tt", "yyyy/M/dd hh:mm:ss tt", "yy/MM/d hh:mm:ss tt", "yy/M/dd hh:mm:ss tt",
            "yyyy/MMM/d hh:mm:ss tt", "yyyy/MMM/dd hh:mm:ss tt", "yy/MMM/d hh:mm:ss tt", "yy/MMM/dd hh:mm:ss tt",
        };
        return array;
    }
}