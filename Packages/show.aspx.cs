using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Packages_show : PublicApplicationPage
{
    PackageHeader packageHeader;
    PackageDescription packageDescription;
    string masterCurrencyValue;
    protected void Page_Load(object sender, EventArgs e)
    {
        long id;
        if (Request.QueryString["id"] == null || !long.TryParse(Request.QueryString["id"], out id))
        {
            ErrorRedirect("You are not authorized to access that package!");
            return;
        }
        _entity = GetEntity();
        packageHeader = _entity.PackageHeaders.Where(x => x.PacId == id && x.InService == true).FirstOrDefault();
        if (packageHeader == null)
        {
            ErrorRedirect("You are not authorized to access that package!");
            return;
        }
        rootPath = Route.GetRootPath("");
        var data = _entity.PackageImages.Where(x => x.PacId == id);
        rptrSlider.DataSource = data;
        rptrSlider.DataBind();
        lblPacName.Text = packageHeader.PacName;
        masterCurrencyValue = GetMasteCurrencySelectedValue();
        lblPacPrice.Text = "Price Per Person " +
            ApplicationObject.GetMasterCurrency(masterCurrencyValue) +
            " " + ApplicationObject.FormattedCurrencyDisplayPrice(packageHeader.PacValueB2C, masterCurrencyValue);
        packageDescription = _entity.PackageDescriptions.Where(x => x.PacId == id).FirstOrDefault();
        if (packageDescription != null)
        {
            pacDescription.InnerHtml = packageDescription.PacDes;
        }
        if (Request.QueryString["from"] == "basket")
        {
            fromBasketDiv.Visible = true;
            fromIndexDiv.Visible = false;
            fromBasketDivAnchor.HRef = rootPath + "basket/show.aspx";
        }
        else
        {
            fromBasketDiv.Visible = false;
            fromIndexDiv.Visible = true;
            fromIndexDivAnchor.HRef = rootPath + "packages/book.aspx?id=" + packageHeader.PacId;
        }
    }

}