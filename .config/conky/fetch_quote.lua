-- TODO: function that wraps text every N characters at the correct spots
-- carries word over instead of splitting it
-- cleans whitespace at the start of a line

local https = require "ssl.https"
local json = require "cjson"
local inspect = require "inspect"
--
Max_width = 40

local function fetch_quote()
        local res, code = https.request("https://api.quotable.io/quotes/random")

        if res then
                res = json.decode(res)[1]
                Content = res.content
                Author = res.author
        else
                Err_code = code
        end
end

local function str_insert(str1, str2, pos)
        return str1:sub(1, pos) .. str2 .. str1:sub(pos + 1)
end

local function wrap_string(str, max_width)
        local str_table = {}

        local smart_count = 0
        local first_letter_pos = 0
        local table_row = 1
        local last_word_letter_pos
        local update_first_letter_pos = false
        local curr_word_start_pos = nil

        print("max_width == " .. max_width .. "\n")

        local count = 1
        while count <= #str and table_row < 8 do
                local ch = str:sub(count, count)

                print("char == '" .. ch .. "' count == " .. count .. " smart_count == " .. smart_count)
                if ch == ' ' and smart_count % max_width == 0 then
                        print("continue")
                        goto continue
                end

                smart_count = smart_count + 1
                print("smart_count == " .. smart_count)

                if update_first_letter_pos then
                        update_first_letter_pos = false
                        first_letter_pos = count
                        print("first_letter_pos == " .. first_letter_pos .. " update_first_letter_pos == false")
                end

                if str:sub(count + 1, count + 1) == ' ' or count == #str then
                        last_word_letter_pos = count
                        print("last_word_letter_pos == " .. count)
                end

                if str:sub(count - 1, count - 1) == ' ' and (curr_word_start_pos == nil or last_word_letter_pos < curr_word_start_pos) and count ~= 1 then
                        curr_word_start_pos = count
                        print("curr_word_start_pos == " .. curr_word_start_pos)
                elseif curr_word_start_pos ~= nil and last_word_letter_pos >= curr_word_start_pos then
                        curr_word_start_pos = nil
                end

                if smart_count == max_width or count == #str then
                        if count == #str then
                                str_table[table_row] = str:sub(first_letter_pos, last_word_letter_pos)
                        else
                                str_table[table_row] = str:sub(first_letter_pos, last_word_letter_pos) .. '\n'
                        end

                        print("wrapped string == " .. str_table[table_row])
                        update_first_letter_pos = true
                        print("update_first_letter_pos == true")
                        table_row = table_row + 1
                        print("table_row == " .. table_row)
                        smart_count = 0
                        print("smart_count == " .. smart_count)

                        if curr_word_start_pos ~= nil and curr_word_start_pos > last_word_letter_pos then
                                count = curr_word_start_pos - 1 -- -1 to account for auto increment
                                print("count == " .. count)
                        end
                        curr_word_start_pos = nil

                        print("\n\n")
                end

                ::continue::
                count = count + 1
        end

        return table.concat(str_table)
end

function conky_get_quote()
        if Content == nil then
                fetch_quote()
                Content = wrap_string(Content, Max_width)
        end


        return Content
end

function conky_get_author()
        if Content == nil or Author == nil then
                fetch_quote()
        end

        return Author
end
