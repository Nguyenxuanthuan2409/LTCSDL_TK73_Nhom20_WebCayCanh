using System;
using System.Collections.Generic;
using System.Text;

namespace WebCayCanh.Common.Req
{
    public class CustomerReq
    {
        public string CustomerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Street { get; set; }
        public string District { get; set; }
        public string City { get; set; }
        public string CustomerDescription { get; set; }
    }
}
