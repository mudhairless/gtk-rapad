#include once "gtkrapad/gtkrapad.bi"
using GtkRapad

dim GtkApp as TGtkApplication
dim MainWindow as TGtkWindow
dim ScrollWindow as TGtkScrollable
dim MainLayout as TGtkVBox
dim WebView as TGtkWebView

with MainWindow
    .title = "Test WebView"
    .setSize(800,600)
end with

with ScrollWindow
    .setScrollBarPolicy(GTK_POLICY_AUTOMATIC,GTK_POLICY_AUTOMATIC)
end with

WebView.setParent(ScrollWindow)
ScrollWindow.setParent(MainLayout)
MainLayout.setParent(MainWindow)

MainWindow.showAll()

WebView.uri = "http://www.google.com"

GtkApp.start( MainWindow )
