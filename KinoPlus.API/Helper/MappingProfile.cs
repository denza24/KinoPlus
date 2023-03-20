﻿using AutoMapper;
using KinoPlus.Models;
using KinoPlus.Services.Database;

namespace KinoPlus.API.Helper
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<Movie, MovieDto>()
                .ForMember(x => x.Categories, options => options.MapFrom(y => y.MovieCategories.Select(z => z.Category)))
                .ForMember(x => x.Genres, options => options.MapFrom(y => y.MovieGenres.Select(z => z.Genre)))
                .ForMember(x => x.Actors, options => options.MapFrom(y => y.MovieActors.Select(z => z.Actor)))
                .ForMember(x => x.Year, options => options.MapFrom(y => y.Year.Name))
                .ForMember(x => x.Reactions, options => options.MapFrom(y => y.MovieReactions))
                .ForMember(x => x.Status, options => options.MapFrom(y => y.MovieStatus))
                .ForMember(x => x.AverageRating, options => options.MapFrom(y => CalculateAverageRating(y.MovieReactions)));

            CreateMap<MovieUpsertObject, Movie>()
                .ForMember(x => x.MovieStatusId, opt => opt.MapFrom(y => y.StatusId));

            CreateMap<Category, CategoryDto>();
            CreateMap<CategoryInsertObject, Category>();
            CreateMap<CategoryUpdateObject, Category>();

            CreateMap<Genre, GenreDto>();
            CreateMap<Actor, ActorDto>();
            CreateMap<MovieReaction, ReactionDto>();
            CreateMap<MovieStatus, MovieStatusDto>();
            CreateMap<Projection, ProjectionDto>();
        }

        public double CalculateAverageRating(IEnumerable<MovieReaction> reactions)
        {
            if (reactions.Any())
            {
                return reactions.Average(x => x.Rating);
            }
            return 0;
        }
    }
}
