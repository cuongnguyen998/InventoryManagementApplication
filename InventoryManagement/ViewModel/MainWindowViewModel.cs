using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace InventoryManagement.ViewModel
{
    public class MainWindowViewModel : BaseViewModel
    {
        //Biến bool ràng buộc không cho mainWindow load lên lúc đầu
        public ICommand LoadedWindowCommand { get; set; }
        public ICommand OpenUnitWindowCommand { get; set; }
        public ICommand OpenSuppliersWindowCommand { get; set; }
        public ICommand OpenCustomersWindowCommand { get; set; }
        public ICommand OpenProductsWindowCommand { get; set; }
        public ICommand OpenUsersWindowCommand { get; set; }
        public ICommand OpenInputWindowCommand { get; set; }
        public ICommand OpenOutputWindowCommand { get; set; }
        public bool isLoaded = false;
        public MainWindowViewModel()
        {
            LoadedWindowCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                isLoaded = true;
                if (p == null)
                {
                    return;
                }
                p.Hide();
                LoginWindow loginWindow = new LoginWindow();
                loginWindow.ShowDialog();

                if (loginWindow.DataContext == null)
                {
                    return;

                }
                var loginVM = loginWindow.DataContext as LoginWindowViewModel;
                if (loginVM.IsLogin)
                {
                    p.Show();
                }
                else
                {
                    p.Close();
                }
                
            });

            OpenUnitWindowCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                UnitWindow unitWindow = new UnitWindow();
                unitWindow.ShowDialog();
            });

            OpenSuppliersWindowCommand = new RelayCommand<object>((p) => { return true; }, (p) => { SuppliersWindow sW = new SuppliersWindow(); sW.ShowDialog(); });
            OpenCustomersWindowCommand = new RelayCommand<object>((p) => { return true; }, (p) => { CustomersWindow cW = new CustomersWindow(); cW.ShowDialog(); });
            OpenProductsWindowCommand = new RelayCommand<object>((p) => { return true; }, (p) => { ProductsWindow pW = new ProductsWindow(); pW.ShowDialog(); });
            OpenUsersWindowCommand = new RelayCommand<object>((p) => { return true; }, (p) => { UsersWindow pW = new UsersWindow(); pW.ShowDialog(); });
            OpenInputWindowCommand = new RelayCommand<object>((p) => { return true; }, (p) => { InputWindow pW = new InputWindow(); pW.ShowDialog(); });
            OpenOutputWindowCommand = new RelayCommand<object>((p) => { return true; }, (p) => { OutputWindow pW = new OutputWindow(); pW.ShowDialog(); });
        }
    }
}
