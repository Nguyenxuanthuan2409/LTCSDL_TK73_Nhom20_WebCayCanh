using System;
using System.Collections.Generic;

namespace WebCayCanh.DAL.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Order = new HashSet<Order>();
        }

        public string CustomerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Street { get; set; }
        public string District { get; set; }
        public string City { get; set; }
        public string CustomerDescription { get; set; }

        internal void SetError(string stackTrace)
        {
            throw new NotImplementedException();
        }

        public virtual ICollection<Order> Order { get; set; }
    }
}
