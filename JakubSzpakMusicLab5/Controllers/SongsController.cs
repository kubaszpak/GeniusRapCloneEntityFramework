using JakubSzpakMusicLab5.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JakubSzpakMusicLab5.Controllers
{
    public class SongsController : Controller
    {
        private readonly DataBaseContext _context;

        public SongsController(DataBaseContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View(_context.Songs.Include(s => s.Genre).Include(s => s.Musician).ToList());
        }

        public IActionResult Show(int id)
        {
            var song = _context.Songs.Include(s => s.Musician).Include(s => s.Genre).FirstOrDefault(s => s.Id.Equals(id));

            if (song == null)
            {
                return NotFound();
            }

            return View(song);
        }

        [HttpGet]
        public IActionResult Create()
        {
            ViewBag.MusicianList = _context.Musicians.ToList();
            ViewBag.GenreList = _context.Genres.ToList();
            return View();
        }

        [HttpPost]
        public IActionResult Create(Song song)
        {
            _context.Songs.Add(song);
            _context.SaveChanges();

            return RedirectToAction(nameof(Index));
        }

        public IActionResult Delete(int id)
        {
            var song = _context.Songs.Include(s => s.Musician).Include(s => s.Genre).FirstOrDefault(s => s.Id.Equals(id));

            if (song == null)
            {
                return NotFound();
            }

            return View(song);
        }

        [HttpPost]
        public IActionResult Delete(Song song)
        {
            _context.Songs.Remove(song);
            _context.SaveChanges();

            return RedirectToAction(nameof(Index));
        }

        public IActionResult Edit(int id)
        {
            var song = _context.Songs.Include(s => s.Musician).FirstOrDefault(s => s.Id.Equals(id));

            ViewBag.GenreList = _context.Genres.ToList();
            ViewBag.MusicianList = _context.Musicians.ToList();

            if (song == null)
            {
                return NotFound();
            }

            return View(song);
        }

        [HttpPost]
        public IActionResult Edit(Song song)
        {
            if (ModelState.IsValid)
            {
                _context.Songs.Update(song);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }

            return View(song);
        }

    }
}
