using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using meis007Model;
using RTCEntities.ENUMS;

/// <summary>
/// Summary description for Parameter
/// </summary>
public static class DbParameter
{
    public static string GetCustomerId()
    {
        var _customerId = "";
        _customerId = (string)(HttpContext.Current.Session["CustomerId"]);
        if (_customerId != null && !string.IsNullOrEmpty(_customerId))
        {
            return _customerId;
        }
        _customerId = "";
        SqlConnection _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ToString());
        _sqlConnection.Open();
        SqlCommand _sqlCommand = new SqlCommand("SELECT * FROM SysParameters;", _sqlConnection);
        SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
        while (_sqlDataReader.Read())
        {
            if (_sqlDataReader["ParameterName"].ToString() == "B2CCustomerID")
            {
                _customerId = _sqlDataReader["ParameterValue"].ToString();
                HttpContext.Current.Session["CustomerId"] = _customerId;
            }
        }
        _sqlConnection.Close();
        return _customerId;
    }

    public static string GetManagerEmail()
    {
        var email = string.Empty;
        email = (string)(HttpContext.Current.Session["ManagerEmail"]);
        if (email != null && !string.IsNullOrEmpty(email))
        {
            return email;
        }
        SqlConnection _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ToString());
        _sqlConnection.Open();
        SqlCommand _sqlCommand = new SqlCommand("SELECT ParameterValue FROM SysParameters where ParameterName='ContactingManager';", _sqlConnection);
        SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
        while (_sqlDataReader.Read())
        {
            email = _sqlDataReader["ParameterValue"].ToString();
            HttpContext.Current.Session["ManagerEmail"] = email;
        }
        _sqlConnection.Close();
        return email;
    }

    public static CustomerMaster GetCustomer(meis007Entities _meis007Entities) {
        CustomerMaster cust = (CustomerMaster)(HttpContext.Current.Session["CustomerMaster"]);
        if (_meis007Entities == null)
        {
            _meis007Entities = new meis007Entities();
        }
        var customerId = long.Parse(GetCustomerId());
        cust = _meis007Entities.CustomerMasters.Where(x => x.CustomerID == customerId).First();
        return cust;
    }

    public static string  GetCustomerConsultantID(string CustomerID)
    {

        string CustConsultantID = "";
        SqlConnection _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ToString());
        _sqlConnection.Open();
        SqlCommand _sqlCommand = new SqlCommand("SELECT top 1 ConsultantID FROM CustConsultantMaster WHERE CustomerID = @CustomerID;", _sqlConnection);
        _sqlCommand.Parameters.AddWithValue("@CustomerID", CustomerID);
        SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
        while (_sqlDataReader.Read())
        {
            CustConsultantID = _sqlDataReader["ConsultantID"].ToString();
        }
        _sqlConnection.Close(); 
        return CustConsultantID;
       
    }

    public static UserMaster GetInternalCnsultant(meis007Entities _meis007Entities)
    {
        UserMaster user = (UserMaster)(HttpContext.Current.Session["InternalConsultant"]);
        if (user != null)
        {
            return user;
        }
        if (_meis007Entities == null)
        {
            _meis007Entities = new meis007Entities();
        }
        var customer = GetCustomer(_meis007Entities);
        user = _meis007Entities.UserMasters.Where(x => x.userid == customer.InhouseConsultantID).First();
        HttpContext.Current.Session["InternalConsultant"] = user;
        return user;
    }

    public static int GetServiceId(string serviceName)
    {
        meis007Entities _meis007Entities = new meis007Entities();
        return _meis007Entities.ServicesMasters.Where(x => x.ServiceName == serviceName).First().ServiceID;
    }

    public static string GetServiceName(int serviceId)
    {
        meis007Entities _meis007Entities = new meis007Entities();
        return _meis007Entities.ServicesMasters.Where(x => x.ServiceID == serviceId).First().ServiceName;
    }

    public static string GetSupplierName(string supplierId)
    {
        string supplierName = "";
        SqlConnection _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ToString());
        _sqlConnection.Open();
        SqlCommand _sqlCommand = new SqlCommand("SELECT SupplierName FROM SupplierMaster WHERE SupplierID = @supplierId;", _sqlConnection);
        _sqlCommand.Parameters.AddWithValue("@supplierId", supplierId);
        SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
        while (_sqlDataReader.Read())
        {
            supplierName = _sqlDataReader["SupplierName"].ToString();
        }
        _sqlConnection.Close();
        if (supplierName == "TOURICO")
        {
            supplierName = Suppliers.Tourico.ToString();
        }
        if (supplierName == "TRAVCO")
        {
            supplierName = Suppliers.Travco.ToString();
        }
        if (supplierName == "HOTELBEDS")
        {
            supplierName = Suppliers.HotelBeds.ToString();
        }
        if (supplierName == "DOTW")
        {
            supplierName = Suppliers.Dotw.ToString();
        }
        return supplierName;
    }

    public static string GetIneternalSupplierId()
    {
        var internalSupplierId = "";
        internalSupplierId = (string)(HttpContext.Current.Session["InternalSupplierId"]);
        if (internalSupplierId != null && !string.IsNullOrEmpty(internalSupplierId))
        {
            return internalSupplierId;
        }
        internalSupplierId = "";
        SqlConnection _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ToString());
        _sqlConnection.Open();
        SqlCommand _sqlCommand = new SqlCommand("SELECT * FROM SysParameters;", _sqlConnection);
        SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
        while (_sqlDataReader.Read())
        {
            if (_sqlDataReader["ParameterName"].ToString() == "InternalSupplierID")
            {
                internalSupplierId = _sqlDataReader["ParameterValue"].ToString();
                HttpContext.Current.Session["InternalSupplierId"] = internalSupplierId;
            }
        }
        _sqlConnection.Close();
        return internalSupplierId;
    }

    public static bool IsInetrnalSupplier(string supplierId)
    {
        return supplierId == GetIneternalSupplierId();
    }

    public static string GetBookingType()
    {
        return "B2C";
    }

    public static string GetBookingStatus(string type = "book")
    {
        string status = "CC";
        if (type == "cancel")
        {
            status = "XX";
        }
        else if (type == "existingCancel")
        {
            status = "CX";
        }
        return status;
    }

    public static string GetBaseCurrency()
    {
        var baseCurrency = "SAR";
        SqlConnection _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ToString());
        _sqlConnection.Open();
        SqlCommand _sqlCommand = new SqlCommand("SELECT * FROM SysParameters;", _sqlConnection);
        SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
        while (_sqlDataReader.Read())
        {
            if (_sqlDataReader["ParameterName"].ToString() == "SystemCurrency")
            {
                baseCurrency = _sqlDataReader["ParameterValue"].ToString();
            }
        }
        _sqlConnection.Close();
        baseCurrency = string.IsNullOrEmpty(baseCurrency) ? "SAR" : baseCurrency;
        return baseCurrency;
    }

    public static PGMaster GetGateway(string name, meis007Entities _meis007Entities)
    {
        PGMaster paymentGateway = null;
        if (_meis007Entities == null)
        {
            _meis007Entities = new meis007Entities();
        }
        switch (name)
        {
            case "paypal":
                paymentGateway = _meis007Entities.PGMasters.Where(x => x.ID == 1).First();
                break;
        }
        return paymentGateway;
    }
}