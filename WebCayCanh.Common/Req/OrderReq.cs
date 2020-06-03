using System;
using System.Collections.Generic;
using System.Text;

namespace WebCayCanh.Common.Req
{
    public class OrderReq
    {
        public string OrderId { get; set; }
        public DateTime? OrderDate { get; set; }
        public int? OrderNumber { get; set; }
        public string CustomerId { get; set; }
        public string OrderDescription { get; set; }
    }
}
