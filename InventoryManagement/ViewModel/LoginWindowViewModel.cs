using InventoryManagement.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace InventoryManagement.ViewModel
{
    public class LoginWindowViewModel : BaseViewModel
    {
        public bool IsLogin { get; set; }
        private string _UserName;
        public string UserName { get => _UserName; set { _UserName = value; OnPropertyChanged(); } }

        private string _Password;
        public string Password { get => _Password; set { _Password = value; OnPropertyChanged(); } }
        
        public ICommand LoginCommand { get; set; }
        public ICommand PasswordChangedCommand { get; set; }

        public ICommand CancelCommand { get; set; }
        public LoginWindowViewModel()
        {
            IsLogin = false;
            UserName = "";
            Password = "";
            LoginCommand = new RelayCommand<Window>((p) => { return true; }, (p) => { Login(p); });
            PasswordChangedCommand = new RelayCommand<PasswordBox>((p) => { return true; }, (p) => { Password = p.Password; });
            CancelCommand = new RelayCommand<Window>((p) => { return true; }, (p) => { CancelLogin(p); });
        }
        void Login(Window p)
        {
            if (p == null)
            {
                return;
            }
            string passEncode = MD5Hash(Base64Encode(Password));
            var account = DataProvider.Ins.DataBase.Users.Where(currentRow => currentRow.UserName == UserName && currentRow.Password == passEncode).Count();
            if (account > 0)
            {
                IsLogin = true;
                p.Close();
            }
            else
            {
                IsLogin = false;
                MessageBox.Show("Sai tên tài khoản hoặc mật khẩu");
            }
           
        }
        void CancelLogin(Window p)
        {
            if (p==null)
            {
                return;
            }
            if (true)
            {
                IsLogin = false;
                MessageBox.Show("Bạn có chắc chắn muốn thoát?", "Thông báo", MessageBoxButton.OKCancel, MessageBoxImage.Warning, MessageBoxResult.OK, MessageBoxOptions.DefaultDesktopOnly);
                
                p.Close();
            }

        }

        //Mã hóa base64
        public static string Base64Encode(string plainText)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
            return System.Convert.ToBase64String(plainTextBytes);
        }
        //Mã hóa MD5
        public static string MD5Hash(string input)
        {
            StringBuilder hash = new StringBuilder();
            MD5CryptoServiceProvider md5provider = new MD5CryptoServiceProvider();
            byte[] bytes = md5provider.ComputeHash(new UTF8Encoding().GetBytes(input));

            for (int i = 0; i < bytes.Length; i++)
            {
                hash.Append(bytes[i].ToString("x2"));
            }
            return hash.ToString();
        }
    }
}
