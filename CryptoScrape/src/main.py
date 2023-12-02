from selenium import webdriver
import time

print("test")

def run_function():
    # chrome_options.set_capability("browserVersion", "112")
    # chrome_options.set_capability("platformName", "linux")
    # chrome_options.add_argument("--headless")
    # # chrome_options.add_argument("--no-sandbox")
    # chrome_options.add_argument('--ignore-certificate-errors')
    options = webdriver.FirefoxOptions()
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--ignore-ssl-errors=yes')
    options.add_argument('--ignore-certificate-errors')
    #options.set_capability("browserVersion", "113")
    #options.set_capability("platformName", "linux")

    print("before set")
    with webdriver.Remote(
        command_executor='http://localhost:4444/wd/hub',
        options = options
    ) as driver:
        # driver.set_page_load_timeout(5)
        print("before get")
        driver.get("https://www.browserstack.com/")

        html_source = driver.page_source
        print(html_source)

        driver.get("https://www.google.com/")

        html_source = driver.page_source
        print(html_source)

        time.sleep(100)

run_function()