using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PagerWebControls;
using meis007Model;

public partial class Packages_index : PublicApplicationPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateDataSource(1, this.Pager.PageSize);
        }
    }

    protected void Pager_Changed(object sender, PagerEventArgs e)
    {
        PopulateDataSource(e.Number, e.PageSize);
    }

    private void PopulateDataSource(int page, int pageSize)
    {
        _entity = GetEntity();
        var data = PackageDisplayHelper.GetPackages(_entity, GetMasteCurrencySelectedValue());
        rptrPackages.DataSource = data.Skip((page - 1) * pageSize).Take(pageSize);
        rptrPackages.DataBind();
        this.Pager.TotalPages =
             (data.Count / pageSize) + (data.Count % pageSize > 0 ? 1 : 0);
        this.Pager.GenerateLinks();
    }
}