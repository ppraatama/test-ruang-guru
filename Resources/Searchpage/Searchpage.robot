*** Settings ***
Resource            ../../Frameworks/Routers.robot

*** Variables ***
${text_total_result_search_page}                  css=[data-testid='total-result']
${field_filter_by_harga_search_page}              xpath=(//div[@data-testid='dropdown-container']//div[.='Harga'])[1]
${field_filter_by_durasi_search_page}             xpath=(//div[@data-testid='dropdown-container']//div[.='Durasi'])[1]
${field_sort_by_search_page}                      xpath=(//div[@data-testid='dropdown-container']//div[.='Pilih'])[1]
${field_empty_result_search_page}                 xpath=//div[@data-testid='empty-result-card']
${filter_by_price_search_page}                    xpath=//*[.='<100.000']
${filter_by_duration_search_page}                 xpath=//*[.='<1 jam']
${sort_by_rating_search_page}                     xpath=//*[.='Rating Tertinggi']
${sort_by_review_search_page}                     xpath=//*[.='Review Terbanyak']
${sort_by_latest_search_page}                     xpath=//*[.='Terbaru']
${sort_by_cheapest_search_page}                   xpath=//*[.='Harga Terendah']
${sort_by_most_expensive_search_page}             xpath=//*[.='Harga Tertinggi']

${text_result_price_search_page}                  //p[@data-testid='price-final']
${text_result_rating_search_page}                 //span[@data-testid='rating-text']


*** Keywords ***
Validate search result
  Wait until Element is visible       ${text_total_result_search_page}
  Element should be visible           ${text_total_result_search_page}
  Wait until Element is visible       ${field_filter_by_harga_search_page}
  Element should be visible           ${field_filter_by_harga_search_page}
  Wait until Element is visible       ${field_filter_by_durasi_search_page}
  Element should be visible           ${field_filter_by_durasi_search_page}
  Wait until Element is visible       ${field_sort_by_search_page}
  Element should be visible           ${field_sort_by_search_page}

Validate search result not found
  Wait until Element is visible       ${field_empty_result_search_page}
  Element should be visible           ${field_empty_result_search_page}
  Sleep          5

Filter by price
  Wait until Element is visible       ${field_filter_by_harga_search_page}
  Click Element                       ${field_filter_by_harga_search_page}
  Wait until Element is visible       ${filter_by_price_search_page}
  Click Element                       ${filter_by_price_search_page}

Filter by duration
  Wait until Element is visible       ${field_filter_by_durasi_search_page}
  Click Element                       ${field_filter_by_durasi_search_page}
  Wait until Element is visible       ${filter_by_duration_search_page}
  Click Element                       ${filter_by_duration_search_page}

Sort by rating
  Wait until Element is visible       ${field_sort_by_search_page}
  Click Element                       ${field_sort_by_search_page}
  Wait until Element is visible       ${sort_by_rating_search_page}
  Click Element                       ${sort_by_rating_search_page}


Sort by review
  Wait until Element is visible       ${field_sort_by_search_page}
  Click Element                       ${field_sort_by_search_page}
  Wait until Element is visible       ${sort_by_review_search_page}
  Click Element                       ${sort_by_review_search_page}


Sort by latest
  Wait until Element is visible       ${field_sort_by_search_page}
  Click Element                       ${field_sort_by_search_page}
  Wait until Element is visible       ${sort_by_latest_search_page}
  Click Element                       ${sort_by_latest_search_page}


Sort by cheapest
  Wait until Element is visible       ${field_sort_by_search_page}
  Click Element                       ${field_sort_by_search_page}
  Wait until Element is visible       ${sort_by_cheapest_search_page}
  Click Element                       ${sort_by_cheapest_search_page}


Sort by most expensive
  Wait until Element is visible       ${field_sort_by_search_page}
  Click Element                       ${field_sort_by_search_page}
  Wait until Element is visible       ${sort_by_most_expensive_search_page}
  Click Element                       ${sort_by_most_expensive_search_page}

Verify Price Is More Than MinPrice and Less Than MaxPrice
  [Arguments]    ${MinPrice}      ${maxPrice}

  Wait Until Element Is Visible                   ${text_result_price_search_page}
  ${INDEX}                Set Variable    1
  ${COUNT_ELEMENTS}       Get Element Count      ${text_result_price_search_page}
  FOR     ${ELEMENT}  IN RANGE    ${COUNT_ELEMENTS}
    Log    ${ELEMENT}
    ${ELEMENT_INDEX}    Catenate        (${text_result_price_search_page})[${INDEX}]
    ${TEXT_PRICE}    Get Text        ${ELEMENT_INDEX}
    ${TEXT_PRICE}    Remove String   ${TEXT_PRICE}   Rp  .   ,   ${SPACE}
    ${TEXT_PRICE}    Convert To Number    ${TEXT_PRICE}
    Should Be True      ${TEXT_PRICE} >= ${MinPrice}
    Should Be True      ${TEXT_PRICE} <= ${maxPrice}
    ${index}=    Evaluate    ${index} + 1
  END

Verify Sort Rating Tertinggi
  Wait Until Element Is Visible                   ${text_result_rating_search_page}
  ${INDEX}                Set Variable    1
  ${INDEX_2}              Set Variable    2
  ${COUNT_ELEMENTS}       Get Element Count      ${text_result_rating_search_page}
  FOR     ${ELEMENT}  IN RANGE    ${COUNT_ELEMENTS}-1
    Log    ${ELEMENT}
    ${ELEMENT_INDEX_1}    Catenate        (${text_result_rating_search_page})[${INDEX}]
    ${TEXT_RATING_1}      Get Text        ${ELEMENT_INDEX_1}
    ${ELEMENT_INDEX_2}    Catenate        (${text_result_rating_search_page})[${INDEX_2}]
    ${TEXT_RATING_2}      Get Text        ${ELEMENT_INDEX_2}

    IF  ${TEXT_RATING_1} < ${TEXT_RATING_2}
        Fail    Sort Failed
    END
    ${INDEX}=    Evaluate    ${INDEX} + 1
    ${INDEX_2}=  Evaluate  ${INDEX_2} + 1
  END

Verify Sort Cheapest Price
  Wait Until Element Is Visible                   ${text_result_price_search_page}
  ${INDEX}                Set Variable    1
  ${INDEX_2}              Set Variable    2
  ${COUNT_ELEMENTS}       Get Element Count      ${text_result_price_search_page}
  FOR     ${ELEMENT}  IN RANGE    ${COUNT_ELEMENTS}-1
      Log    ${ELEMENT}
      ${ELEMENT_INDEX_1}    Catenate        (${text_result_price_search_page})[${INDEX}]
      ${TEXT_1}      Get Text             ${ELEMENT_INDEX_1}
      ${TEXT_1}      Remove String        ${TEXT_1}   Rp  .   ,   ${SPACE}
      ${TEXT_1}      Convert To Number    ${TEXT_1}

      ${ELEMENT_INDEX_2}    Catenate        (${text_result_price_search_page})[${INDEX_2}]
      ${TEXT_2}      Get Text        ${ELEMENT_INDEX_2}
      ${TEXT_2}      Get Text             ${ELEMENT_INDEX_1}
      ${TEXT_2}      Remove String        ${TEXT_2}   Rp  .   ,   ${SPACE}
      ${TEXT_2}      Convert To Number    ${TEXT_2}

      IF  ${TEXT_1} > ${TEXT_2}
          Fail    Sort Cheapest Price Failed
      END
      ${INDEX}=    Evaluate    ${INDEX} + 1
      ${INDEX_2}=  Evaluate  ${INDEX_2} + 1
  END

Verify Sort Most Expensive Price
    Wait Until Element Is Visible                   ${text_result_price_search_page}
    ${INDEX}                Set Variable    1
    ${INDEX_2}              Set Variable    2
    ${COUNT_ELEMENTS}       Get Element Count      ${text_result_price_search_page}
    FOR     ${ELEMENT}  IN RANGE    ${COUNT_ELEMENTS}-1
        Log    ${ELEMENT}
        ${ELEMENT_INDEX_1}    Catenate        (${text_result_price_search_page})[${INDEX}]
        ${TEXT_1}      Get Text             ${ELEMENT_INDEX_1}
        ${TEXT_1}      Remove String        ${TEXT_1}   Rp  .   ,   ${SPACE}
        ${TEXT_1}      Convert To Number    ${TEXT_1}

        ${ELEMENT_INDEX_2}    Catenate        (${text_result_price_search_page})[${INDEX_2}]
        ${TEXT_2}      Get Text        ${ELEMENT_INDEX_2}
        ${TEXT_2}      Get Text             ${ELEMENT_INDEX_1}
        ${TEXT_2}      Remove String        ${TEXT_2}   Rp  .   ,   ${SPACE}
        ${TEXT_2}      Convert To Number    ${TEXT_2}

        Should Be True      ${TEXT_1} >= ${TEXT_2}
        ${INDEX}=    Evaluate    ${INDEX} + 1
        ${INDEX_2}=  Evaluate  ${INDEX_2} + 1
    END