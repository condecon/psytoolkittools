#include "cpp11/strings.hpp"
#include "cpp11.hpp"
#include "cpp11/doubles.hpp"
#include <iostream>
#include <string.h>

using namespace std;
using namespace cpp11;


//'@export
[[cpp11::register]]
cpp11::writable::strings recode_keys_c(cpp11::writable::strings vector, strings keys){
  //Vector loop
  for(int i = 0; i < vector.size(); i++){
    
    //Keys loop
    for(int k = 0; k < keys.size(); k++){
      if(vector[i] == to_string(k+1)){
        vector[i] = keys[k];
      }
    }
  }

  return vector;
}