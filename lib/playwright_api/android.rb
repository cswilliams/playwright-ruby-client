module Playwright
  # Playwright has **experimental** support for Android automation. You can access android namespace via:
  # 
  #
  # ```js
  # const { _android: android } = require('playwright');
  # ```
  # 
  # An example of the Android automation script would be:
  # 
  #
  # ```js
  # const { _android: android } = require('playwright');
  # 
  # (async () => {
  #   // Connect to the device.
  #   const [device] = await android.devices();
  #   console.log(`Model: ${device.model()}`);
  #   console.log(`Serial: ${device.serial()}`);
  #   // Take screenshot of the whole device.
  #   await device.screenshot({ path: 'device.png' });
  # 
  #   {
  #     // --------------------- WebView -----------------------
  # 
  #     // Launch an application with WebView.
  #     await device.shell('am force-stop org.chromium.webview_shell');
  #     await device.shell('am start org.chromium.webview_shell/.WebViewBrowserActivity');
  #     // Get the WebView.
  #     const webview = await device.webView({ pkg: 'org.chromium.webview_shell' });
  # 
  #     // Fill the input box.
  #     await device.fill({ res: 'org.chromium.webview_shell:id/url_field' }, 'github.com/microsoft/playwright');
  #     await device.press({ res: 'org.chromium.webview_shell:id/url_field' }, 'Enter');
  # 
  #     // Work with WebView's page as usual.
  #     const page = await webview.page();
  #     await page.waitForNavigation({ url: /.*microsoft\/playwright.*/ });
  #     console.log(await page.title());
  #   }
  # 
  #   {
  #     // --------------------- Browser -----------------------
  # 
  #     // Launch Chrome browser.
  #     await device.shell('am force-stop com.android.chrome');
  #     const context = await device.launchBrowser();
  # 
  #     // Use BrowserContext as usual.
  #     const page = await context.newPage();
  #     await page.goto('https://webkit.org/');
  #     console.log(await page.evaluate(() => window.location.href));
  #     await page.screenshot({ path: 'page.png' });
  # 
  #     await context.close();
  #   }
  # 
  #   // Close the device.
  #   await device.close();
  # })();
  # ```
  # 
  # Note that since you don't need Playwright to install web browsers when testing Android, you can omit browser download
  # via setting the following environment variable when installing Playwright:
  # 
  # ```sh js
  # $ PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 npm i -D playwright
  # ```
  class Android < PlaywrightApi

    # Returns the list of detected Android devices.
    def devices
      wrap_impl(@impl.devices)
    end

    # This setting will change the default maximum time for all the methods accepting `timeout` option.
    def set_default_timeout(timeout)
      raise NotImplementedError.new('set_default_timeout is not implemented yet.')
    end
    alias_method :default_timeout=, :set_default_timeout

    # -- inherited from EventEmitter --
    # @nodoc
    def off(event, callback)
      event_emitter_proxy.off(event, callback)
    end

    # -- inherited from EventEmitter --
    # @nodoc
    def once(event, callback)
      event_emitter_proxy.once(event, callback)
    end

    # -- inherited from EventEmitter --
    # @nodoc
    def on(event, callback)
      event_emitter_proxy.on(event, callback)
    end

    private def event_emitter_proxy
      @event_emitter_proxy ||= EventEmitterProxy.new(self, @impl)
    end
  end
end