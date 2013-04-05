using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class About : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        meis007Entities x = new meis007Entities();
        var l = x.B2CCustomerinfo.ToList();
        Repeater1.DataSource = l;
        Repeater1.DataBind();
        var y = x.SuppliersHotelsInfoes.First();

        var ob = new SupplierHotelObjectHelper();
        Repeater3.DataSource = ob.GetHotels();
        Repeater3.DataBind();

    }
}
