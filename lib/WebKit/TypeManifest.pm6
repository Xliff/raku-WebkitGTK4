use v6.c;

use GLib::Raw::Traits;

class WebKit::TypeManifest:ver<4> does TypeManifest {

  method manifest {
    %(
      WebKitBackForwardListItem => 'WebKit::BackForwardList::Item',
      WebKitCookieManager       => 'WebKit::CookieManager',
      WebKitDownload            => 'WebKit::Download',
      WebKitFeature             => 'WebKit::Feature',
      WebKitFindController      => 'WebKit::FindController',
      WebKitHitTestResult       => 'WebKit::HitTestResult',
      WebKitITPFirstParty       => 'WebKit::ITP::FirstParty',
      WebKitITPThirdParty       => 'WebKit::ITP::ThirdParty',
      WebKitInputMethodContext  => 'WebKit::InputMethodContext',
      WebKitNetworkSession      => 'WebKit::NetworkSession',
      WebKitScriptMessageReply  => 'WebKit::ScriptMessageReply',
      WebKitSettings            => 'WebKit::Settings',
      WebKitURIRequest          => 'WebKit::URI::Request',
      WebKitURIResponse         => 'WebKit::URI::Response',
      WebKitUserContentManager  => 'WebKit::UserContentManager',
      WebKitWebContext          => 'WebKit::Web::Context',
      WebKitWebInspector        => 'WebKit::Web::Inspector',
      WebKitWebResource         => 'WebKit::Web::Resource',
      WebKitWebView             => 'WebKit::Web::View',
      WebKitWebsiteDataManager  => 'WebKit::Website::DataManager',
      WebKitWebsitePolicies     => 'WebKit::Website::Policies',
      WebKitWindowProperties    => 'WebKit::WindowProperties'
    );
  }

  method mro {
    %(
      WebKitBackForwardListItem => ['WebKit::BackForwardList::Item', 'Any', 'Mu'],
      WebKitCookieManager       => ['WebKit::CookieManager', 'Any', 'Mu'],
      WebKitDownload            => ['WebKit::Download', 'Any', 'Mu'],
      WebKitFeature             => ['WebKit::Feature', 'Any', 'Mu'],
      WebKitFindController      => ['WebKit::FindController', 'Any', 'Mu'],
      WebKitHitTestResult       => ['WebKit::HitTestResult', 'Any', 'Mu'],
      WebKitITPFirstParty       => ['WebKit::ITP::FirstParty', 'Any', 'Mu'],
      WebKitITPThirdParty       => ['WebKit::ITP::ThirdParty', 'Any', 'Mu'],
      WebKitInputMethodContext  => ['WebKit::InputMethodContext', 'Any', 'Mu'],
      WebKitNetworkSession      => ['WebKit::NetworkSession', 'Any', 'Mu'],
      WebKitScriptMessageReply  => ['WebKit::ScriptMessageReply', 'Any', 'Mu'],
      WebKitSettings            => ['WebKit::Settings', 'Any', 'Mu'],
      WebKitURIRequest          => ['WebKit::URI::Request', 'Any', 'Mu'],
      WebKitURIResponse         => ['WebKit::URI::Response', 'Any', 'Mu'],
      WebKitUserContentManager  => ['WebKit::UserContentManager', 'Any', 'Mu'],
      WebKitWebContext          => ['WebKit::Web::Context', 'Any', 'Mu'],
      WebKitWebInspector        => ['WebKit::Web::Inspector', 'Any', 'Mu'],
      WebKitWebResource         => ['WebKit::Web::Resource', 'Any', 'Mu'],
      WebKitWebView             => ['WebKit::Web::View', 'GTK::Widget', 'Any', 'Mu'],
      WebKitWebsiteDataManager  => ['WebKit::Website::DataManager', 'Any', 'Mu'],
      WebKitWebsitePolicies     => ['WebKit::Website::Policies', 'Any', 'Mu'],
      WebKitWindowProperties    => ['WebKit::WindowProperties', 'Any', 'Mu']
    );
  }

  method roles {
    %(
      WebKitBackForwardListItem => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitCookieManager       => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitDownload            => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitFeature             => ['GLib::Roles::Implementor'],
      WebKitFindController      => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitHitTestResult       => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitITPFirstParty       => ['GLib::Roles::Implementor'],
      WebKitITPThirdParty       => ['GLib::Roles::Implementor'],
      WebKitInputMethodContext  => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitNetworkSession      => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitScriptMessageReply  => ['GLib::Roles::Implementor'],
      WebKitSettings            => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitURIRequest          => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitURIResponse         => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitUserContentManager  => ['WebKit::Roles::Signals::UserContentManager', 'GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitWebContext          => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitWebInspector        => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitWebResource         => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitWebView             => ['WebKit::Roles::Signals::Web::View', 'GTK::Roles::Constraint::Target', 'GTK::Roles::Buildable', 'GTK::Roles::Accessible', 'GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitWebsiteDataManager  => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitWebsitePolicies     => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic'],
      WebKitWindowProperties    => ['GLib::Roles::Object', 'GLib::Roles::Protection', 'GLib::Roles::Implementor', 'GLib::Roles::Signals::GObject', 'GLib::Roles::Signals::Generic']
    );
  }

}
