*** Settings ***
Resource            ../../Frameworks/Routers.robot

*** Variables ***
${field_img_logo_skill_academy_homepage}       css=img[alt='Skill Academy Logo']
${button_menu_for_enterprise_homepage}         xpath=//a[@data-testid='header-enterprise-skillacademy-button']/p
${button_menu_kelas_pekerja_homepage}          xpath=//a[@href='/prakerja']/p
${button_menu_tambah_uang_saku_homepage}       xpath=//a[@href='/referral/detail?scrollTo=&activeTab=']/p
${button_menu_dropdown_kategori_homepage}      xpath=//div[@data-testid='dropdown-category']/p
${field_input_search_homepage}                 xpath=//input[@data-testid='search-input-field']
${field_img_banner_home_homepage}              css=img[alt='Home Banner Large']
${field_img_icon_search_homepage}              xpath=//div[@data-testid='search-icon']

*** Keywords ***
Verify Homepage Opened
  Wait until Element is visible       ${field_img_logo_skill_academy_homepage}
  Element should be visible           ${field_img_logo_skill_academy_homepage}
  Wait until Element is visible       ${button_menu_for_enterprise_homepage}
  Element should be visible           ${button_menu_for_enterprise_homepage}
  Wait until Element is visible       ${button_menu_kelas_pekerja_homepage}
  Element should be visible           ${button_menu_kelas_pekerja_homepage}
  Wait until Element is visible       ${button_menu_dropdown_kategori_homepage}
  Element should be visible           ${button_menu_dropdown_kategori_homepage}
  Wait until Element is visible       ${button_menu_tambah_uang_saku_homepage}
  Element should be visible           ${button_menu_tambah_uang_saku_homepage}
  Wait until Element is visible       ${field_input_search_homepage}
  Element should be visible           ${field_input_search_homepage}
  Wait until Element is visible       ${field_img_banner_home_homepage}
  Element should be visible           ${field_img_banner_home_homepage}

Input 'keyword' in field search
  [Arguments]    ${TEXT_KEYWORD_SEARCH}
  Wait until Element is visible       ${field_input_search_homepage}
  Input text                          ${field_input_search_homepage}     ${TEXT_KEYWORD_SEARCH}

Click search icon
  Wait until Element is visible       ${field_img_icon_search_homepage}
  Click Element                       ${field_img_icon_search_homepage}