   M S B A M L   `   `   `  ����N  JInventoryManagement, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullW0clr-namespace:InventoryManagement.UserControlLib"InventoryManagement.UserControlLib  5   	   9!clr-namespace:InventoryManagementInventoryManagement  5   	   %    InventoryManagement.InputWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ?uc0clr-namespace:InventoryManagement.UserControlLib     5   	   V RMaterialDesignThemes.Wpf, Version=2.5.0.1205, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   -local!clr-namespace:InventoryManagement  5   	   -   5        $��inputWindow��5   	      MaterialDesignBody#���   5	   	   $��Regular"�5
   	   $��13(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper#���  5   	     MaterialDesignFont#���  5   	    � WindowStyle$
 None=�5   	    � 
ResizeMode$ NoResize=�5   	    � Title$ 
Nhập kho��5   	   $	��450��6   $	��800��6'   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   6,   �� 5      6   .+�5   
   � $��0��6   .+�5      5   /InventoryManagement.UserControlLib.ControlBarUC  
 � Tag 6   �� *Title+ �� ElementName$ 
userWindow��6N   5      � 5   
   $��1��6    5       �� 5!      $
��auto �6    60   �� 5"      $
��auto �6    60   �� 5#      6"   .+�5%      #  MaterialDesignThemes.Wpf.Card  $��0��6"   $��5q�6/   .��5&      � .+�5'      �� $��5 5 15 5q�6�   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Tên hàng hóa��6�   	 �� 
IsEditable	 .  & "MaterialDesignFloatingHintComboBox#��[ 6�   ��6   �� *
Products+
 �� UpdateSourceTrigger$
 PropertyChanged=� �� SelectedItem 6e   �� *SelectedProduct+ �� Mode$ TwoWay=�6+  �� 5(      $��5 5 15 5q�6   $ Số lượng��5)       % !MaterialDesignFloatingHintTextBox#��[ 5*      ��5(   0   �� *Amount+$
 PropertyChanged=�5*      �� 5+      $��5 5 15 5q�6   $ Giá nhập��5,      #��[ 6H   ��5+   0   �� *
InputPrice+$
 PropertyChanged=�5,   H   �� 5-      $��5 5 15 5q�6   $ Giá xuất��5.      #��[ 6H   ��5-   0   �� *OutputPrice+$
 PropertyChanged=�5.   H   (  "System.Windows.Controls.DatePicker  5/      $��5 5 15 5q�50   !   $	��100��63   $ Ngày nhập��6?    ( $MaterialDesignFloatingHintDatePicker#��[ 51   !      SelectedDate 5/   !   �� *	InputDate+$
 PropertyChanged=�51   !   �� 52      $��5 5 15 5q�6   $ Trạng thái nhập��53      #��[ 54      ��52   0   �� *Status+$
 PropertyChanged=�54      55      56        57      $��1��6"   $��5q�6/   .��58      � .+�59      �� $��5q�6    $  MaterialDesignRaisedAccentButton#��[ 6(   $	��100��6b    � ToolTip$5 /Resource name: MaterialDesignRaisedAccentButton��5:      $��Thêm��6W   6h   �� 5;      $��5q�6   #��[ 6(   $	��100��6b   $5 /Resource name: MaterialDesignRaisedAccentButton��5<      $
��Xóa��6W   6g   �� 5=      $��5q�6   #��[ 6(   $	��100��6b   $5 /Resource name: MaterialDesignRaisedAccentButton��5>      $��Sửa��6W   6g   5?      5@        5A      $��2��6"   $��5q�6/   $��Stretch=�6:   .��5B      �� $
��Auto=�6   .��5C      �� ��6   �� *	InputList+ 6A   �� *SelectedItem+$ OneWayToSource=� �� View 5D      �� 5E      .P�5F   "   �� $	��STT��61    �� DisplayMemberBinding 6>   �� *Id+6d   �� 5G   "   $��Tên hàng hóa��61    6G   �� *Products.DisplayName+6   �� 5H   "   $��Ngày nhập��61    6D   �� *Input.InputDate+6w   �� 5I   "   $��Số lượng��61    6C   �� *Amount+6m   �� 5J   "   $��Giá nhập��61    6C   �� *
InputPrice+6q   �� 5K   "   $��Giá xuất��61    6C   �� *OutputPrice+6r   �� 5L   "   $��Trạng thái nhập��61    6J   �� *Status+6t   5M      5O      5P      5Q      5R      5S      5T      