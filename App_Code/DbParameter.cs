using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Parameter
/// </summary>
public static class DbParameter
{
    public static string GetCustomerId() {
        var _customerId = "";
        _customerId = (string)(HttpContext.Current.Session["CustomerId"]);
        if (_customerId != null) {
            return _customerId;
        }
        _customerId = "";
        SqlDataReader _sqlDataReader = GetData();
        while (_sqlDataReader.Read()) {
            if (_sqlDataReader["ParameterName"] == "B2CCustomerID") {
                _customerId = _sqlDataReader["ParameterValue"].ToString();
            }
        }
        return _customerId;
    }

    public static SqlDataReader GetData(){
        SqlConnection _sqlConnection;
        SqlCommand _sqlCommand;
        SqlDataReader _sqlDataReader;
        _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ToString());
        _sqlConnection.Open();
        var query = "SELECT * from SysParameters;";
        _sqlCommand = new SqlCommand(query, _sqlConnection);
        _sqlDataReader = _sqlCommand.ExecuteReader();
        return _sqlDataReader;
    }
}