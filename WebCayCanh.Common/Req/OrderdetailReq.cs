using System;
using System.Collections.Generic;
using System.Text;

namespace WebCayCanh.Common.Req
{
    public  class OrderdetailReq
    {
        public string OrderdetailId { get; set; }
        public double? Price { get; set; }
        public int? Quantity { get; set; }
        public string OrderId { get; set; }
        public string ProductId { get; set; }
        public string Userid { get; set; }
        public string OrderdetailDescription { get; set; }
    }
}
