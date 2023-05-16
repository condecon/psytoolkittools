#include "cpp11.hpp"
#include "cpp11/strings.hpp"
#include <iostream>

using namespace std;


//'@export
[[cpp11::register]] 
cpp11::writable::strings recode_status_c(cpp11::strings status_vector, std::string correct, std::string error, std::string timeout)
{
    cpp11::writable::strings return_vector = cpp11::writable::strings();
        
    for (int i = 0; i < status_vector.size(); i++)
    {
        std::string x = "0";

        if (status_vector[i] == "1")
        {
            x = correct;
        }

        if (status_vector[i] == "2")
        {
            x = error;
        }

        if (status_vector[i] == "3")
        {
            x = timeout;
        }
        
        return_vector.insert(i, x);
        
    }

    return return_vector;
}