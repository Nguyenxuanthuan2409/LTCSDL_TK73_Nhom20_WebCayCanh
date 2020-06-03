using System;
using System.Collections.Generic;

namespace WebCayCanh.DAL.Models
{
    public partial class Users
    {
        public Users()
        {
            Orderdetail = new HashSet<Orderdetail>();
           
        }

        public string Userid { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string Passwords { get; set; }
        public bool? IsActive { get; set; }

        internal void SetError(string stackTrace)
        {
            throw new NotImplementedException();
        }

        public string PhoneNumber { get; set; }
        public byte[] UsersImage { get; set; }
        public string UsersDescription { get; set; }

        public virtual ICollection<Orderdetail> Orderdetail { get; set; }
       
    }
}
