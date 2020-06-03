using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebCayCanh.Web.Controllers
{
    using BLL;
    using DAL.Models;
    using Common.Req;
    using Common.Rsp;
    using WebCayCanh.DAL.Req;


    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
       
            public UsersController()
        {
            _svc = new UsersSvc();
        }
        #region Get By ID
        //[HttpPost("get-by-id")]
        //public IActionResult getCategoryById([FromBody]SimpleReq req)
        //{
        //    var res = new SingleRsp();
        //    res = _svc.Read(req.Id);
        //    return Ok(res);
        //}
        //[HttpPost("get-by-all")]
        //public IActionResult getallCategory()
        //{
        //    var res = new SingleRsp();
        //    res.Data = _svc.All;
        //    return Ok(res);
        //}
        #endregion
        [HttpPost("create-Users")]
        public IActionResult CreateUsers(UsersReq req)
        {
            var res = _svc.CreateUsers(req);
            return Ok(res);
        }

        [HttpPost("update-Users")]
        public IActionResult UpdateUsers(UsersReq req)
        {
            var res = _svc.UpdateUsers(req);
            return Ok(res);
        }

        [HttpPost("search-Users")]
        public IActionResult SearchUsers(SearchReq req)
        {
            var res = _svc.SearchUsers(req.keyWord, req.size, req.page);
            return Ok(res);
        }

        [HttpPost("delete-Users")]
        public IActionResult DeleteUsers(DeleteReq req)
        {
            var res = _svc.DeleteUsers(req.id);
            return Ok(res);
        }
        private readonly UsersSvc _svc;

    }
}