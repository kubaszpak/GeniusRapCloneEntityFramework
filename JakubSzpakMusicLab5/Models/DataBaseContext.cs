﻿using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JakubSzpakMusicLab5.Models
{
    public class DataBaseContext : DbContext
    {
        public DataBaseContext(DbContextOptions<DataBaseContext> options) : base(options)
        {
        }

        public DbSet<Genre> Genres { get; set; }

        public DbSet<PlaceOfOrigin> PlacesOfOrigin { get; set; }

        public DbSet<Musician> Musicians { get; set; }

        public DbSet<Song> Songs { get; set; }
    }
}
