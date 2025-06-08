function scr_int_format(a) {
	if a >= 0 {
		if a < 10 {
			return("00" + string(a))
		} else if a < 100 {
			return("0" + string(a))
		}
	} else if a == -1 { return("---") }
	return(string(a))
}