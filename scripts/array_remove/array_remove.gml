function array_remove(arr, obj){
	index = array_find_index(arr, obj)
	if index != -1 {
		array_delete(arr, index, 1)
		return arr
	}
	return -1
}