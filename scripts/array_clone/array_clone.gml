function array_clone(arr, arr2){
	arr = []
	for(var i=0; i<array_length(arr2); i++){
		array_push(arr, arr2[i])
	}
	return arr
}