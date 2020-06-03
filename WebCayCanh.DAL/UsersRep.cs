using System;
using System.Collections.Generic;
using System.Text;
using WebCayCanh.Common.DAL;
using System.Linq;

namespace WebCayCanh.DAL
{
    using WebCayCanh.DAL.Models;
    public class UsersRep : GenericRep<WEBCAYCANHContext, Users>
    {
        #region -- Overides --
        public override Users Read(string id)
        {
            var res = new Users();
            try
            {
                res = All.FirstOrDefault(p => string.Compare(p.Userid, id) == 0);
            }
            catch (Exception ex)
            {
                res.SetError(ex.StackTrace);
            }
            return res;


        }

        public string Remove(string id)
        {

            var m = base.All.First(i => id.Contains(i.Userid));
            Context.Users.Remove(m);
            Context.SaveChanges();
            return m.Userid;

        }
        #endregion
    }
}
