local baz = 0
do
    local foo = 1
    print(debug.getlocal(1, 2))
end
local bar = 2
print(debug.getlocal(1, 2))

function locals()
  local variables = {}
  local idx = 1
  while true do
    local ln, lv = debug.getlocal(2, idx)
    if ln ~= nil then
      variables[ln] = lv
    else
      break
    end
    idx = 1 + idx
  end
  return variables
end

local vars = locals()

assert(vars["baz"] == 0)
assert(vars["foo"] == nil)
assert(vars["bar"] == 2)
