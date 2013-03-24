using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ShoppingRoomHelper
/// </summary>
public class ShoppingRoomHelper
{
    public string RoomName { get; set; }
    public int Adults { get; set; }
    public int Kids { get; set; }
    public int Infants { get; set; }
    public List<int> ChildAge { get; set; }
}