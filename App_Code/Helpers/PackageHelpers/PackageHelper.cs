using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PackageHelper
/// </summary>
public class PackageHelper
{
    public static string FormattedPackageName(object obj, int length)
    {
        if (obj == null)
        {
            return string.Empty;
        }
        return StringHelper.SubString(obj.ToString(), length);
    }
}