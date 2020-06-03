using System;
using System.Collections.Generic;
using System.Text;
using WebCayCanh.Common.Rsp;
using WebCayCanh.Common.BLL;

namespace WebCayCanh.BLL
{
    using DAL;
    using System.Linq;
    using WebCayCanh.Common.Req;
    using WebCayCanh.DAL.Models;
    using WebCayCanh.DAL.Req;

    public class UsersSvc : GenericSvc<UsersRep, Users>
    {
        #region -- Overrides --

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the object</returns>
        public override SingleRsp Read(string id)
        {
            var res = new SingleRsp();
            try
            {
                var m = _rep.Read(id);
                res.Data = m;
            }
            catch (Exception ex)
            {
                res.SetError(ex.StackTrace);
            }

            return res;
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="m">The model</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Update(Users m)
        {
            var res = new SingleRsp();
            try
            {
                var m1 = m.Userid != null ? _rep.Read(m.Userid) : _rep.Read(m.UsersDescription);
                if (m1 == null)
                {
                    res.SetError("EZ103", "No data.");
                }
                else
                {
                    res = base.Update(m);
                    res.Data = m;
                }
            }
            catch (Exception ex)
            {
                res.SetError(ex.StackTrace);
            }


            return res;
        }

        public SingleRsp CreateUsers(UsersReq req)
        {
            var res = new SingleRsp();
            try
            {
                Users c = new Users();
                c.Userid = req.Userid;
                c.Email = req.Email;
                c.FirstName = req.FirstName;
                c.LastName = req.LastName;
                c.Username = req.Username;
                c.Passwords = req.Passwords;
                c.IsActive = req.IsActive;
                c.PhoneNumber = req.PhoneNumber;
                c.UsersImage = req.UsersImage;
                c.UsersDescription = req.UsersDescription;

                //
                res = base.Create(c);
                res.Data = c;
            }
            catch (Exception ex)
            {
                res.SetError(ex.StackTrace);
            }

            return res;
        }

        public SingleRsp UpdateUsers(UsersReq req)
        {
            var res = new SingleRsp();
            try
            {
                Users c = new Users();
                c.Userid = req.Userid;
                c.Email = req.Email;
                c.FirstName = req.FirstName;
                c.LastName = req.LastName;
                c.Username = req.Username;
                c.Passwords = req.Passwords;
                c.IsActive = req.IsActive;
                c.PhoneNumber = req.PhoneNumber;
                c.UsersImage = req.UsersImage;
                c.UsersDescription = req.UsersDescription;
                //
                res = base.Update(c);
                res.Data = c;
            }
            catch (Exception ex)
            {
                res.SetError(ex.StackTrace);
            }

            return res;
        }

        public object SearchUsers(string keyWord, int size, int page)
        {

            var query = All; //Lấy toàn bộ dữ liệu của bảng customers
            if (!string.IsNullOrEmpty(keyWord)) //Kiểm tra keyWord có trống không
            {
                //Lấy dữ liệu theo keyWord ở bảng
                query = All.Where(x => x.Userid.Contains(keyWord) || x.FirstName.Contains(keyWord) || x.LastName.Contains(keyWord) || x.Username.Contains(keyWord));
            }
            //Độ dời. Thứ tự dữ liệu sẽ bắt đầu từ offset
            var offset = (page - 1) * size;
            //Tổng cộng bao nhiêu dữ liệu được tìm thấy
            var total = query.Count();
            //Tổng số trang
            //Ví dụ: 12 DL / Size 5 thì bằng 2 sẽ dư 2. Do đó phải có 3 trang để chứa đủ 12 DL
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            //Lấy data tìm được
            //Dời tới offset theo size. Dữ liệu được lấy bắt đầu từ offset * size rồi gán qua list
            var data = query.Skip(offset).Take(size).ToList();
            //res sẽ lưu lại cái data cần thiết
            var res = new
            {
                Data = data,
                TotalRecords = total,
                Page = page,
                Size = size,
                TotalPages = totalPage
            };
            return res;
        }

        public SingleRsp DeleteUsers(String id)
        {
            var res = new SingleRsp();
            try
            {
                res.Data = _rep.Remove(id);
            }
            catch (Exception ex)
            {
                res.SetError(ex.StackTrace);
            }

            return res;
        }
        #endregion
    }
}
