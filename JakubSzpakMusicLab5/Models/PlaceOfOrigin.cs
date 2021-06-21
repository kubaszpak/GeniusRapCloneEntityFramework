using System.ComponentModel.DataAnnotations;

namespace JakubSzpakMusicLab5.Models
{
    public class PlaceOfOrigin
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        [Display(Name = "Miasto")]
        public string CityName { get; set; }

        [Required]
        [MaxLength(50)]
        [Display(Name = "Kraj")]
        public string CountryName { get; set; }
    }
}