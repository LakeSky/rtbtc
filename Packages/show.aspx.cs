using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Packages_show : PublicApplicationPage
{
    meis007Entities _meis007Entities;
    public PackageHeader packageHeader;
    public string description = "";
    PackageDescription packageDescription;
    public string masterCurrencyValue;
    protected void Page_Load(object sender, EventArgs e)
    {
        masterCurrencyValue = GetMasteCurrencySelectedValue();
        long id;
        if (Request.QueryString["id"] == null || !long.TryParse(Request.QueryString["id"], out id))
        {
            Redirect();
            return;
        }
        _meis007Entities = new meis007Entities();
        packageHeader = _meis007Entities.PackageHeaders.Where(x => x.PacId == id && x.InService == true).FirstOrDefault();
        if (packageHeader == null)
        {
            Redirect();
            return;
        }
        packageDescription = _meis007Entities.PackageDescriptions.Where(x => x.PacId == id).FirstOrDefault();
        if (packageDescription != null)
        {
            description = packageDescription.PacDes;
        }
        var data = _meis007Entities.PackageImages.Where(x => x.PacId == id);
        rptrSlider.DataSource = data;
        rptrSlider.DataBind();
    }

    protected void Redirect()
    {
        Session["ErrorMessage"] = "You are not authorized to access that package!";
        Response.Redirect(Route.GetRootPath("packages/index.aspx"));
    }
}