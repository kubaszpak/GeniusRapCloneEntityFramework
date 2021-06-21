using System.ComponentModel.DataAnnotations;

namespace JakubSzpakMusicLab5.Models
{
    public class Genre
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        [Display(Name = "Nazwa gatunku muzycznego")]
        public string FullName { get; set; }

        [MaxLength(200)]
        [Display(Name = "Czas i miejsce powstania")]
        public string CulturalOriginsDescription { get; set; }

    }
}