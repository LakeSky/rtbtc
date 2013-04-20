using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;
using RTCDataModel.RTCEntities;
using RTCModel.Models;

public partial class About : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //meis007Entities x = new meis007Entities();
        //var l = x.B2CCustomerinfo.ToList();
        //Repeater1.DataSource = l;
        //Repeater1.DataBind();
        //var y = x.SuppliersHotelsInfoes.First();

        //var ob = new SupplierHotelObjectHelper();
        //Repeater3.DataSource = ob.GetHotels();
        //Repeater3.DataBind();

        SearchEntity _search = new SearchEntity();
        _search.Destination = "DXB";
        _search.CheckIn = DateTime.Now.AddDays(15);
        _search.CheckOut = DateTime.Now.AddDays(20);
        _search.AdultCount = 2;
        _search.ChildCount = 2;
        int[] ages = new int[2] { 10, 11 };
        _search.ChildAges =  ages;
        _search.CustomerID = "1015";
        string status = string.Empty;
        RepositoryFactory supplierFactory = new RepositoryFactory(_search, Guid.NewGuid().ToString());
        int searchId = supplierFactory.GetSuppliersHotelsInfo(out status);

    }

}
