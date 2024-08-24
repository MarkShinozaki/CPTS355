# Mark Strong-Shinozaki
# No Collaborators
# 11/15/2023

from psItems import Value, ArrayValue, FunctionValue
class Operators:
    def __init__(self):
        #stack variables
        self.opstack = []  #assuming top of the stack is the end of the list
        self.dictstack = []  #assuming top of the stack is the end of the list
        
        #The builtin operators supported by our interpreter
        self.builtin_operators = {
             # TO-DO in part1
             # include the key value pairs where the keys are the PostScript opertor names and the values are the function values that implement that operator. 
             # Make sure **not to call the functions** 
             "add":self.add,
             "sub": self.sub,
             "dict": self.psDict,
             "def": self.psDef,
             "lookup": self.lookup,
             "add": self.add,
             "sub": self.sub,
             "mul": self.mul,
             "mod": self.mod,
             "eq": self.eq,
             "lt": self.lt,
             "gt": self.gt,
             "array": self.array,
             "length": self.length,
             "getinterval": self.getinterval,
             "putinterval": self.putinterval,
             "aload": self.aload,
             "astore": self.astore,
             "pop": self.pop,
             "stack": self.stack,
             "dup": self.dup,
             "copy": self.copy,
             "count": self.count,
             "clear": self.clear,
             "exch": self.exch,
             "roll": self.roll,
             "Dict": self.psDict,
             "begin": self.begin,
             "end": self.end,
             "psDef": self.psDef,
             
        }
    #-------  Operand Stack Operators --------------
    """
        Helper function. Pops the top value from opstack and returns it.
    """
    def opPop(self):
        if len(self.opstack) > 0:
            return self.opstack.pop()
        else:
            raise ValueError("Error: opPop - opstack is empty")

    """
       Helper function. Pushes the given value to the opstack.
    """
    def opPush(self,value):
        self.opstack.append(value)
        
    #------- Dict Stack Operators --------------
    
    """
       Helper function. Pops the top dictionary from dictstack and returns it.
    """   
    def dictPop(self):
        if len(self.dictstack) > 0:
            return self.dictstack.pop()
        else:
            raise ValueError("Error: dictPop - dictstack is empty")

    """
       Helper function. Pushes the given dictionary onto the dictstack. 
    """   
    def dictPush(self,d):
        self.dictstack.append(d)

    """
       Helper function. Adds name:value pair to the top dictionary in the dictstack.
       (Note: If the dictstack is empty, first adds an empty dictionary to the dictstack then adds the name:value to that. 
    """   
    def define(self,name, value):
        if len(self.dictstack) > 0:
            top_dict = self.dictstack[-1]
            top_dict[name] = value
        else:
            # If dictstack is empty, create a new dictionary and add it to the dictstack
            new_dict = {name: value}
            self.dictstack.append(new_dict)

    """
       Helper function. Searches the dictstack for a variable or function and returns its value. 
       (Starts searching at the top of the dictstack; if name is not found returns None and prints an error message.
        Make sure to add '/' to the begining of the name.)
    """
    def lookup(self, name):
        if not name.startswith('/'):
            name = '/' + name  # Add '/' prefix if not present

        if len(self.dictstack) > 0:
            # Search from the top of the dictstack
            for d in reversed(self.dictstack):
                if name in d:
                    return d[name]

        print(f"Error: lookup - {name} not found in dictstack")
        return None

    
    #------- Arithmetic Operators --------------
    
    """
       Pops 2 values from opstack; checks if they are numerical (int); adds them; then pushes the result back to opstack. 
    """   
    def add(self):
        if len(self.opstack) > 1:
            op1 = self.opPop() # top value
            op2 = self.opPop() # bottom value
            if isinstance(op1,int) and isinstance(op2,int):
                self.opPush(op1 + op2)
            else:
                print("Error: add - one of the operands is not a number value")
                self.opPush(op2)  # bottom value
                self.opPush(op1)   # top value
        else:
            print("Error: add expects 2 operands")
 
    """
       Pop 2 values from opstack; checks if they are numerical (int); subtracts them; and pushes the result back to opstack. 
    """   
    def sub(self):
        if len(self.opstack) >= 2:
            op2 = self.opPop()
            op1 = self.opPop()
            if isinstance(op1, int) and isinstance(op2, int):
                result = op1 - op2
                self.opPush(result)
            else:
                print("Error: sub - Both operands must be numerical (int)")

    """
        Pops 2 values from opstack; checks if they are numerical (int); multiplies them; and pushes the result back to opstack. 
    """    
    def mul(self):
        if len(self.opstack) >= 2:
            op2 = self.opPop()
            op1 = self.opPop()
            if isinstance(op1, int) and isinstance(op2, int):
                result = op1 * op2
                self.opPush(result)
            else:
                print("Error: mul - Both operands must be numerical (int)")

    """
        Pops 2 values from stack; checks if they are int values; calculates the remainder of dividing the bottom value by the top one; 
        pushes the result back to opstack.
    """ 
    def mod(self):
        if len(self.opstack) >= 2:
            op2 = self.opPop()
            op1 = self.opPop()
            if isinstance(op1, int) and isinstance(op2, int):
                result = op1 % op2
                self.opPush(result)
            else:
                print("Error: mod - Both operands must be numerical (int)")
    #---------- Comparison Operators  -----------------
    """
       Pops the top two values from the opstack; pushes "True" is they are equal, otherwise pushes "False"
    """ 
    def eq(self):
        if len(self.opstack) >= 2:
            op2 = self.opPop()
            op1 = self.opPop()
            result = op1 == op2
            self.opPush(result)

    """
       Pops the top two values from the opstack; pushes "True" if the bottom value is less than the top value, otherwise pushes "False"
    """ 
    def lt(self):
        if len(self.opstack) >= 2:
            op2 = self.opPop()
            op1 = self.opPop()
            result = op1 < op2
            self.opPush(result)

    """
       Pops the top two values from the opstack; pushes "True" if the bottom value is greater than the top value, otherwise pushes "False"
    """ 
    def gt(self):
        if len(self.opstack) >= 2:
            op2 = self.opPop()
            op1 = self.opPop()
            result = op1 > op2
            self.opPush(result)

    # ------- Array Operators --------------
    """ 
       Pops the array length (an int value) from the opstack and initializes an array constant (ArrayValue) having the given length. 
       Initializes the elements in the value of the ArrayValue to None. Pushes the ArrayValue to the opstack.
    """
    def array(self):
        if len(self.opstack) > 0 and isinstance(self.opstack[-1], int):
            array_length = self.opPop()
            array_value = ArrayValue([None] * array_length)
            self.opPush(array_value)

    """ 
       Pops an array value from the operand opstack and calculates the length of it. Pushes the length back onto the opstack.
       The `length` method should support ArrayValue values.
    """
    def length(self):
        if len(self.opstack) > 0 and isinstance(self.opstack[-1], ArrayValue):
            array_value = self.opPop()
            length_value = len(array_value.value)
            self.opPush(length_value)

    """ 
        Pops the `count` (int), an (zero-based) start `index`, and an array constant (ArrayValue) from the operand stack.  
        Pushes the slice of the array of length `count` starting at `index` onto the opstack.(i.e., from `index` to `index`+`count`) 
        If the end index of the slice goes beyond the array length, will give an error. 
    """
    #NOT WORKING
    def getinterval(self):
        if len(self.opstack) >= 3 and isinstance(self.opstack[-1], int) and isinstance(self.opstack[-2], int) and isinstance(self.opstack[-3], ArrayValue):
            count = self.opPop()
            index = self.opPop()
            array = self.opPop()

            if index >= 0 and index + count <= len(array.value):
                self.opPush(ArrayValue(array.value[index:index + count]))
            else:
                print("Error: getinterval - Index out of bounds")



    """ 
        Pops an array constant (ArrayValue), start `index` (int), and another array constant (ArrayValue) from the operand stack.  
        Replaces the slice in the bottom ArrayValue starting at `index` with the top ArrayValue (the one we popped first). 
        The result is not pushed onto the stack.
        The index is 0-based. If the end index of the slice goes beyond the array length, will give an error. 
    """
    def putinterval(self):
        if len(self.opstack) > 2:
            top_array = self.opPop()
            index = self.opPop()
            bottom_array = self.opPop()

            if isinstance(top_array, ArrayValue) and isinstance(bottom_array, ArrayValue) and isinstance(index, int):
                if 0 <= index < len(bottom_array.value):
                    end_index = index + len(top_array.value)
                    bottom_array.value[index:end_index] = top_array.value
                else:
                    print("Error: putinterval - Index out of bounds")
                    self.opPush(bottom_array)  # Push back the bottom array
                    self.opPush(index)
                    self.opPush(top_array)
            else:
                self.opPush(bottom_array)
                self.opPush(index)
                self.opPush(top_array)




        
            

    """ 
        Pops an array constant (ArrayValue) from the operand stack.  
        Pushes all values in the array constant to the opstack in order (the first value in the array should be pushed first). 
        Pushes the orginal array value back on to the stack. 
    """
    def aload(self):
        if len(self.opstack) > 0 and isinstance(self.opstack[-1], ArrayValue):
            array_value = self.opPop()
            for element in array_value.value:
                self.opPush(element)
            self.opPush(array_value)
        
    """ 
        Pops an array constant (ArrayValue) from the operand stack.  
        Pops as many elements as the length of the array from the operand stack and stores them in the array constant. 
        The value which was on the top of the opstack will be the last element in the array. 
        Pushes the array value back onto the operand stack. 
    """
    def astore(self):
        if len(self.opstack) > 0 and isinstance(self.opstack[-1], ArrayValue):
            array = self.opPop()
            if len(self.opstack) >= len(array.value):
                array.value = [self.opPop() for _ in range(len(array.value))][::-1]
                self.opPush(array)
            else:
                print("Error: astore - Not enough values on the stack")

    #------- Stack Manipulation and Print Operators --------------

    """
       This function implements the Postscript "pop operator". Calls self.opPop() to pop the top value from the opstack and discards the value. 
    """
    def pop (self):
        self.opPop()

    """
       Prints the opstack. The end of the list is the top of the stack. 
    """
    def stack(self):
        print(self.opstack)

    """
       Copies the top element in opstack.
    """
    def dup(self):
        if len(self.opstack) > 0:
            top_value = self.opstack[-1]
            self.opPush(top_value)

    """
       Pops an integer count from opstack, copies count number of values in the opstack. 
    """
    def copy(self):
        if len(self.opstack) > 0 and isinstance(self.opstack[-1], int):
            count = self.opPop()
            if count >= 0:
                opstack_copy = self.opstack[-count:]
                self.opstack.extend(opstack_copy)

    """
        Counts the number of elements in the opstack and pushes the count onto the top of the opstack.
    """
    def count(self):
        count_value = len(self.opstack)
        self.opPush(count_value)

    """
       Clears the opstack.
    """
    def clear(self):
        self.opstack.clear()
        
    """
       swaps the top two elements in opstack
    """
    def exch(self):
        if len(self.opstack) >= 2:
            op1 = self.opPop()
            op2 = self.opPop()
            self.opPush(op1)
            self.opPush(op2)

    """
        Implements roll operator.
        Pops two integer values (m, n) from opstack; 
        Rolls the top m values in opstack n times (if n is positive roll clockwise, otherwise roll counter-clockwise)
    """
    def roll(self):
        if len(self.opstack) >= 2 and all(isinstance(self.opstack[-i], int) for i in range(1, 3)):
            n = self.opPop()
            m = self.opPop()
            if m > 0 and len(self.opstack) >= m:
                n %= m  # Ensure n is within the bounds of m
                if n > 0:
                    self.opstack[-m:] = self.opstack[-n:] + self.opstack[-m:-n]
                elif n < 0:
                    self.opstack[-m:] = self.opstack[-m-n:-m] + self.opstack[-m:-m-n]

    """
       Pops an integer from the opstack (size argument) and pushes an  empty dictionary onto the opstack.
    """
    def psDict(self):
        if len(self.opstack) > 0 and isinstance(self.opstack[-1], int):
            size = self.opPop()
            dictionary = {}
            self.opPush(dictionary)

    """
       Pops the dictionary at the top of the opstack; pushes it to the dictstack.
    """
    def begin(self):
        if len(self.opstack) > 0 and isinstance(self.opstack[-1], dict):
            dictionary = self.opPop()
            self.dictPush(dictionary)

    """
       Removes the top dictionary from dictstack.
    """
    def end(self):
        if len(self.dictstack) > 0:  # Check if there are dictionaries to pop
            self.dictPop()
        else:
            print("Error: end - No dictionaries to pop")

        
    """
       Pops a name and a value from opstack, adds the name:value pair to the top dictionary by calling define.  
    """
    def psDef(self):
        if len(self.opstack) > 1:
            value = self.opPop()
            name = self.opPop()
            self.define(name, value)



    # ------- if/ifelse Operators --------------
    """
       Implements if operator. 
       Pops the `ifbody` and the `condition` from opstack. 
       If the condition is True, evaluates the `ifbody`.  
    """
    def psIf(self):
        pass
        # TO-DO in part2

    """
       Implements ifelse operator. 
       Pops the `elsebody`, `ifbody`, and the condition from opstack. 
       If the condition is True, evaluate `ifbody`, otherwise evaluate `elsebody`. 
    """
    def psIfelse(self):
        pass
        # TO-DO in part2


    #------- Loop Operators --------------
    """
       Implements repeat operator.   
       Pops the `loop_body` (FunctionValue) and loop `count` (int) arguments from opstack; 
       Evaluates (applies) the `loopbody` `count` times. 
       Will be completed in part-2. 
    """  
    def repeat(self):
        pass
        #TO-DO in part2
        
    """
       Implements forall operator.   
       Pops a `codearray` (FunctionValue) and an `array` (ArrayValue) from opstack; 
       Evaluates (applies) the `codearray` on every value in the `array`.  
       Will be completed in part-2. 
    """ 
    def forall(self):
        pass
        # TO-DO in part2

    #--- used in the setup of unittests 
    def clearBoth(self):
        self.opstack[:] = []
        self.dictstack[:] = []
