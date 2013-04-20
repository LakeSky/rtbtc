using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class BasketPackageDetails
    {
        public int Id { get; set; }
        public long PackageId { get; set; }
        public string PackageName { get; set; }
        public string DisplayImage { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime ValidTo { get; set; }
        public double PricePerPerson { get; set; }
        public double TotalPrice { get; set; }
        public DateTime From { get; set; }
        public List<BasketPackagePassengersDetails> Passengers { get; set; }

        public void calculateTotalPrice()
        {
            TotalPrice = PricePerPerson * Passengers.Count;
        }
}
