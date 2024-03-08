module Playwright
  #
  # Exposes API that can be used for the Web API testing. This class is used for creating
  # `APIRequestContext` instance which in turn can be used for sending web requests. An instance
  # of this class can be obtained via [`property: Playwright.request`]. For more information
  # see `APIRequestContext`.
  class APIRequest < PlaywrightApi

    #
    # Creates new instances of `APIRequestContext`.
    def new_context(
          baseURL: nil,
          extraHTTPHeaders: nil,
          httpCredentials: nil,
          ignoreHTTPSErrors: nil,
          proxy: nil,
          storageState: nil,
          timeout: nil,
          userAgent: nil)
      raise NotImplementedError.new('new_context is not implemented yet.')
    end
  end
end
