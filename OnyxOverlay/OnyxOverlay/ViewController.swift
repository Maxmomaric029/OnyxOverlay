import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configuración para transparencia
        let config = WKWebViewConfiguration()
        config.preferences.javaScriptEnabled = true
        
        // Crear WebView transparente
        webView = WKWebView(frame: view.bounds, configuration: config)
        webView.backgroundColor = .clear
        webView.isOpaque = false
        webView.scrollView.backgroundColor = .clear
        webView.navigationDelegate = self
        
        // Auto-rezise
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(webView)
        
        // CARGAR TU HTML LOCAL
        if let indexPath = Bundle.main.path(forResource: "www/index", ofType: "html") {
            let url = URL(fileURLWithPath: indexPath)
            // Permitir acceso a la carpeta www
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }
}