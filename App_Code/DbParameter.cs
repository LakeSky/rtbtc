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
        _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["AMSConnectionString"].ToString());
        _sqlConnection.Open();
        var query = "SELECT podm.po_number, podmd.requested_end_user, podmd.department, podmd.building, podmd.floor, podmd.ram, podmd.hdd, podmd.serial_number, podmd.warranty_period, podmd.installation_date, podmd.end_user, podmd.vendor, podmd.assest_retired_date, h.name as hardware_name, m.number as model_number, u.email as user_email, os.name as operating_system_name from po_delivery_master_details podmd INNER JOIN po_deliveries_master podm ON podm.id = podmd.po_delivery_master_id LEFT OUTER JOIN hardwares h ON podmd.hardware_id = h.id LEFT OUTER JOIN models m ON podmd.model_id = m.id LEFT OUTER JOIN users u ON podmd.user_id = u.id LEFT OUTER JOIN operating_systems os ON podmd.operating_system_id = os.id WHERE podmd.department = @department ORDER BY podmd.created_at";
        _sqlCommand = new SqlCommand(query, _sqlConnection);
        _sqlDataReader = _sqlCommand.ExecuteReader();
        return _sqlDataReader;
    }
}