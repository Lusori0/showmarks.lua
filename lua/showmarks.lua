local userMarks = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

local setMark = "<Space>m"
local jumpMark = "m"
local marksOut = vim.api.nvim_command_output('marks ' .. userMarks)
local mark_lines = marksOut:gsub("^[^\n]*\n", "")
local currentFile = vim.fn.expand('%:p')

local function getMarks()
  marks = {}

  for line in mark_lines:gmatch("([^\n]*)\n?") do
    mark = {}
    for el in line:gmatch("%S+") do
      table.insert(mark, el)
    end
    table.remove(mark, 3)
    table.insert(marks, mark)
  end
  return marks
end


vim.fn.sign_define("mark: u", {text="u", texthl="search"})
vim.fn.sign_place(12, 10,"mark: u", vim.fn.expand('%:p'))

for l, a in pairs(getMarks()) do
  for e, b in pairs(a) do
    print(e, b)
  end
end

