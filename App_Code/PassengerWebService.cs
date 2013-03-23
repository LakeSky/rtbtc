using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using meis007Model;
using System.Dynamic;

/// <summary>
/// Summary description for PassengerWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class PassengerWebService : System.Web.Services.WebService {

    public PassengerWebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string AddPassenger(string id, string title, string firstname, string middlename, string lastname, string dob, string nationality) {
        var customerSNO = long.Parse(id);
        var dobParsed = DateTimeHelper.ConvertToDate(dob);
        meis007Entities _meis007Entities = new meis007Entities();
        var passenger = new B2CPaxinfo { Title = title, PaxFirstName = firstname, PaxMiddleName = middlename, PaxLastName = lastname, PaxDOB = dobParsed, Nationality = nationality, ForeignCustomerSNo = customerSNO, CustomerId = 0 };
        _meis007Entities.AddToB2CPaxinfo(passenger);
        _meis007Entities.SaveChanges();
        return passenger.CustomerSno.ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public Passenger GetPassenger(string id)
    {
        var customerId = long.Parse(id);
        meis007Entities _meis007Entities = new meis007Entities();
        var passenger = _meis007Entities.B2CPaxinfo.Where(x => x.CustomerSno == customerId).First();
        var customPassenger = new Passenger { title = passenger.Title, firstname = passenger.PaxFirstName, middlename = passenger.PaxMiddleName, lastname = passenger.PaxLastName, dob = DateTimeHelper.ConvertToString(passenger.PaxDOB.ToString()), nationality = passenger.Nationality, id = passenger.CustomerSno.ToString(), customerid = passenger.CustomerId.ToString() };
        return customPassenger;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string EditPassenger(string id, string title, string firstname, string middlename, string lastname, string dob, string nationality)
    {
        var customerId = long.Parse(id);
        var dobParsed = DateTimeHelper.ConvertToDate(dob);
        meis007Entities _meis007Entities = new meis007Entities();
        var passenger = _meis007Entities.B2CPaxinfo.Where(x => x.CustomerSno == customerId).First();
        passenger.Title = title;
        passenger.PaxFirstName = firstname;
        passenger.PaxMiddleName = middlename;
        passenger.PaxLastName = lastname;
        passenger.PaxDOB = dobParsed;
        passenger.Nationality = nationality;
        _meis007Entities.SaveChanges();
        return passenger.CustomerSno.ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void DeletePassenger(string id) {
        var customerId = long.Parse(id);
        meis007Entities _meis007Entities = new meis007Entities();
        var passenger = _meis007Entities.B2CPaxinfo.Where(x => x.CustomerSno == customerId).First();
        _meis007Entities.DeleteObject(passenger);
        _meis007Entities.SaveChanges();
        return;
    }
    
}

public class Passenger {
    public string id { get; set; }
    public string title { get; set; }
    public string firstname { get; set; }
    public string middlename { get; set; }
    public string lastname { get; set; }
    public string dob { get; set; }
    public string nationality { get; set; }
    public string customerid { get; set; }
}
