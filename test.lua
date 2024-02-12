local testfn = function() 
    local opts = os.getenv("UNITTEST_ARGS") or ""
    return { "test", "butts", opts }
end
local val = testfn()
for index, data in ipairs(val) do
    print(data)
end
