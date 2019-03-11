using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace InventoryManagement.ViewModel
{
    public class ControlBarViewModel : BaseViewModel
    {
        #region Commands
        public ICommand CloseWindowCommand { get; set; }
        public ICommand MaximizeWindowCommand { get; set; }
        public ICommand MinimizeWindowCommand { get; set; }
        public ICommand MoveWindowCommand { get; set; }
        #endregion

        public ControlBarViewModel()
        {
            CloseWindowCommand = new RelayCommand<UserControl>((p) => { return p == null ? false : true; }, (p) =>
            {
                FrameworkElement window = GetWindowParent(p);
                var w = window as Window;
                if (w != null)
                {
                    w.Close();
                }
            });

            MaximizeWindowCommand = new RelayCommand<UserControl>((p) => { return p == null ? false : true; }, (p) =>
            {
                FrameworkElement window = GetWindowParent(p);
                var w = window as Window;
                if (w != null && w.WindowState != WindowState.Maximized)
                {
                    w.WindowState = WindowState.Maximized;
                }
                else if (w != null && w.WindowState == WindowState.Maximized)
                {
                    w.WindowState = WindowState.Normal;
                }
            });

            MinimizeWindowCommand = new RelayCommand<UserControl>((p) => { return p == null ? false : true; }, (p) =>
            {
                FrameworkElement window = GetWindowParent(p);
                var w = window as Window;
                if (w != null && w.WindowState != WindowState.Minimized)
                {
                    w.WindowState = WindowState.Minimized;
                }
                else if (w != null && w.WindowState == WindowState.Minimized)
                {
                    w.WindowState = WindowState.Maximized;
                }
            });

            MoveWindowCommand = new RelayCommand<UserControl>((p) => { return p == null ? false : true; }, (p) =>
              {
                  FrameworkElement window = GetWindowParent(p);
                  var w = window as Window;
                  if (w != null)
                  {
                      w.DragMove();
                  }
              });
        }

        FrameworkElement GetWindowParent(UserControl p)
        {
            FrameworkElement parent = p;
            while (parent.Parent != null)
            {
                parent = parent.Parent as FrameworkElement;

            }
            return parent;
        }
    }
}
