on readURLsFromFile(filePath)
  set fileContents to read file filePath
  set urlList to paragraphs of fileContents
  return urlList
end readURLsFromFile

set filePath to POSIX file "/Users/johngallagher/Documents/Projects/flic_actions/reset_browser/urls.txt"
set urls to readURLsFromFile(filePath)

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
end tell