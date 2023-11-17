function freeDBResource($dbh){
    while(mysqli_next_result($dbh)){
            if($l_result = mysqli_store_result($dbh)){
              mysqli_free_result($l_result);
            }
        }
}