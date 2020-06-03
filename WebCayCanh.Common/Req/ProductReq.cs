using System;
using System.Collections.Generic;
using System.Text;

namespace WebCayCanh.Common.Req
{
    public class ProductReq
    {
        public string ProductId { get; set; }
        public string ProductName { get; set; }
        public int? Amount { get; set; }
        public int? AmountRemaining { get; set; }
        
        public double? OldPrice { get; set; }
        public byte[] ProductImage { get; set; }
        public string ManufacturerId { get; set; }
        public string CategoryId { get; set; }
        public string ProductDescription { get; set; }
    }
}
