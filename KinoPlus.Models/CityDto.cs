﻿namespace KinoPlus.Models
{
    public class CityDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public CountryDto Country { get; set; }
    }
}