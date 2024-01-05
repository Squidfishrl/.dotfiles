Last_quote_update = 0
local pipe = io.popen("echo $HOME")
path = pipe:read("*l")
pipe:close()
Quote_file = path .. "/.config/conky/quote.txt"
print(Quote_file)

local function get_file_modification_time()
    local pipe = io.popen("stat -c %Y " .. Quote_file)
    local last_modified = pipe:read()
    pipe:close()
    return last_modified
end

local function read_quote()
    local file = assert(io.open(Quote_file, "rb"))
    local content = file:read("*all")
    file:close()
    return content
end

function conky_get_quote()
    local quote_update_time = get_file_modification_time()
    if Last_quote_update ~= quote_update_time then
        Content = read_quote()
        Last_quote_update = quote_update_time
    end

    return Content
end
