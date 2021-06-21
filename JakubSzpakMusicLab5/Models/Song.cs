using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace JakubSzpakMusicLab5.Models
{
    public class Song
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        [Display(Name = "Opis")]
        public string Description { get; set; }

        [Required]
        [MaxLength(10000)]
        [Display(Name = "Tekst piosenki")]
        public string Lyrics { get; set; }

        [Required]
        public int GenreId { get; set; }

        [ForeignKey("GenreId")]
        [Display(Name = "Gatunek muzyczny")]
        public Genre Genre { get; set; }

        [Required]
        [Display(Name="Id wykonawcy")]
        public int MusicianId { get; set; }

        [ForeignKey("MusicianId")]
        [Display(Name = "Wykonawca")]
        public Musician Musician { get; set; }
    }
}