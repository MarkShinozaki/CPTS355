# Mark Shinozaki
# 11672355
# 12/19/23

from psItems import Value, ArrayValue, FunctionValue
class Operators:
    def __init__(self):
        #stack variables
        self.opstack = []  #assuming top of the stack is the end of the list
        self.dictstack = []  #assuming top of the stack is the end of the list
        
        #The builtin operators supported by our interpreter
        self.builtin_operators = {
            "stack":self.stack,
            "cleanTop":self.cleanTop,
            "opPop":self.opPop,
            "opPush":self.opPush,

           
            "lookup":self.lookup,
            "add":self.add,
            "sub":self.sub,
            "mul":self.mul,
            "mod":self.mod,
            "eq":self.eq,
            "lt":self.lt,
            "gt":self.gt,
            "length":self.length,
            "getinterval":self.getinterval,
            "putinterval":self.putinterval,
            "aload":self.aload,
            "astore":self.astore,
            "pop":self.pop,
            "dup":self.dup,
            "copy":self.copy,
            "count":self.count,
            "clear":self.clear,
            "exch":self.exch,
            "roll":self.roll,
            
            "psDict":self.psDict,

            "define":self.psDef,
            "def":self.psDef,
            "psIf":self.psIf,
            "psIfelse":self.psIfelse,
            "repeat":self.repeat,
            "forall":self.forall,
            "clearBoth":self.clearBoth,
            "if":self.psIf,
            "psIf":self.psIf,
            "ifelse":self.psIfelse,
            "psIfelse":self.psIfelse,
            



        }
    #-------  Operand Stack Operators --------------
    
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
    

    def dictPush(self,index,d):
        myvalue= (index,d)
        self.dictstack.append(myvalue)        

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
        # check if dictstack is empty
        if not self.dictstack:
            print("Error: lookup failed - dictionary stack is empty")
            return None

        # using the end of dictstack as top of stack, search for matching name
        for d in reversed(self.dictstack):
            # attempt to return matching value, otherwise iterate
            try:
                return d['/' + name]
            except KeyError:
                pass
        
           
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
        op2 = self.opPop()
        op1 = self.opPop()
        self.opPush(op1 - op2)



    """
        Pops 2 values from opstack; checks if they are numerical (int); multiplies them; and pushes the result back to opstack. 
    """    
    def mul(self):
        op2 = self.opPop()
        op1 = self.opPop()
        self.opPush(op1 * op2)

    """
        Pops 2 values from stack; checks if they are int values; calculates the remainder of dividing the bottom value by the top one; 
        pushes the result back to opstack.
    """ 
    def mod(self):
        op2 = self.opPop()
        op1 = self.opPop()
        self.opPush(op1 % op2)       
        
        
    #---------- Comparison Operators  -----------------
    """
       Pops the top two values from the opstack; pushes "True" is they are equal, otherwise pushes "False"
    """ 
    def eq(self):
        op2 = self.opPop()
        op1 = self.opPop()
        if(op2 == op1):
            self.opPush(True) 
        else:
            self.opPush(False)    

    """
       Pops the top two values from the opstack; pushes "True" if the bottom value is less than the top value, otherwise pushes "False"
    """ 
    def lt(self):
        op2 = self.opPop()
        op1 = self.opPop()
        if(op1<op2):
            self.opPush(True) 
        else:
            self.opPush(False)

    """
       Pops the top two values from the opstack; pushes "True" if the bottom value is greater than the top value, otherwise pushes "False"
    """ 
    def gt(self):
        op2 = self.opPop()
        op1 = self.opPop()
        if(op1>op2):
            self.opPush(True) 
        else:
            self.opPush(False)

   
    
    
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
    
    def getinterval(self):
        count = self.opPop()
        index = self.opPop()
        mylist = self.opPop()
        newlist = mylist.value[index:(index+count)]
        newlist2 = ArrayValue(newlist)
        self.opPush(newlist2)

    """ 
        Pops an array constant (ArrayValue), start `index` (int), and another array constant (ArrayValue) from the operand stack.  
        Replaces the slice in the bottom ArrayValue starting at `index` with the top ArrayValue (the one we popped first). 
        The result is not pushed onto the stack.
        The index is 0-based. If the end index of the slice goes beyond the array length, will give an error. 
    """
    
    def putinterval(self):
        mylist2 = self.opPop()
        index = self.opPop()
        arr1 = self.opPop()
        arr1.value[index:index+len(mylist2.value)]=mylist2.value

    """ 
        Pops an array constant (ArrayValue) from the operand stack.  
        Pushes all values in the array constant to the opstack in order (the first value in the array should be pushed first). 
        Pushes the orginal array value back on to the stack. 
    """
    
    def aload(self):
        op = self.opPop()
        for i in op.value:
            self.opPush(i)
        self.opPush(op)   
        
    """ 
        Pops an array constant (ArrayValue) from the operand stack.  
        Pops as many elements as the length of the array from the operand stack and stores them in the array constant. 
        The value which was on the top of the opstack will be the last element in the array. 
        Pushes the array value back onto the operand stack. 
    """

    def astore(self):
        op = self.opPop()
        mylen= len(op.value)
        while(len(self.opstack) >= mylen):
            i =0
            d = []
            while (i<mylen):
                d.append(self.opPop())
                i = i+1
            d.reverse()    
            self.opPush(ArrayValue(d))  
            if len(self.opstack) == mylen:
                break
            



                

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
        print("===**opstack**===")
        for i in reversed(self.opstack):
            print(i) 
        print("===**dictstack**===") 
        mylen = len(self.dictstack)
        for i in reversed(self.dictstack):
            mylen = mylen -1
            print("----%d----%d----"%(mylen,i[0]))
            #print the dict content
            if(i[1]=={}):
                pass

            else:
                mydict = i[1]
                for i in mydict:
                    print(i,end="")
                    print("  ",end="")
                    print(mydict[i])
            
    """
       Copies the top element in opstack.
    """
    def dup(self):
        op1 = self.opPop()
        self.opPush(op1)
        self.opPush(op1)


    """
       Pops an integer count from opstack, copies count number of values in the opstack. 
    """
    def copy(self):
        if len(self.opstack) > 0:
            size = self.opPop()
            if isinstance(size, int):
                if size <= len(self.opstack):
                    start = len(self.opstack)-size
                    for i in range(start,len(self.opstack)):
                        self.opPush(self.opstack[i])
                else:
                    print("Error: copy - argument cannot be larger than stack size")
            else:
                print("Error: copy - argument must be an integer")
        else:
            print("Error: copy - not enough arguments")


    """
        Counts the number of elements in the opstack and pushes the count onto the top of the opstack.
    """
 
    def count(self):
        self.opPush(len(self.opstack))

    """
       Clears the opstack.
    """
    def clear(self):
        self.opstack.clear()
        
    """
       swaps the top two elements in opstack
    """
    def exch(self):
        op2 = self.opPop()
        op1 = self.opPop()
        self.opPush(op2)
        self.opPush(op1)
        

    """
        Implements roll operator.
        Pops two integer values (m, n) from opstack; 
        Rolls the top m values in opstack n times (if n is positive roll clockwise, otherwise roll counter-clockwise)
    """
    def roll(self):
        if len(self.opstack) > 1:
            n = self.opPop()
            m = self.opPop()
            if n >= 0:
                # roll n times
                for i in range(n):
                    # move the top value on the stack into the m-th position from the top
                    self.opstack.insert(len(self.opstack) - m, self.opPop())
            else:
                # roll n times
                n = -n
                for i in range(n):
                    # get the value at m-th position from top of the stack
                    m_val = self.opstack[len(self.opstack) - m]
                    # remove the m-th value
                    del self.opstack[len(self.opstack) - m]
                    # push it to the top of the stack
                    self.opPush(m_val)
        else:
            print("Error: exch expects 2 operands")


             
    # HOMEWORK 4 PART 2

    """
       Pops an integer from the opstack (size argument) and pushes an  empty dictionary onto the opstack.
    """

    def psDict(self):
        if len(self.opstack) > 0:
            # pop size argument
            self.opPop()
            # push empty dict onto opstack
            self.opPush({})
        else:
            print("Error: opstack is empty")       

    """
       Pops the dictionary at the top of the opstack; pushes it to the dictstack.
    """
   

    def begin(self):
        if len(self.opstack) > 0:
            value = self.opPop()
            if isinstance(value, ArrayValue):
                self.dictPush(value)
            else:
                print("Error: begin - value is not a dictionary")
        else:
            print("Error: begin - opstack is empty")   
        

    """
       Removes the top dictionary from dictstack.
    """
    def end(self):
        self.dictstack.pop(-1)
        
    """
       Pops a name and a value from opstack, adds the name:value pair to the top dictionary by calling define.  
    """
    

    def psDef(self):
        if len(self.dictstack) ==0:
            self.dictPush(0,{})
        value = self.opPop()
        name = self.opPop()
        #self.dictstack[-1][name]=value  
        self.define(name,value)  
        


    # ------- if/ifelse Operators --------------
    
    # HOMEWORK 4 PART 2
    
    """
       Implements if operator. 
       Pops the `ifbody` and the `condition` from opstack. 
       If the condition is True, evaluates the `ifbody`.  
       
    """
    def psIf(self):
        if len(self.opstack) > 1:
            ifbody = self.opPop()
            condition = self.opPop()
            if isinstance(ifbody, FunctionValue) and isinstance(condition, bool):
                if(condition is True):
                    ifbody.apply(self)
            else:
                print("Error: if: invalid operands type")

    

        else:
            print("Not enough operands on the stack")
            
            
    # HOMEWORK 4 PART 2
    
    """
       Implements ifelse operator. 
       Pops the `elsebody`, `ifbody`, and the condition from opstack. 
       If the condition is True, evaluate `ifbody`, otherwise evaluate `elsebody`. 
    """
    
    def psIfelse(self):
        if len(self.opstack) > 1:
            elsebody = self.opPop()
            ifbody = self.opPop()
            condition = self.opPop()
            if isinstance(ifbody, FunctionValue) and isinstance(condition, bool):
                if(condition is True):
                    ifbody.apply(self)
                else:
                    elsebody.apply(self)
            else:
                print("Error: ifelse: invalid operands type")
        else:
            print("Error: ifelse - requires 3 operands")

    #------- Loop Operators --------------
    """
       Implements repeat operator.   
       Pops the `loop_body` (FunctionValue) and loop `count` (int) arguments from opstack; 
       Evaluates (applies) the `loopbody` `count` times. 
       Will be completed in part-2. 
    """  
   
    def repeat(self):
        if len(self.opstack) > 1:
            loop_body = self.opPop()
            count = self.opPop()
            for i in range(0, count):
                myindex = len(self.dictstack)-1
                loop_body.apply_function(self,myindex)
        else:
            print("Not enough operands on the stack")
        
        # HOMEWORK 4 PART 2
        
    """
       Implements forall operator.   
       Pops a `codearray` (FunctionValue) and an `array` (ArrayValue) from opstack; 
       Evaluates (applies) the `codearray` on every value in the `array`.  
       Will be completed in part-2. 
    """ 
    
    def forall(self):
        if len(self.opstack) > 1:
            codearray = self.opPop()
            array = self.opPop()
            for element in array.value:
                self.opPush(element)
                codearray.apply(self)
        else:
            print("Not enough operands on the stack")
                     

    """
        Helper function. Pops the top value from opstack and returns it.
    """
    def cleanTop(self):
        if len(self.opstack)>1:
            if self.opstack[-1] is None:
                self.opstack.pop()
    
    
    def clearBoth(self):
        self.opstack[:] = []
        self.dictstack[:] = []