using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace JakubSzpakMusicLab5.Models
{
    public class Musician
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        [Display(Name = "Wykonawca")]
        public string FullName { get; set; }

        [Required]
        [MaxLength(4)]
        [Display(Name = "Rok urodzenia")]
        public string YearOfBirth { get; set; }

        [MaxLength(4)]
        [Display(Name = "Rok śmierci")]
        public string YearOfDeath { get; set; }

        [Required]
        public int PlaceOfOriginId { get; set; }

        [ForeignKey("PlaceOfOriginId")]
        [Display(Name = "Miejsce urodzenia")]
        public PlaceOfOrigin PlaceOfOrigin { get; set; }

        /// <summary>
        /// Kolekcja przechowująca wszystkie piosenki przyporządkowane danemu wykonawcy
        /// </summary>
        public ICollection<Song> Songs { get; set; }
    }
}
