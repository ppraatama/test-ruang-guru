*** Settings ***
Library             SeleniumLibrary
Library             OperatingSystem
Library             String

Resource            Config.robot

Resource            ../Resources/Common/Browser.robot
Resource            ../Resources/Common/CommonKeywords.robot
Resource            ../Resources/Homepage/Homepage.robot
Resource            ../Resources/Searchpage/Searchpage.robot