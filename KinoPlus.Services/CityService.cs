﻿using KinoPlus.Models;
using KinoPlus.Services.Database;
using KinoPlus.Services.Interfaces;

namespace KinoPlus.Services
{
    public class CityService : BaseService<City, BaseSearchObject>, ICityService
    {
        public CityService(KinoplusContext context) : base(context)
        {

        }
    }
}
