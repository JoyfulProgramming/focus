on run argv
    if (count of argv) < 1 then
        error "Please provide a file name."
    end if
    set fileName to item 1 of argv
    -- Define the base path where the files are located
    set basePath to "/Users/johngallagher/Documents/Projects/flic_actions/reset_browser/"
    set fullFilePath to basePath & fileName
    set posixPath to POSIX file fullFilePath
    set urls to readURLsFromFile(posixPath)
    
    tell application "Google Chrome"
        close every window
        activate
        set newWindow to make new window
        repeat with url in urls
            delay 1 -- Optional delay to allow the page to load before opening the next URL
            tell newWindow
                make new tab with properties {URL:url}
            end tell
        end repeat
        
        -- Close the first tab, which is blank
        set blankTab to first tab of newWindow
        delete blankTab
    end tell
end run

on readURLsFromFile(filePath)
    set fileContents to read file filePath
    set urlList to paragraphs of fileContents
    return urlList
end readURLsFromFile