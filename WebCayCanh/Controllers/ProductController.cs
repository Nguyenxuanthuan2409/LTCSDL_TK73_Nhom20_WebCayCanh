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
    public class ProductController : ControllerBase
    {
        public ProductController()
        {
            _svc = new ProductSvc();
        }

        [HttpPost("create-product")]
        public IActionResult CreateProduct(ProductReq req)
        {
            var res = _svc.CreateProduct(req);
            return Ok(res);
        }

        [HttpPost("update-product")]
        public IActionResult UpdateProduct(ProductReq req)
        {
            var res = _svc.UpdateProduct(req);
            return Ok(res);
        }

        [HttpPost("search-product")]
        public IActionResult SearchProduct(SearchReq req)
        {
            var res = _svc.SearchProduct(req.keyWord, req.size, req.page);
            return Ok(res);
        }

        [HttpPost("delete-product")]
        public IActionResult DeleteProduct(DeleteReq req)
        {
            var res = _svc.DeleteProduct(req.id);
            return Ok(res);
        }

        private readonly ProductSvc _svc;
    }
}