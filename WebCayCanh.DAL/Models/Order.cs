using System;
using System.Collections.Generic;

namespace WebCayCanh.DAL.Models
{
    public partial class Order
    {
        public Order()
        {
            Orderdetail = new HashSet<Orderdetail>();
        }

        public string OrderId { get; set; }
        public DateTime? OrderDate { get; set; }
        public int? OrderNumber { get; set; }
        public string CustomerId { get; set; }
        public string OrderDescription { get; set; }

        public virtual Customer Customer { get; set; }
        public virtual ICollection<Orderdetail> Orderdetail { get; set; }

        internal void SetError(string stackTrace)
        {
            throw new NotImplementedException();
        }
    }
}
