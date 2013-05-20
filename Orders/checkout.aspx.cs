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

public partial class Orders_checkout : PublicApplicationPage
{
    public BasketHelper basketHelper;
    meis007Entities _meis007Entities;
    protected void Page_Load(object sender, EventArgs e)
    {
       basketHelper = GetBasketHelperObject();
        if (basketHelper == null || !hasBasketItems(basketHelper)) {
            Session["ErrorMessage"] = "You dont have any items in basket please add it !";
            Response.Redirect(Route.GetRootPath("home.aspx"));
        }
        _meis007Entities = new meis007Entities();
        var userId = CurrentUser.Id();
        var data = _meis007Entities.B2CPaxinfo.Where(x => x.ForeignCustomerSNo == userId).OrderBy(x => x.CustomerSno).First();
        txtFirstName.Text = data.PaxFirstName;
        txtMiddleName.Text = data.PaxMiddleName;
        txtLastName.Text = data.PaxLastName;
        txtMobile.Text = data.B2CCustomerinfo.PaxmobileNo;
        txtTelephone.Text = data.B2CCustomerinfo.PaxTelNo;
    }

    protected void btnConfirmOrder_Click(object sender, EventArgs e)
    {
        _meis007Entities = new meis007Entities();
        var sequence = _meis007Entities.BasketSequences.OrderBy(x => x.Id).First();
        var basketSequence = sequence.SequenceNumber + 1;
        sequence.SequenceNumber = basketSequence;
        _meis007Entities.SaveChanges();
        SuppliersHotelsInfo suppliersHotelsInfo;
        basketHelper = GetBasketHelperObject();
        var hotelsToRemove = new List<BasketHotelDetails>();
        SupplierBooking supplierBooking;
        LocalBooking localBooking;
        string name;
        foreach (var x in basketHelper.hotelDetails) {
            if (!DbParameter.IsInetrnalSupplier(x.supplierId)) {
                suppliersHotelsInfo = _meis007Entities.SuppliersHotelsInfoes.Where(y => y.HotelInfoID == x.hotelInfoId).First();
                supplierBooking = new SupplierBooking(suppliersHotelsInfo, x, txtFirstName.Text, txtMiddleName.Text, txtLastName.Text, txtMobile.Text, txtTelephone.Text);
                string reservartionId = supplierBooking.Book();
                var obj = _meis007Entities.HotelBookings.Where(y => y.HotelInfoId == x.hotelInfoId).FirstOrDefault();
                if (obj != null)
                {
                    name = txtFirstName.Text + " " + txtMiddleName.Text + " " + txtLastName.Text;
                    var array = obj.ReservationId.Split('~');
                    localBooking = new LocalBooking(_meis007Entities, suppliersHotelsInfo, x, obj, basketSequence, array[0].ToString().Trim(), array[1].ToString().Trim(), name, "Hotel");
                    localBooking.Create();
                    hotelsToRemove.Add(x);
                }
            }
        }
        RemoveHotels(basketHelper, hotelsToRemove);
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
}