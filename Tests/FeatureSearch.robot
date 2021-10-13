*** Settings ***
Resource                        ../Frameworks/Routers.robot

Test Timeout                    ${DEFAULT_TEST_TIMEOUT}
Test Setup                      CommonKeywords.Start Testing        ${URL}
Test Teardown                   CommonKeywords.End Testing

*** Variables ***
${URL}                          ${HOST}

*** Test Cases ***
TC001 Search With Input Keyword
    [Documentation]  Search With Input Keyword
    [Tags]  Regression  Smoke

    Homepage.Verify Homepage Opened
    Homepage.Input 'keyword' in field search                python
    Homepage.Click search icon
    Searchpage.Validate search result

TC002 Search With Result Not Found
    [Documentation]  Search With Result Not Found
    [Tags]  Regression  Smoke

    Homepage.Verify Homepage Opened
    Homepage.Input 'keyword' in field search                blank
    Homepage.Click search icon
    Searchpage.Validate search result not found

TC003 Search With Input Keyword and Filter by Price
    [Documentation]  Search With Input Keyword and Filter by Price
    [Tags]  Regression  Smoke

    Homepage.Verify Homepage Opened
    Homepage.Input 'keyword' in field search                python
    Homepage.Click search icon
    Searchpage.Validate search result
    Searchpage.Filter by price
    Searchpage.Verify Price Is More Than MinPrice and Less Than MaxPrice        0       100000

TC004 Search With Input Keyword and Filter by Duration
    [Documentation]  Search With Input Keyword and Filter by Price
    [Tags]  Regression  Smoke

    Homepage.Verify Homepage Opened
    Homepage.Input 'keyword' in field search                python
    Homepage.Click search icon
    Searchpage.Validate search result
    Searchpage.Filter by duration
    

TC005 Search With Input Keyword and Sort by Rating
    [Documentation]  Search With Input Keyword and Sort by Rating
    [Tags]  Regression  Smoke

    Homepage.Verify Homepage Opened
    Homepage.Input 'keyword' in field search                Matematika
    Homepage.Click search icon
    Searchpage.Validate search result
    Searchpage.Sort by rating
    Searchpage.Verify Sort Rating Tertinggi

TC006 Search With Input Keyword and Sort by Review
    [Documentation]  Search With Input Keyword and Sort by Review
    [Tags]  Regression  Smoke

    Homepage.Verify Homepage Opened
    Homepage.Input 'keyword' in field search                Javascript
    Homepage.Click search icon
    Searchpage.Validate search result
    Searchpage.Sort by review
    Sleep   5

TC007 Search With Input Keyword and Sort by Latest
    [Documentation]  Search With Input Keyword and Sort by Latest
    [Tags]  Regression  Smoke

    Homepage.Verify Homepage Opened
    Homepage.Input 'keyword' in field search                Javascript
    Homepage.Click search icon
    Searchpage.Validate search result
    Searchpage.Sort by latest
    Sleep   5
    
TC008 Search With Input Keyword and Sort by Cheapest Price
    [Documentation]  Search With Input Keyword and Sort by Cheapest Price
    [Tags]  Regression  Smoke

    Homepage.Verify Homepage Opened
    Homepage.Input 'keyword' in field search                Java
    Homepage.Click search icon
    Searchpage.Validate search result
    Searchpage.Sort by cheapest
    Searchpage.Verify Sort Cheapest Price

TC009 Search With Input Keyword and Sort by Most Expensive Price
    [Documentation]  Search With Input Keyword and Sort by Most Expensive Price
    [Tags]  Regression  Smoke

    Homepage.Verify Homepage Opened
    Homepage.Input 'keyword' in field search                Bahasa Inggris
    Homepage.Click search icon
    Searchpage.Validate search result
    Searchpage.Sort by most expensive
    Searchpage.Verify Sort Most Expensive Price