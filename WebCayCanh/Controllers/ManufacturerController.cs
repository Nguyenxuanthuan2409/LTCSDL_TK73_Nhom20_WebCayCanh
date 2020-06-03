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
    public class ManufacturerController : ControllerBase
    {
        public ManufacturerController()
        {
            _svc = new ManufacturerSvc();
        }

        [HttpPost("create-Manufacturer")]
        public IActionResult CreateManufacturer(ManufacturerReq req)
        {
            var res = _svc.CreateManufacturer(req);
            return Ok(res);
        }

        [HttpPost("update-Manufacturer")]
        public IActionResult UpdateManufacturer(ManufacturerReq req)
        {
            var res = _svc.UpdateManufacturer(req);
            return Ok(res);
        }

        [HttpPost("search-Manufacturer")]
        public IActionResult SearchManufacturer(SearchReq req)
        {
            var res = _svc.SearchManufacturer(req.keyWord, req.size, req.page);
            return Ok(res);
        }

        [HttpPost("delete-Manufacturer")]
        public IActionResult DeleteManufacturer(DeleteReq req)
        {
            var res = _svc.DeleteManufacturer(req.id);
            return Ok(res);
        }

        private readonly ManufacturerSvc _svc;
    }
}