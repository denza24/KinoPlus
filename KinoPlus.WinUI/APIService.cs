﻿using Flurl;
using Flurl.Http;
using KinoPlus.Models;
using KinoPlus.WinUI.Properties;

namespace eProdaja.WinUI
{
    public class APIService
    {
        private string _apiUrl = Settings.Default.ApiUrl;
        private string _resource { get; set; }
        private static string? _token { get; set; }
        public static List<MovieDto> Movies { get; set; } = new List<MovieDto>();

        public APIService(string resource)
        {
            _resource = resource;
        }

        public async Task<T?> Get<T>(object? queryParams = null)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;
                var resource = await $"{_apiUrl}{_resource}".SetQueryParams(queryParams).WithOAuthBearerToken(_token).GetJsonAsync<T>();
                Cursor.Current = Cursors.Arrow;

                return resource;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

                return default;
            }
        }

        public async Task<T?> GetById<T>(object id)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;
                var resource = await $"{_apiUrl}{_resource}/{id}".WithOAuthBearerToken(_token).GetJsonAsync<T>();
                Cursor.Current = Cursors.Arrow;

                return resource;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

                return default;
            }
        }

        public async Task<T?> Post<T>(object data)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;
                var resource = await $"{_apiUrl}{_resource}".WithOAuthBearerToken(_token).PostJsonAsync(data).ReceiveJson<T>();
                Cursor.Current = Cursors.Arrow;

                return resource;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

                return default;
            }
        }

        public async Task<T?> Update<T>(int id, object data)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;
                var resource = await $"{_apiUrl}{_resource}/{id}".WithOAuthBearerToken(_token).PutJsonAsync(data).ReceiveJson<T>();
                Cursor.Current = Cursors.Arrow;

                return resource;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

                return default;
            }
        }
        public async Task<UserDto?> Login(string korisnickoIme, string password)
        {
            var login = new LoginDto
            {
                Username = korisnickoIme,
                Password = password,
            };
            try
            {
                Cursor.Current = Cursors.WaitCursor;
                var user = await $"{_apiUrl}{_resource}/login".PostJsonAsync(login).ReceiveJson<UserDto>();
                Cursor.Current = Cursors.Arrow;

                _token = user.Token;

                return user;
            }
            catch (Exception)
            {
                MessageBox.Show("Wrong username or password");
                return default;
            }
        }
    }
}
