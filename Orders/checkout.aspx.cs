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
using System.Configuration;

public partial class Orders_checkout : PaymentGatewayHelper
{
    public BasketHelper basketHelper;
    meis007Entities _meis007Entities;
    public List<TextValue> monthsList;
    public List<TextValue> yearList;
    TextValue textValObj;
    protected void Page_Load(object sender, EventArgs e)
    {
        basketHelper = GetBasketHelperObject();
        if (basketHelper == null || !hasBasketItems(basketHelper))
        {
            Session["ErrorMessage"] = "You dont have any items in basket please add it !";
            Response.Redirect(Route.GetRootPath("home.aspx"));
            return;
        }
        if (!IsPostBack)
        {
            BuildInitialVariables();
            _meis007Entities = new meis007Entities();
            var userId = CurrentUser.Id();
            var data = _meis007Entities.B2CPaxinfo.Where(x => x.ForeignCustomerSNo == userId).OrderBy(x => x.CustomerSno).First();
            lblTitle.Text = data.Title;
            txtFirstName.Text = data.PaxFirstName;
            txtMiddleName.Text = data.PaxMiddleName;
            txtLastName.Text = data.PaxLastName;
            txtMobile.Text = data.B2CCustomerinfo.PaxmobileNo;
            //txtCCHolderName.Text = data.PaxFirstName + " " + data.PaxLastName;
            txtTelephone.Text = data.B2CCustomerinfo.PaxTelNo;
            btnConfirmOrder.PostBackUrl = AliasUrl();
            BuildDDLExpirationMonths(_meis007Entities);
            BuildDDLExpirationYear(_meis007Entities);
        }
    }

    protected void btnConfirmOrder_Click(object sender, EventArgs e)
    {
        _meis007Entities = new meis007Entities();
        basketHelper = GetBasketHelperObject();
        if (false)
        {
            ShowError("Please Correct the credit card fields!");
            return;
        }
        //var localCC = LocalGateway.CreateCreditCard(res, _meis007Entities);
        var sequence = _meis007Entities.BasketSequences.OrderBy(x => x.Id).First();
        var basketSequence = sequence.SequenceNumber + 1;
        sequence.SequenceNumber = basketSequence;
        _meis007Entities.SaveChanges();
        //var localTrans = LocalGateway.CreateTransaction(localCC, res, basketSequence, _meis007Entities);
        SuppliersHotelsInfo suppliersHotelsInfo;
        var hotelsToRemove = new List<BasketHotelDetails>();
        SupplierBooking supplierBooking;
        LocalBooking localBooking;
        string name = txtFirstName.Text + " " + txtMiddleName.Text + " " + txtLastName.Text;
        foreach (var x in basketHelper.hotelDetails)
        {
            if (!DbParameter.IsInetrnalSupplier(x.supplierId))
            {
                suppliersHotelsInfo = _meis007Entities.SuppliersHotelsInfoes.Where(y => y.HotelInfoID == x.hotelInfoId).First();
                supplierBooking = new SupplierBooking(suppliersHotelsInfo, x, txtFirstName.Text, txtMiddleName.Text, txtLastName.Text, txtMobile.Text, txtTelephone.Text, Session["cityCode"].ToString(), lblTitle.Text, txtRemarks.Text);
                string reservartionId = supplierBooking.Book();
                var obj = _meis007Entities.HotelBookings.Where(y => y.HotelInfoId == x.hotelInfoId).FirstOrDefault();
                if (obj != null)
                {
                    //var array = obj.ReservationId.Split('~');
                    //localBooking = new LocalBooking(_meis007Entities, suppliersHotelsInfo, x, null, obj, basketSequence, array[0].ToString().Trim(), array[1].ToString().Trim(), name, "Hotel", txtRemarks.Text, "999");// localTrans.Id);
                    //localBooking.Create();
                    //hotelsToRemove.Add(x);
                    //shams adding if condition 
                    if (suppliersHotelsInfo.SupplierID == "1006")
                    {
                        var array = obj.ReservationId.Split('~');
                        localBooking = new LocalBooking(_meis007Entities, suppliersHotelsInfo, x, null, obj, basketSequence, array[0].ToString().Trim(), array[1].ToString().Trim(), name, "Hotel", txtRemarks.Text, "999");
                        localBooking.Create();
                        hotelsToRemove.Add(x);

                    }

                    if (suppliersHotelsInfo.SupplierID == "1008")
                    {

                        localBooking = new LocalBooking(_meis007Entities, suppliersHotelsInfo, x, null, obj, basketSequence, obj.ReservationId, obj.ReservationId, name, "Hotel", txtRemarks.Text, "999");
                        localBooking.Create();
                        hotelsToRemove.Add(x);

                    }
                }
            }
        }
        foreach (var x in basketHelper.packageDetails)
        {
            localBooking = new LocalBooking(_meis007Entities, null, null, x, null, basketSequence, "", "", name, "Package", txtRemarks.Text, "999");// localTrans.Id);
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
        foreach (var x in hotelsToRemove)
        {
            basketHelper.hotelDetails.Remove(x);
        }
    }

    private void BindCategories(object sender, EventArgs e)
    {
    }

    protected void BuildDDLExpirationMonths(meis007Entities _meis007Entities)
    {
        monthsList = new List<TextValue>();
        var months = CultureInfo.CurrentUICulture.DateTimeFormat.MonthNames;
        for (int i = 0; i < 12; i++)
        {
            textValObj = new TextValue
            {
                Text = months[i],
                Value = (i + 1).ToString().PadLeft(2, '0')
            };
            monthsList.Add(textValObj);
        }
    }

    protected void BuildDDLExpirationYear(meis007Entities _meis007Entities)
    {
        yearList = new List<TextValue>();
        var startYear = DateTime.Now.Year;
        var endYear = DateTime.Now.Year + 5;
        for (int i = startYear; i <= endYear; i++)
        {
            textValObj = new TextValue
            {
                Text = i.ToString(),
                Value = i.ToString()
            };
            yearList.Add(textValObj);
        }
    }

    protected void ShowError(string message)
    {
        Session["ErrorMessage"] = message;
    }
}