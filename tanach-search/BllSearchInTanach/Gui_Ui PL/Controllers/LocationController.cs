using Microsoft.AspNetCore.Mvc;
using Enteties_Dto;
using BllSearchInTanach;

namespace Gui_Ui_PL.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class Locationcontroller : ControllerBase
    {
        [HttpGet]
        [Route("search")]
        public List<Location>? GetLocation(string str)
        {
            searchAword w=new();
            return w.searchADesiredWord(str);
        }

        [HttpGet]
        [Route("word")]
        public List<string>? GetPasukByWord(string str)
        {
            searchAword w = new();
            return w.searchInMelachim(str);
        }
        [HttpGet]
        [Route("chatuna")]
        public List<string>? GetPasukLeHazmana(string chatan,string calah) {
            searchAword w = new();
            return w.pasukLeHazmanot(chatan,calah);
        }

       
    }
}
