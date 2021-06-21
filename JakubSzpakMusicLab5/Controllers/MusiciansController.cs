using JakubSzpakMusicLab5.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JakubSzpakMusicLab5.Controllers
{
    public class MusiciansController : Controller
    {

        private readonly DataBaseContext _context;

        public MusiciansController(DataBaseContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View(_context.Musicians.Include(p => p.PlaceOfOrigin).ToList());
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Musician musician)
        {
            // sprawdzanie czy w bazie danych nie istnieje już rekord z takim miastem i krajem
            PlaceOfOrigin placeOfOrigin = _context.PlacesOfOrigin.FirstOrDefault(p => (p.CityName.ToLower().Equals(musician.PlaceOfOrigin.CityName) && p.CountryName.ToLower().Equals(musician.PlaceOfOrigin.CountryName)));

            // jeśli istnieje takie miejsce to wymuś, żeby aplikacja nie tworzyła nowego rekordu z takimi samymi danymi
            if (placeOfOrigin != null)
            {

                // _context.Entry(musician.PlaceOfOrigin).State = EntityState.Unchanged;

                musician.PlaceOfOrigin = null;

                musician.PlaceOfOriginId = placeOfOrigin.Id;

            }

            // dodaj muzyka do bazy danych i jeśli nie istniało do tego momentu jego miejsce pochodzenia to również dodaj je do bazy
            _context.Musicians.Add(musician);

            _context.SaveChanges();

            return RedirectToAction(nameof(Index));
        }
    }
}
