using System;
using System.Collections.Generic;
using System.Text;

namespace WebCayCanh.Common.Req
{
    public class UsersReq
    {
        public string Userid { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string Passwords { get; set; }
        public bool? IsActive { get; set; }
        public string PhoneNumber { get; set; }
        public byte[] UsersImage { get; set; }
        public string UsersDescription { get; set; }
    }
}
