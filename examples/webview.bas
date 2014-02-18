#include once "gtkrapad/gtkrapad.bi"
using GtkRapad

dim shared GtkApp as TGtkApplication
dim shared MainWindow as TGtkWindow
dim shared ScrollWindow as TGtkScrollable
dim shared MainLayout as TGtkVBox
dim shared WebView as TGtkWebView
dim shared Toolbar as TGtkToolbar
dim shared BackB as TGtkToolButton ptr
dim shared ForwardB as TGtkToolButton ptr
dim shared StopB as TGtkToolButton ptr
dim shared RefreshB as TGtkToolButton ptr
dim shared URIbox as TGtkEntry
dim shared UTI as TGtkToolItem
dim shared tsep as TGtkSeparatorToolItem
dim shared workingSpinner as TGtkSpinner
dim shared spinnerTI as TGtkToolItem

declare CALLBACK(backClicked)
declare CALLBACK(forwardClicked)
declare CALLBACK(stopClicked)
declare CALLBACK(refreshClicked)
declare CALLBACK(loadFinished)
declare CALLBACK(uriBoxActivate)
declare CALLBACK(iconloaded)
declare function canNavigate( byval wwv as any ptr, byval wwf as any ptr, byval wnr as any ptr, byval wwna as any ptr, byval wwpd as any ptr, byval __ as any ptr ) as gboolean

BackB = new TGtkToolButton(GTK_STOCK_GO_BACK)
ForwardB = new TGtkToolButton(GTK_STOCK_GO_FORWARD)
StopB = new TGtkToolButton(GTK_STOCK_STOP)
RefreshB = new TGtkToolButton(GTK_STOCK_REFRESH)

with MainWindow
    .title = "Test WebView"
    .setSize(800,600)
end with

with ScrollWindow
    .setScrollBarPolicy(GTK_POLICY_AUTOMATIC,GTK_POLICY_AUTOMATIC)
end with

BackB->setParent(Toolbar)
BackB->connect("clicked",@backClicked)
ForwardB->setParent(Toolbar)
ForwardB->connect("clicked",@forwardClicked)
StopB->setParent(Toolbar)
StopB->connect("clicked",@stopClicked)
RefreshB->setParent(Toolbar)
RefreshB->connect("clicked",@refreshClicked)

URIbox.setParent(UTI)
URIbox.connect("activate",@uriBoxActivate)
UTI.setParent(Toolbar)
UTI.expand = true

tsep.drawn = true
tsep.expand = false
tsep.setParent(Toolbar)

workingSpinner.setParent(spinnerTI)
spinnerTI.setParent(Toolbar)
spinnerTI.expand = false
spinnerTI.homogeneous = true
workingSpinner.start()

WebView.setParent(ScrollWindow)
WebView.connect("load-finished",@loadFinished)
WebView.connect("navigation-requested",RAPAD_CALLBACK(canNavigate))
WebView.connect("icon-loaded",@iconloaded)
MainLayout.addChild(Toolbar,false,false,0)
ScrollWindow.setParent(MainLayout)
MainLayout.setParent(MainWindow)

MainWindow.showAll()
MainWindow.setFocus(WebView)

URIbox.text = "http://www.google.com"
WebView.uri = "http://www.google.com"

GtkApp.start( MainWindow )

delete BackB
delete ForwardB
delete StopB
delete RefreshB

CALLBACK(backClicked)
    if WebView.canGoBack = true then WebView.goBack()
ENDCALLBACK

CALLBACK(forwardClicked)
    if WebView.canGoForward = true then WebView.goForward()
ENDCALLBACK

CALLBACK(stopClicked)
    WebView.stop()
ENDCALLBACK

CALLBACK(refreshClicked)
    WebView.reload(true)
ENDCALLBACK

CALLBACK(loadFinished)

    if WebView.title <> "" then
        MainWindow.title = WebView.title & " | Test WebView"
    else
        MainWindow.title = "Loading... | Test WebView"
    end if
    workingSpinner.stop()
    URIbox.text = WebView.uri

ENDCALLBACK

CALLBACK(uriBoxActivate)

    WebView.uri = URIbox.text
    workingSpinner.start()

ENDCALLBACK

CALLBACK(iconloaded)
    MainWindow.setIcon(WebView.iconPixbuf)
    URIbox.iconPixbuf(GTK_ENTRY_ICON_PRIMARY) = WebView.iconPixbuf
ENDCALLBACK

function canNavigate( byval wwv as any ptr, byval wwf as any ptr, byval wnr as any ptr, byval wwna as any ptr, byval wwpd as any ptr, byval __ as any ptr ) as gboolean
    workingSpinner.start()
    return FALSE
end function
