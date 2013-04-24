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
    public static string GetCustomerId() {
        var _customerId = "";
        _customerId = (string)(HttpContext.Current.Session["CustomerId"]);
        if (_customerId != null && !string.IsNullOrEmpty(_customerId)) {
            return _customerId;
        }
        _customerId = "";
        SqlConnection _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ToString());
        _sqlConnection.Open();
        SqlCommand _sqlCommand = new SqlCommand("SELECT * FROM SysParameters;", _sqlConnection);
        SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
        while (_sqlDataReader.Read()) {
            if (_sqlDataReader["ParameterName"].ToString() == "B2CCustomerID"){
                _customerId = _sqlDataReader["ParameterValue"].ToString();
            }
        }
        _sqlConnection.Close();
        return _customerId;
    }

    public static int GetServiceId(string serviceName)
    {
        meis007Entities _meis007Entities = new meis007Entities();
        return _meis007Entities.ServicesMasters.Where(x => x.ServiceName == serviceName).First().ServiceID;
    }

    public static string GetSupplierName(string supplierId) { 
        string supplierName = "";
         SqlConnection _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ToString());
        _sqlConnection.Open();
        SqlCommand _sqlCommand = new SqlCommand("SELECT SupplierName FROM SupplierMaster WHERE SupplierID = @supplierId;", _sqlConnection);
        _sqlCommand.Parameters.AddWithValue("@supplierId", supplierId);
        SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
        while (_sqlDataReader.Read()) {
            supplierName = _sqlDataReader["SupplierName"].ToString();
        }
        _sqlConnection.Close();
        if (supplierName == "TOURICO") {
            supplierName = Suppliers.Tourico.ToString();
        }
        return supplierName;
    }

    public static bool IsInetrnalSupplier(string supplierId) {
        return supplierId == "1020";
    }

    public static string GetBookingType() {
        return "B2C";
    }

    public static string GetBookingStatus() {
        return "CC";
    }

    public static string GetBaseCurrency() {
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
}