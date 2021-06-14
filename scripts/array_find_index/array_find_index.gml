function array_find_index(arr, obj){
	for (var i = 0; i<array_length(arr); i++){
		if (arr[i] == obj){
			return i
		}
	}
	return -1
}