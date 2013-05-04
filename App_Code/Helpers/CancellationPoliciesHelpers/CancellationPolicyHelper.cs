﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RTCDataModel.RTCEntities;
using RTCModel.Models;
using RTCEntities.ENUMS;
using meis007Model;

public class CancellationPolicyHelper
{
    public string FromDate { get; set; }
    public string ToDate { get; set; }
    public string ChargingType { get; set; }

    public static List<CancellationPolicyHelper> GetCancelPolicies(string id, string supplierName, string startDateTime, string endDateTime)
    {
        long hotelInfoId = long.Parse(id);
        var startDate = DateTime.Parse(startDateTime);
        var endDate = DateTime.Parse(endDateTime);
        meis007Entities _meis007Entities = new meis007Entities();
        var obj = _meis007Entities.SuppliersHotelsInfoes.Where(x => x.HotelInfoID == hotelInfoId).First();
        SupplierCancellationPolicies supplierCancellationPolicies = new SupplierCancellationPolicies(_meis007Entities, obj, supplierName, startDateTime, endDateTime);
        var policyAvailable = supplierCancellationPolicies.CheckPoliciesAvailable();
        List<CancellationPolicyHelper> list = new List<CancellationPolicyHelper>();
        CancellationPolicyHelper _cancellationPolicyHelper;
        if (policyAvailable)
        {
            var start_date = DateTime.Now.ToString("dd MMM - ");
            foreach (var x in supplierCancellationPolicies.GetPolicies())
            {
                _cancellationPolicyHelper = BuildCancelPolicy(start_date, endDate, x);
                start_date = _cancellationPolicyHelper.ToDate + " - ";
                list.Add(_cancellationPolicyHelper);
            }
            _cancellationPolicyHelper = BuildCancelPolicy(start_date, endDate, null, true);
            list.Add(_cancellationPolicyHelper);
        }
        else
        {
            _cancellationPolicyHelper = new CancellationPolicyHelper
            {
                ChargingType = "Full Charge",
                FromDate = "",
                ToDate = ""
            };
            list.Add(_cancellationPolicyHelper);
        }
        return list;
    }

    public static CancellationPolicyHelper BuildCancelPolicy(string start_date, DateTime endDate, BaseCancellationPolicy x, bool fullCharge = false)
    {
        var _cancellationPolicyHelper = new CancellationPolicyHelper
        {
            FromDate = start_date
        };
        if (fullCharge) {
            _cancellationPolicyHelper.ChargingType = "Full Charges (No Refund)";
            _cancellationPolicyHelper.ToDate = "";
        }
        else
        {
            _cancellationPolicyHelper.ToDate = endDate.AddHours(-(int.Parse(x.UnitMultiplier.ToString()))).ToString("dd MMM");
            if (x.BasisType == "Nights")
            {
                _cancellationPolicyHelper.ChargingType = "Charges " + x.NumberOfNights.ToString() + " " + x.BasisType;
            }
            else
            {
                _cancellationPolicyHelper.ChargingType = x.Percentage.ToString() + " " + x.BasisType;
            }
        }
        return _cancellationPolicyHelper;
    }
}