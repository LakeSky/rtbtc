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
        var customerId = long.Parse(GetCustomerId());
        var customer = _meis007Entities.CustomerMasters.Where(x => x.CustomerID == customerId).First();
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