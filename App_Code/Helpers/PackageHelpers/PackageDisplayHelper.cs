using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;

public class PackageDisplayHelper
{
    public long Id { get; set; }
    public string Name { get; set; }
    public string DisplayImage { get; set; }
    public string ShowPath { get; set; }
    public string BookPath { get; set; }
    public string Currency { get; set; }
    public decimal Price { get; set; }
    public string dividerHtml { get; set; }
    public string separaterHtml { get; set; }

    public static List<PackageDisplayHelper> GetPackages(meis007Entities _entity, string masterCurrency)
    {
        var rootPath = Route.GetRootPath("");
        var packages = _entity.PackageHeaders.Where(x => x.InService == true).OrderBy(x => x.DisplaySeq).ToList();
        PackageDisplayHelper obj;
        List<PackageDisplayHelper> list = new List<PackageDisplayHelper>();
        int i = 1;
        foreach (var x in packages)
        {
            obj = new PackageDisplayHelper { 
                BookPath = "book.aspx?id=" + x.PacId,
                DisplayImage = x.DisplayImage,
                Id = x.PacId,
                Name = FormattedPackageName(x.PacName, 33),
                ShowPath = "show.aspx?id=" + x.PacId,
                Currency = ApplicationObject.GetMasterCurrency(masterCurrency),
                Price = ApplicationObject.FormattedCurrencyDisplayPrice(x.PacValueB2C, masterCurrency),
                separaterHtml = i % 6 == 0 ? "<div class='clear'></div><div class='margin10'></div><div class='margin10'></div>" : "",
                dividerHtml = i % 6 == 0 ? "" :
                "<li class='prods_vseparator'><div class='equal-height_products_block' style='min-height: 286px;'><div>"+
                "<img src='"+rootPath+"images/template/spacer.gif' alt='' width='10' height='1'></div></div></li>"
            };
            list.Add(obj);
            i += 1;
        }
        return list;
    }

    public static string FormattedPackageName(object obj, int length)
    {
        if (obj == null)
        {
            return string.Empty;
        }
        return StringHelper.SubString(obj.ToString(), length);
    }
}