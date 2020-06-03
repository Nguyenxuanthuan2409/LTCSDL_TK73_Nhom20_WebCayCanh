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
    public class CustomerController : ControllerBase
    {
        public CustomerController()
        {
            _svc = new CustomerSvc();
        }

        [HttpPost("create-customer")]
        public IActionResult CreateCustomer(CustomerReq req)
        {
            var res = _svc.CreateCustomer(req);
            return Ok(res);
        }

        [HttpPost("update-customer")]
        public IActionResult UpdateCustomer(CustomerReq req)
        {
            var res = _svc.UpdateCustomer(req);
            return Ok(res);
        }

        [HttpPost("search-customer")]
        public IActionResult SearchCustomer(SearchReq req)
        {
            var res = _svc.SearchCustomer(req.keyWord, req.size, req.page);
            return Ok(res);
        }

        [HttpPost("delete-customer")]
        public IActionResult DeleteCustomer(DeleteReq req)
        {
            var res = _svc.DeleteCustomer(req.id);
            return Ok(res);
        }

        private readonly CustomerSvc _svc;
    }
}