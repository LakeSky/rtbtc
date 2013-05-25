using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;
using RTCDataModel.RTCEntities;
using RTCModel.Models;
using RTCEntities.ENUMS;
using System.Data;
using System.Globalization;

public partial class Orders_checkout : PublicApplicationPage
{
    public BasketHelper basketHelper;
    meis007Entities _meis007Entities;
    PayPal.Api.Payments.CreditCard creditCard;
    PayPal.Api.Payments.Address address;
    PaypalGateway gateway;
    protected void Page_Load(object sender, EventArgs e)
    {
       basketHelper = GetBasketHelperObject();
        if (basketHelper == null || !hasBasketItems(basketHelper)) {
            Session["ErrorMessage"] = "You dont have any items in basket please add it !";
            Response.Redirect(Route.GetRootPath("home.aspx"));
        }
        if (!IsPostBack)
        {
          _meis007Entities = new meis007Entities();
          var userId = CurrentUser.Id();
          var data = _meis007Entities.B2CPaxinfo.Where(x => x.ForeignCustomerSNo == userId).OrderBy(x => x.CustomerSno).First();
          txtFirstName.Text = data.PaxFirstName;
          txtMiddleName.Text = data.PaxMiddleName;
          txtLastName.Text = data.PaxLastName;
          txtMobile.Text = data.B2CCustomerinfo.PaxmobileNo;
          txtCCFirstName.Text = data.PaxFirstName;
          txtCCLastName.Text = data.PaxLastName;
          txtTelephone.Text = data.B2CCustomerinfo.PaxTelNo;
          BuildDDLExpirationMonths(_meis007Entities);
          BuildDDLExpirationYear(_meis007Entities);
        }
    }

    protected void btnConfirmOrder_Click(object sender, EventArgs e)
    {
        basketHelper = GetBasketHelperObject();
        address = new PayPal.Api.Payments.Address { 
          city = ddlBillingCity.SelectedValue,
          country_code = ddlCountry.SelectedValue,
          line1 = txtBillingAddress.Text,
        };
        creditCard = new PayPal.Api.Payments.CreditCard {            
          cvv2 = txtCCCVV.Text,
          expire_month = ddlCCExpirationMonth.SelectedValue,
          expire_year = ddlCCExpirationYear.SelectedValue,
          first_name = txtCCFirstName.Text,
          last_name = txtCCLastName.Text,
          number = txtMobile.Text
        };
        gateway = new PaypalGateway(address, creditCard, basketHelper.totalPrice.ToString());
        var result = gateway.Pay();
        _meis007Entities = new meis007Entities();
        var sequence = _meis007Entities.BasketSequences.OrderBy(x => x.Id).First();
        var basketSequence = sequence.SequenceNumber + 1;
        sequence.SequenceNumber = basketSequence;
        _meis007Entities.SaveChanges();
        SuppliersHotelsInfo suppliersHotelsInfo;
        var hotelsToRemove = new List<BasketHotelDetails>();
        SupplierBooking supplierBooking;
        LocalBooking localBooking;
        string name = txtFirstName.Text + " " + txtMiddleName.Text + " " + txtLastName.Text;
        foreach (var x in basketHelper.hotelDetails) {
            if (!DbParameter.IsInetrnalSupplier(x.supplierId)) {
                suppliersHotelsInfo = _meis007Entities.SuppliersHotelsInfoes.Where(y => y.HotelInfoID == x.hotelInfoId).First();
                supplierBooking = new SupplierBooking(suppliersHotelsInfo, x, txtFirstName.Text, txtMiddleName.Text, txtLastName.Text, txtMobile.Text, txtTelephone.Text);
                string reservartionId = supplierBooking.Book();
                var obj = _meis007Entities.HotelBookings.Where(y => y.HotelInfoId == x.hotelInfoId).FirstOrDefault();
                if (obj != null) {
                    var array = obj.ReservationId.Split('~');
                    localBooking = new LocalBooking(_meis007Entities, suppliersHotelsInfo, x, null, obj, basketSequence, array[0].ToString().Trim(), array[1].ToString().Trim(), name, "Hotel", txtRemarks.Text);
                    localBooking.Create();
                    hotelsToRemove.Add(x);
                }
            }
        }
        foreach (var x in basketHelper.packageDetails) {
          localBooking = new LocalBooking(_meis007Entities, null, null, x, null, basketSequence, "", "", name, "Package", txtRemarks.Text);
          localBooking.Create();
        }
        RemoveHotels(basketHelper, hotelsToRemove);
        basketHelper.packageDetails = new List<BasketPackageDetails>();
        UpdateBasketHelperObject(basketHelper);
        Session["NoticeMessage"] = "Successfully confirmed bookings!";
        Response.Redirect(Route.GetRootPath("basket/show.aspx"));
    }

    protected void RemoveHotels(BasketHelper basketHelper, List<BasketHotelDetails> hotelsToRemove)
    {
        foreach (var x in hotelsToRemove) {
            basketHelper.hotelDetails.Remove(x);
        }
    }

    private void BindCategories(object sender, EventArgs e)
    {
    }

    protected void BuildDDLExpirationMonths(meis007Entities _meis007Entities)
    {
      DataTable table = new DataTable();
      table.Columns.Add("Text");
      table.Columns.Add("Value");
      DataRow dr;
      var months = CultureInfo.CurrentUICulture.DateTimeFormat.MonthNames;
      for (int i = 0; i < 12; i++)
      {
        dr = table.NewRow();
        dr["Value"] = i + 1;
        dr["Text"] = months[i];
        table.Rows.Add(dr);
      }
      ddlCCExpirationMonth.DataSource = table;
      ddlCCExpirationMonth.DataTextField = table.Columns["Text"].ColumnName;
      ddlCCExpirationMonth.DataValueField = table.Columns["Value"].ColumnName;
      ddlCCExpirationMonth.DataBind();
      ddlCCExpirationMonth.SelectedIndexChanged += new System.EventHandler(BindCategories);
    }


    protected void BuildDDLExpirationYear(meis007Entities _meis007Entities)
    {
      DataTable table = new DataTable();
      table.Columns.Add("Text");
      table.Columns.Add("Value");
      DataRow dr;
      var startYear = DateTime.Now.Year;
      var endYear = DateTime.Now.Year + 5;
      for (int i = startYear; i <= endYear; i++)
      {
        dr = table.NewRow();
        dr["Value"] = i + 1;
        dr["Text"] = i;
        table.Rows.Add(dr);
      }
      ddlCCExpirationYear.DataSource = table;
      ddlCCExpirationYear.DataTextField = table.Columns["Text"].ColumnName;
      ddlCCExpirationYear.DataValueField = table.Columns["Value"].ColumnName;
      ddlCCExpirationYear.DataBind();
      ddlCCExpirationYear.SelectedIndexChanged += new System.EventHandler(BindCategories);
    }
}