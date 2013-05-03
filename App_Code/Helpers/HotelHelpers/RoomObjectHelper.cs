using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using meis007Model;

/// <summary>
/// Summary description for RoomObjectHelper
/// </summary>
public static class RoomObjectHelper
{
    public static List<SupplierHotelRoomHelper> GetHotelRooms(long supplierHotelInfoId, meis007Entities _meis007Model, BasketHelper basketHelper)
    {
        var roomsList = new List<SupplierHotelRoomHelper>();
        SupplierHotelRoomHelper supplierHotelRoomHelper;
        decimal price = decimal.Parse("0.0");
        string sessionId;
        string supplierId;
        int supplierHotelId;
        int nights;
        int passengers;
        int children;
        int roomId = -1;
        if (basketHelper == null){
            var supplierHotelInfo = _meis007Model.SuppliersHotelsInfoes.Where(x => x.HotelInfoID == supplierHotelInfoId).First();
            sessionId = supplierHotelInfo.SessionID;
            supplierId = supplierHotelInfo.SupplierID;
            supplierHotelId = int.Parse(supplierHotelInfo.HotelID.ToString());
            nights = int.Parse(supplierHotelInfo.NumOfNights.ToString());
            passengers = int.Parse(supplierHotelInfo.NumOfPassengers.ToString());
            children = int.Parse(supplierHotelInfo.NumOfChildrens.ToString());
        }else {
            BasketHotelDetails basketHotelDetails = basketHelper.hotelDetails.Where(x => x.hotelInfoId == supplierHotelInfoId).First();
            sessionId = basketHotelDetails.sessionId;
            supplierId = basketHotelDetails.supplierId;
            supplierHotelId = basketHotelDetails.supplierHotelId;
            nights = basketHotelDetails.NoOfNights;
            passengers = basketHotelDetails.NoOfPassengers;
            children = basketHotelDetails.NoOfChildren;
            roomId = basketHotelDetails.supplierRoomId;
        }

        var _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ToString());
        _sqlConnection.Open();
        var _sqlCommand = new SqlCommand("spProductMasterTest", _sqlConnection);
        _sqlCommand.CommandType = CommandType.StoredProcedure;
        _sqlCommand.Parameters.AddWithValue("@Trans", "SearchMultipleRooms");
        _sqlCommand.Parameters.AddWithValue("@SessionId", sessionId);
        _sqlCommand.Parameters.AddWithValue("@SupplierId", supplierId);
        _sqlCommand.Parameters.AddWithValue("@SupplierHotelId", supplierHotelId);
        _sqlCommand.Parameters.AddWithValue("@Nights", nights);
        _sqlCommand.Parameters.AddWithValue("@Passengers", passengers);
        _sqlCommand.Parameters.AddWithValue("@Children", children);
        var _sqlDataReader = _sqlCommand.ExecuteReader();
        while (_sqlDataReader.Read())
        {
            if (basketHelper == null || (roomId == int.Parse(_sqlDataReader["RoomID"].ToString())))
            {
                price = decimal.Parse("0.0");
                if (!string.IsNullOrEmpty(_sqlDataReader["LCAP"].ToString()))
                {
                    price = Math.Floor(decimal.Parse(_sqlDataReader["LCAP"].ToString()) / passengers);
                }
                supplierHotelRoomHelper = new SupplierHotelRoomHelper
                {
                    HotelInfoId = long.Parse(_sqlDataReader["HotelInfoID"].ToString()),
                    SupplierName = _sqlDataReader["SupplierName"].ToString(),
                    RoomId = int.Parse(_sqlDataReader["RoomID"].ToString()),
                    RoomName = _sqlDataReader["RoomName"].ToString(),
                    RoomType = _sqlDataReader["RoomType"].ToString(),
                    Price = price
                };
                roomsList.Add(supplierHotelRoomHelper);
            }
        }
        _sqlConnection.Close();
        roomsList = roomsList.OrderBy(x => x.RoomName).ToList();
        return roomsList;
    }
}