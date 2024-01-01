function TableSizeOf(t)
	local count = 0

	for _, _ in pairs(t) do
		count = count + 1
	end

	return count
end