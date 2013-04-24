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
    meis007Entities _meis007Entities;
    public string masterCurrencyValue;
    protected void Page_Load(object sender, EventArgs e)
    {
        masterCurrencyValue = GetMasteCurrencySelectedValue();
        if (!IsPostBack)
        {
            _meis007Entities = new meis007Entities();
            PopulateDataSource(1, this.Pager.PageSize);
        }
    }

    protected void Pager_Changed(object sender, PagerEventArgs e)
    {
        PopulateDataSource(e.Number, e.PageSize);
    }

    private void PopulateDataSource(int page, int pageSize)
    {
        _meis007Entities = new meis007Entities();
        var data = _meis007Entities.PackageHeaders.Where(x => x.InService == true).OrderBy(x => x.DisplaySeq).ToList();
        rptrPackages.DataSource = data.Skip((page - 1) * pageSize).Take(pageSize);
        rptrPackages.DataBind();
        this.Pager.TotalPages =
             (data.Count / pageSize) + (data.Count % pageSize > 0 ? 1 : 0);
        this.Pager.GenerateLinks();
    }
}