using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebCayCanh.web.Controllers
{
    using BLL;
    using DAL.Models;
    using Common.Req;
    using Common.Rsp;
    using WebCayCanh.DAL.Req;

    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        public CategoryController()
        {
            _svc = new CategorySvc();
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
        [HttpPost("create-category")]
        public IActionResult CreateCategory(CategoryReq req)
        {
            var res = _svc.CreateCategory(req);
            return Ok(res);
        }

        [HttpPost("update-category")]
        public IActionResult UpdateCategory(CategoryReq req)
        {
            var res = _svc.UpdateCategory(req);
            return Ok(res);
        }

        [HttpPost("search-category")]
        public IActionResult SearchCategory(SearchReq req)
        {
            var res = _svc.SearchCategory(req.keyWord, req.size, req.page);
            return Ok(res);
        }

        [HttpPost("delete-category")]
        public IActionResult DeleteCategory(DeleteReq req)
        {
            var res = _svc.DeleteCategory(req.id);
            return Ok(res);
        }
        private readonly CategorySvc _svc;

    }
}