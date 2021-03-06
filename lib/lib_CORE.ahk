#include <lib_STRING>
#include <lib_MATH>
#include <lib_OBJ>
#include <lib_win32>

; Universal basic functions that should be accessible anywhere
class Core {

    init(){
        String := new String()
        Win32  := new Win32()
    }

    ; Returns the first non null/zero element in the arguments
    firstValid( a* ){
        for k,v in a {
            if (v){
                return v
            }
        }
    }

    ; Timer function. First call starts, second call stops and returns the delta
    cpu(){
        static count := 0
        t := Core.firstValid(count)
        DllCall("QueryPerformanceCounter", "Int64*", count)
        if (t){
            delta := count - t
            count := 0
            return delta
        }
    }
}



